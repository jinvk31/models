from ase.build import bulk

from ase.io import read, write
atoms = read('POSCAR')
# atoms = bulk('Co', 'hcp', a = 2.47, c = 8.07)
print(atoms.get_positions())
print(atoms.get_cell_lengths_and_angles())
cell = atoms.get_cell()
print(cell.to_conventional())
# print(type(atoms))
# print(len(atoms))

# write('POSCAR', atoms, format='vasp')



