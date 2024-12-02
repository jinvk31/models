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

output_file="kpoints.out"
echo "kpts,energy" > $output_file

dir_0="input0"
incar="INCAR"
poscar="POSCAR"
potcar="POTCAR"

write_kpoints() {
    kpts="$1"
	cat > KPOINTS << EOF
Automatic mesh
0
Monkhorst-Pack
$kpts $kpts $kpts 
0 0 0
EOF
}

# for i in "$@"; do
#     dir=kpts/KP$i
#     mkdir -p $dir
#     cd $dir_0
#     cp $incar $poscar $potcar ../$dir
#     cd ../$dir
#     write_kpoints $i
#     echo "implementing convergence test for kpoints $i $i $i"
#     mpiexec.hydra -np $SLURM_NTASKS /TGM/Apps/VASP/VASP_BIN/6.3.2/vasp.6.3.2.std.x >& stdout.x
#     cd ../../

# done
# echo "K-point convergence test completed"

for i in "$@"; do
    dir=kpts/KP$i
    cd $dir
    echo "entering $dir"
    NIONS=$(grep "NIONS" OUTCAR | cut -d'=' -f3 | tr -d ' ')
    TOTEN=$(grep "TOTEN" OUTCAR | tail -1 | cut -d'=' -f2 | tr -d ' ' | tr -d 'eV')
    TOTPERION=$(echo "scale=10; $TOTEN / $NIONS" | bc)
    cd ../../
    echo "KP$i,$TOTPERION" >> $output_file
    
done
echo "Results written to $output_file"
