#!/bin/bash
#SBATCH --job-name=cnv      # Job name
#SBATCH --output=calc_%j.log      # Output file (%j will be replaced with job ID)
#SBATCH --error=calc_%j.log        # Error file (%j will be replaced with job ID)
#SBATCH --nodes=1                                # Number of nodes
#SBATCH --ntasks=24                              # Total number of tasks (MPI processes)
#SBATCH --time=04:00:00                          # Time limit hrs:min:sec
#SBATCH --partition=loki3		  	 # Partition name (update based on your cluster)

echo "SLURM_NTASKS: $SLURM_NTASKS"

if [ -z "$SLURM_NTASKS" ] || [ "$SLURM_NTASKS" -le 0 ]; then
	echo "Error: SLURM_NTASKS is not set or is less than or equal to 0"
	exit 1
fi

output_file="cutoff.out"
echo "encut,energy" > $output_file

dir_0="input0"
kpoints="KPOINTS"
poscar="POSCAR"
potcar="POTCAR"

write_incar() {
    encut="$1"
    cat > INCAR << EOF
 SYSTEM = Co fcc 
   NWRITE =      2    write-flag
   ISTART =      0    job   : 0-new, 1-cont, 2-samecut
   ICHARG =      2    charge: 0-wave, 1-file, 2-atom, >10-const
   INIWAV =      1    electr: 0-lowe 1-rand  2-diag

 Electronic Relaxation:
   ENCUT  = $encut     energy cutoff in eV
   PREC   = Accurate      normal | accurate
   ADDGRID = .FALSE.  (use fine grid)

   NELM   =   100     number of ELM steps
   EDIFF  =  1E-06    energy stopping-criterion for ELM
   LREAL  =  .FALSE.      real-space projection (.FALSE., .TRUE., On, Auto)
   ALGO   =  Normal     Normal, Fast, Very_Fast
   LWAVE  = .FALSE.
   LCHARG = .FALSE.

 Ionic Relaxation:
   NSW    =     0       max number of geometry steps
   IBRION =     -1     ionic relax: 0-MD, 1-quasi-Newton, 2-CG, 3-Damped MD
   EDIFFG =   -0.02  force (eV/A) stopping-criterion for geometry steps
   ISIF   =     2     (1:force=y stress=trace only ions=y shape=n volume=n)
   ISYM   =     1     (1-use symmetry, 0-no symmetry)

 DOS related values:
   ISMEAR =     1     (-1-Fermi, 1-Methfessel/Paxton)
   SIGMA  =     0.2   broadening in eV
   # LORBIT = 11

 Parallelization:
   NPAR = 4

 Magnetism:
   ISPIN = 2
   MAGMOM = 2*3
   
EOF
}

for i in "$@"; do
    dir=cutoff/en$i
    mkdir -p $dir
    cd $dir_0
    cp $kpoints $poscar $potcar ../$dir
    cd ../$dir
    write_incar $i
    echo "running vasp for ENCUT $i"
    mpiexec.hydra -np $SLURM_NTASKS /TGM/Apps/VASP/VASP_BIN/6.3.2/vasp.6.3.2.std.x >& stdout.x
    cd ../../

done
echo "CUTOFF test completed"

for i in "$@"; do
    dir=cutoff/en$i
    cd $dir
    echo "entering $dir"
    NIONS=$(grep "NIONS" OUTCAR | cut -d'=' -f3 | tr -d ' ')
    TOTEN=$(grep "TOTEN" OUTCAR | tail -1 | cut -d'=' -f2 | tr -d ' ' | tr -d 'eV')
    TOTPERION=$(echo "scale=10; $TOTEN / $NIONS" | bc)
    cd ../../
    echo "$i   $TOTPERION" >> $output_file
    
done
echo "Results written to $output_file"
