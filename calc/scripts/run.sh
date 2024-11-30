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

for mat in "${materials[@]}"; do
    /TGM/Apps/ANACONDA/2022.05/envs/pub_sevenn/bin/python calc.py $mat "fcc" 
done
