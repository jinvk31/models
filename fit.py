import matplotlib.pyplot as plt
import numpy as np
import os
import pandas as pd
import scipy.optimize as opt
import sys

def birch_murnaghan(V, V0, B0, B0_prime):
    term1 = (V0 / V)**(7/3) - (V0 / V)**(5/3)
    term2 = 1 + 3/4 * (B0_prime - 4) * ((V0 / V)**(2/3) - 1)
    return 3/2 * B0 * term1 * term2

def main():
  system = sys.argv[1] # 'Co', 'Pt'
  fcc_svn = pd.read_csv(f'data/svn/{system}-fcc.csv')
  hcp_svn = pd.read_csv(f'data/svn/{system}-hcp.csv')
  fcc_dft = pd.read_csv(f'data/dft/{system}-fcc.out', index_col = 0)
  hcp_dft = pd.read_csv(f'data/dft/{system}-hcp.out', index_col = 0)
  fcc_dft.columns = ['volumes', 'energies']
  hcp_dft.columns = ['volumes', 'energies']
  
  fig, axs = plt.subplots(figsize=(7,7))
  plt.rc('font', family='Arial')
  
  axs.scatter(fcc_dft['volumes'], fcc_dft['energies'], label='dft fcc', color='#0022ff', s=50, alpha=0.8)
  axs.scatter(hcp_dft['volumes'], hcp_dft['energies'], label='dft hcp', color='#ff5100', s=50, alpha=0.8)

  axs.scatter(fcc_svn['vol-l3i3'], fcc_svn['energy-l3i3'], label='l3i3 fcc', color='#268e3c', s=50, alpha=0.8)
  axs.scatter(hcp_svn['vol-l3i3']/4, hcp_svn['energy-l3i3'], label='l3i3 hcp', color='#053d11', s=50, alpha=0.8)

  axs.scatter(fcc_svn['vol-l4i3'], fcc_svn['energy-l4i3'], label='l4i3 fcc', color='#8e268c', s=50, alpha=0.8)
  axs.scatter(hcp_svn['vol-l4i3']/4, hcp_svn['energy-l4i3'], label='l4i3 hcp', color='#ff89d2', s=50, alpha=0.8)

  axs.scatter(fcc_svn['vol-l3i5'], fcc_svn['energy-l3i5'], label='l3i5 fcc', color='#deff07', s=50, alpha=0.8)
  axs.scatter(hcp_svn['vol-l3i5']/4, hcp_svn['energy-l3i5'], label='l3i5 hcp', color='#777509', s=50, alpha=0.8)

 
  axs.set_ylabel("Energy (eV/atom)", fontsize=14, labelpad=0, fontweight='bold')
  axs.set_xlabel('Volume ' +r'($\mathbf{\AA^3/atom}$)', fontsize=14, labelpad=-1, fontweight='bold') 
  axs.tick_params( axis="x", direction="in", width=1.5, length=7, labelsize=13, pad=2) 
  axs.tick_params( axis="y", direction="in", width=1.5, length=7, labelsize=13, pad=2)  

  axs.legend(frameon=False, fontsize=12)

  axs.spines['top'].set_linewidth(2)
  axs.spines['bottom'].set_linewidth(2) 
  axs.spines['left'].set_linewidth(2)
  axs.spines['right'].set_linewidth(2)    
  
  fig.savefig('fit.png')
if __name__ == '__main__':
    main()   