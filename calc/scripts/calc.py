from ase.build import bulk
from ase.io.trajectory import Trajectory
from ase.optimize.sciopt import SciPyFminCG
from ase.constraints import UnitCellFilter

from sevenn.sevennet_calculator import SevenNetCalculator

import copy

import numpy as np
import os
import pandas as pd
import sys
import yaml


def load_conf(conf_yaml):
  with open(conf_yaml,'r') as inp:
    inp_yaml = yaml.safe_load(inp)
    return inp_yaml

def save_conf(conf_yaml, file_name):
  with open(file_name,'w') as out:
    yaml.dump(conf_yaml, out, default_flow_style=False)

def relax(atoms, logfile, trajfile, fmax=0.02):
    optimizer = SciPyFminCG(atoms, logfile=logfile, trajectory=trajfile)
    optimizer.run(fmax=fmax)
    
def main(path, models):
    conf = load_conf('inp.yaml')
    system = sys.argv[1]
    structure = sys.argv[2]
    
    print(f'Running {system} in {structure} structure\n')
    
    a = conf[system][structure]['a']
    c = conf[system][structure]['c']
    df = pd.DataFrame()

    for model in models:
        print(f'Running {model}\n')
        calculator = SevenNetCalculator(model=os.path.join(path, f'{model}.pth'))
        atoms = bulk(name=system, crystalstructure=structure, a=a, c=c)
        atoms.calc = calculator
       
        print('Relaxing the structure, constant volume = False, 6 components of the tensor is relaxed\n')
        relax_filter = UnitCellFilter(atoms, mask = [True]*6, constant_volume = False)
        relax(relax_filter, logfile=f'{system}-{structure}-{model}_relax.log', trajfile=f'{system}-{structure}-{model}_relax.traj')
        print('Relaxation done\n')
        cell = atoms.get_cell() 
        traj = Trajectory(f'{system}-{structure}-{model}.traj', 'w')
        volumes = []
        energies = [] 
        
        for f in np.linspace(0.95, 1.05, 11):
            atoms0 = copy.deepcopy(atoms)
            atoms0.set_cell(cell*f, scale_atoms=True)
            eos_filter = UnitCellFilter(atoms0, mask = [False]*6, constant_volume = True) 
            relax(eos_filter, logfile=f'{system}-{structure}-{model}_fixVol.log', trajfile=f'{system}-{structure}-{model}_fixVol.traj')
            atoms0.get_potential_energy(force_consistent = True)
            traj.write(atoms0)
            
            if structure == 'hcp':
                volumes.append(atoms0.get_volume()/2)
                energies.append(atoms0.get_potential_energy(force_consistent=True)/2)
            else:
                volumes.append(atoms0.get_volume())
                energies.append(atoms0.get_potential_energy(force_consistent=True))

        df[f'vol-{model}'] = volumes
        df[f'energy-{model}'] = energies

    df.to_csv(f'{system}-{structure}.csv', index=0)

if __name__ == '__main__':
    path = 'models'
    models = ['l3i3','l3i5','l4i3', 'l2i5']
    main(path, models)
