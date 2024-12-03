from ase.io import read, write
import copy
import numpy as np
import os

def main():
    atoms = read("relax/CONTCAR")
    cell = atoms.get_cell() 
    num_points = 11 
    volume_factors = np.linspace(0.95, 1.05, num_points)

    for factor in volume_factors:
        scaled = copy.deepcopy(atoms)
        scaled.set_cell(cell * factor, scale_atoms=True)
        write(os.path.join("eos",f"{str(int(factor*100))}", "POSCAR"), scaled, format="vasp")

# def main():
#    num_points = 7
#    volume_factors = np.linspace(0.95, 1.05, num_points)
#    for factor in volume_factors:
#        path = os.path.join("eos",f"{str(int(factor*100))}")
#        structure = read(os.path.join(path, "POSCAR"))
#        print(f"volume factor: {factor}, volume: {structure.get_volume()}\n") 
        
if __name__ == "__main__":
    main()
