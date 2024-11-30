#!/bin/bash
#SBATCH --job-name=lain     # Job name
#SBATCH --output=calc_%j.log      # Output file (%j will be replaced with job ID)
#SBATCH --error=calc_%j.log        # Error file (%j will be replaced with job ID)
#SBATCH --nodes=1                                # Number of nodes
#SBATCH --ntasks=24                              # Total number of tasks (MPI processes)
#SBATCH --time=04:00:00                          # Time limit hrs:min:sec
#SBATCH --partition=loki3           # Partition name (update based on your cluster)

echo "SLURM_NTASKS: $SLURM_NTASKS"

if [ -z "$SLURM_NTASKS" ] || [ "$SLURM_NTASKS" -le 0 ]; then
    echo "Error: SLURM_NTASKS is not set or is less than or equal to 0"
    exit 1
fi
materials=("Co" "Pt")
structures=("fcc" "hcp")
volumes=("95" "96" "98" "100" "101" "103" "105")

for mat in "${materials[@]}"; do
    cd $mat
    for struct in "${structures[@]}"; do
        cd $struct
        echo "entering $mat/$struct .."
        
        output_file="$mat.$struct.out"
        echo"ratio,volume,energy" > $output_file
        
        # /TGM/Apps/ANACONDA/2022.05/envs/pub_sevenn/bin/python ../../../eos.py
        
        for vol in "${volumes[@]}"; do
            # mkdir -p eos/$vol 
            # cp relax/KPOINTS eos/$vol
            # cp relax/POTCAR eos/$vol
            # cp input0/INCAR.eos eos/$vol/INCAR
            # echo "copied KPOINTS, POTCAR, and INCAR file for eos calculation"
        
            cd eos/$vol
            
            # echo "calculating $mat/$struct at $vol % volume"
            # mpiexec.hydra -np "$SLURM_NTASKS" /TGM/Apps/VASP/VASP_BIN/6.3.2/vasp.6.3.2.std.x >& stdout.x        
            NIONS=$(grep "NIONS" OUTCAR | cut -d'=' -f3 | tr -d ' ')
            TOTEN=$(grep "TOTEN" OUTCAR | tail -1 | cut -d'=' -f2 | tr -d ' ' | tr -d 'eV')
            TOTPERION=$(echo "scale=10; $TOTEN / $NIONS" | bc)
            VOLUME=$(grep "volume of cell" OUTCAR | tail -1 | awk '{print $5}')
            VOLPERION=$(echo "scale=10; $VOLUME / $NIONS" | bc)

            cd ../..
            echo "$vol,$VOLPERION,$TOTPERION" >> $output_file
        done
        cp $output_file ../../
        cd ..
    done
    cd ..
done
