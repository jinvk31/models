from ase.io import read, write
import numpy as np
import os

# def main():
#     eqn = read("relax/CONTCAR")
#     eqn_vol = eqn.get_volume()
#     num_points = 7
#     volume_factors = np.linspace(0.95, 1.05, num_points)

#     for factor in volume_factors:
#         target_volume = eqn_vol * factor
#         scaling_factor = (target_volume / eqn_vol) ** (1/3)
#         scaled = eqn.copy()
#         scaled.set_cell(scaled.cell * scaling_factor, scale_atoms=True)
        
#         write(os.path.join("eos",f"{str(int(factor*100))}", "POSCAR"), scaled, format="vasp")

def main():
   num_points = 7
   volume_factors = np.linspace(0.95, 1.05, num_points)
   for factor in volume_factors:
       path = os.path.join("eos",f"{str(int(factor*100))}")
       structure = read(os.path.join(path, "POSCAR"))
       print(f"volume factor: {factor}, volume: {structure.get_volume()}\n") 
        
if __name__ == "__main__":
    main()