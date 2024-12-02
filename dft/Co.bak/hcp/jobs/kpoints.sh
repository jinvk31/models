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

get_kpoints() {
    case $1 in
        6) echo "6 6 4" ;;
        8) echo "8 8 6" ;;
        10) echo "10 10 8" ;;
        12) echo "12 12 8" ;;
        14) echo "14 14 10" ;;
        16) echo "16 16 12" ;;
        18) echo "18 18 12" ;;
        *) echo "Error: Unsupported k-point grid value $1"; exit 1 ;;
    esac
}

write_kpoints() {
    local kpts="$1"
	cat > KPOINTS << EOF
Automatic mesh
0
Gamma
$kpts 
0 0 0
EOF
}



# for i in "$@"; do
#     dir=kpts/KP$i
#     mkdir -p $dir
#     cd $dir_0
#     cp $incar $poscar $potcar ../$dir
#     cd ../$dir
#     kpt_grid=$(get_kpoints $i)
#     write_kpoints "$kpt_grid"
#     echo "implementing convergence test for kpoints $kpt_grid"
#     mpiexec.hydra -np $SLURM_NTASKS /TGM/Apps/VASP/VASP_BIN/6.3.2/vasp.6.3.2.std.x >& stdout.x
#     cd ../../

# done
# echo "K-point convergence test completed"

for i in "$@"; do
    kpt_grid=$(get_kpoints $i)
    dir=kpts/KP$i
    cd $dir
    echo "entering $dir"
    NIONS=$(grep "NIONS" OUTCAR | cut -d'=' -f3 | tr -d ' ')
    TOTEN=$(grep "TOTEN" OUTCAR | tail -1 | cut -d'=' -f2 | tr -d ' ' | tr -d 'eV')
    TOTPERION=$(echo "scale=10; $TOTEN / $NIONS" | bc)
    cd ../../
    echo "$kpt_grid,$TOTPERION" >> $output_file
done
echo "Results written to $output_file"
