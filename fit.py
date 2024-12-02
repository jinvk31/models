import matplotlib.pyplot as plt
import numpy as np
import os
import pandas as pd
from scipy.optimize import curve_fit 
import sys

def birch_murnaghan_energy(V, E0, V0, B0, B0_prime):
    eta = (V0 / V)**(2/3)  # Strain factor
    term1 = (eta - 1)**2
    term2 = 6 + 4 * eta * (B0_prime - 4)
    return E0 + (9 * V0 * B0 / 16) * term1 * term2
  
  
def fit_bm():
    if sys.argv[1] == 'Pt':
        E0 = 
        B0 = 240
    elif sys.argv[1] == 'Co':
        E0 = 
        B0 = 180


def plot(df1, df2, model):
    fig, axs = plt.subplots(figsize=(7,7))
    plt.rc('font', family='Arial')
    
    axs.scatter(df1['volumes'], df1['energies'], label='DFT (FCC)', color='#0022ff', marker='o', s=50, alpha=0.8)
    axs.scatter(df1['volumes'], df1['energies'], label='DFT (HCP)', color='#ff5100', marker='o',s=50, alpha=0.8)

    axs.scatter(df2[f'vol-{model}'], df2['energy-l3i3'], label=f'7net-chgTot-{model} (FCC)', color='#0022ff', marker='^',s=50, alpha=0.8)
    axs.scatter(df2[f'vol-{model}']/2, df2['energy-l3i3']/2, label=f'7net-chgTot-{model} (HCP)', color='#ff5100', marker='^', s=50, alpha=0.8)
    
    axs.set_ylabel("Potential energy (eV/atom)", fontsize=14, labelpad=0, fontweight='bold')
    axs.set_xlabel('Volume ' +r'($\mathbf{\AA^3/atom}$)', fontsize=14, labelpad=-1, fontweight='bold') 
    axs.tick_params( axis="x", direction="in", width=1.5, length=7, labelsize=13, pad=2) 
    axs.tick_params( axis="y", direction="in", width=1.5, length=7, labelsize=13, pad=2)  

    axs.legend(frameon=False, fontsize=12)

    axs.spines['top'].set_linewidth(2)
    axs.spines['bottom'].set_linewidth(2) 
    axs.spines['left'].set_linewidth(2)
    axs.spines['right'].set_linewidth(2)    
    
    fig.savefig(f'{sys.argv[1]}-{model}.png')
    
       
def main():
    system = sys.argv[1] # 'Co', 'Pt'
    fcc_svn = pd.read_csv(f'data/svn/{system}-fcc.csv')
    hcp_svn = pd.read_csv(f'data/svn/{system}-hcp.csv')
    fcc_dft = pd.read_csv(f'data/dft/{system}-fcc.out', index_col = 0)
    hcp_dft = pd.read_csv(f'data/dft/{system}-hcp.out', index_col = 0)
    fcc_dft.columns = ['volumes', 'energies']
    hcp_dft.columns = ['volumes', 'energies']
    
    
if __name__ == '__main__':
      main()   