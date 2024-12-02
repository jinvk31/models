from ase.build import bulk

from ase.io import read, write
atoms = bulk('Co', 'hcp', a = 2.47, c = 8.07)
print(atoms.get_positions())
print(atoms.get_cell())
# print(type(atoms))
# print(len(atoms))

# write('POSCAR', atoms, format='vasp')



