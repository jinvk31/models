from ase.io import read, write
import sys

atoms = read(sys.argv[1])
volume=atoms.get_volume()
print(len(atoms))
write("POSCAR", atoms, format = "vasp")
