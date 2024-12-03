import matplotlib.pyplot as plt
import numpy as np
import os
import pandas as pd
from scipy.optimize import curve_fit 
# import sys

def birch_murnaghan_energy(V, E0, V0, B0, B0_prime):
    eta = (V0 / V)**(2/3)  # Strain factor
    term1 = (eta - 1)
    term2 = 6 - 4 * eta
    return E0 + (9 * V0 * B0 / 16) * (term1**3 * B0_prime + term1**2 * term2)
  
  
def fit_bm(system, volume_data, energy_data, verbose=False, maxfev=10000):
    if system == 'Pt':
        E0 = 0 
        V0 = 15 
        B0 = 1 
        B0_prime = 5 
    else:
        E0 = 0 
        V0 = 10 
        B0 = 1 
        B0_prime = 8 
    
    initial_guess = [E0, V0, B0, B0_prime]
    params, covariance, infodict, mesg, ier = curve_fit(f=birch_murnaghan_energy, xdata=volume_data, ydata=energy_data, p0=initial_guess, full_output=True, maxfev=maxfev)
    
    if verbose:
        print(f"Fit Information:")
        print(f"  Number of function evaluations: {infodict['nfev']}")
        print(f"  Infodict: {infodict}\n")
        print(f"  Fit message: {mesg}\n")
        print(f"  Fit success: {ier}\n")
     
    E0_fit, V0_fit, B0_fit, B0_prime_fit = params
    
    print(f"Fitted Parameters:")
    print(f"  E0 = {E0_fit:.6f} eV/atom")
    print(f"  V0 = {V0_fit:.6f} Å³/atom")
    print(f"  B0 = {B0_fit:.6f} eV/Å³")
    print(f"  B0' = {B0_prime_fit:.6f}\n")

    volume_fit = np.linspace(min(volume_data), max(volume_data), 200)
    energy_fit = birch_murnaghan_energy(volume_fit, *params)
   
    return volume_fit, energy_fit

def plot(system, df1, df2, df3, model):
    fig, axs = plt.subplots(figsize=(7,7))
    plt.rc('font', family='Arial')
    
    axs.scatter(df1['vol-fcc'], df1['energy-fcc-rel'], label='DFT (FCC)', color='#0022ff', marker='o', s=50, alpha=0.8)
    axs.scatter(df1['vol-hcp'], df1['energy-hcp-rel'], label='DFT (HCP)', color='#ff5100', marker='o',s=50, alpha=0.8)
    print(f"dft -{system} -fcc")
    dft_fcc_fit = fit_bm(system, volume_data=df1['vol-fcc'], energy_data=df1['energy-fcc-rel'])
 
    print(f"dft -{system} -hcp")
    dft_hcp_fit = fit_bm(system, volume_data=df1['vol-hcp'], energy_data=df1['energy-hcp-rel'])
    
    axs.plot(dft_fcc_fit[0], dft_fcc_fit[1], color='#0022ff', linestyle='--', linewidth=1.5)
    axs.plot(dft_hcp_fit[0], dft_hcp_fit[1], color='#ff5100', linestyle='--', linewidth=1.5)  
    
    axs.scatter(df2[f'vol-{model}'], df2[f'energy-{model}-rel'], label=f'7net-chgTot-{model} (FCC)', color='#0022ff', marker='^',s=50, alpha=0.8)
    axs.scatter(df3[f'vol-{model}'], df3[f'energy-{model}-rel'], label=f'7net-chgTot-{model} (HCP)', color='#ff5100', marker='^', s=50, alpha=0.8)
    print(f"7net-chgTot-{model} -{system} -fcc")
    svn_fcc_fit = fit_bm(system, volume_data=df2[f'vol-{model}'], energy_data=df2[f'energy-{model}-rel'])
    print(f"7net-chgTot-{model} -{system} -hcp")
    svn_hcp_fit = fit_bm(system, volume_data=df3[f'vol-{model}'], energy_data=df3[f'energy-{model}-rel'])
    axs.plot(svn_fcc_fit[0], svn_fcc_fit[1], color='#0022ff', linestyle='-', linewidth=1.5)
    axs.plot(svn_hcp_fit[0], svn_hcp_fit[1], color='#ff5100', linestyle='-', linewidth=1.5)
   
    if system == 'Co':
        axs.set_xlim(9, 12.75)
        axs.set_ylim(-0.05,0.3)
    else:
        axs.set_xlim(13, 18.5)
        axs.set_ylim(-0.1,0.5)
    
    axs.set_ylabel("Potential energy (eV/atom)", fontsize=14, labelpad=0, fontweight='bold')
    axs.set_xlabel('Volume ' +r'($\mathbf{\AA^3/atom}$)', fontsize=14, labelpad=-1, fontweight='bold') 
    axs.tick_params( axis="x", direction="in", width=1.5, length=7, labelsize=13, pad=2) 
    axs.tick_params( axis="y", direction="in", width=1.5, length=7, labelsize=13, pad=2)  

    axs.legend(fontsize=12)

    axs.spines['top'].set_linewidth(2)
    axs.spines['bottom'].set_linewidth(2) 
    axs.spines['left'].set_linewidth(2)
    axs.spines['right'].set_linewidth(2)    
    
    fig.savefig(f'plots/{system}-{model}.png')
    
       
def main():
    systems = ['Co','Pt'] # sys.argv[1] # 'Co', 'Pt'
    models = ['l3i3', 'l4i3', 'l3i5'] # sys.argv[2] # 'l3i3', 'l4i3', 'l3i5'    
   
    for system in systems:
        for model in models: 
            fcc_svn = pd.read_csv(f'data/svn_{system}-fcc.csv')
            hcp_svn = pd.read_csv(f'data/svn_{system}-hcp.csv')
            dft = pd.read_csv(f'data/{system}_dft.csv') 
            try:
                plot(system=system, df1=dft, df2=fcc_svn, df3=hcp_svn, model=model) 
            except Exception as e:
                print(f"Error: {e}\n")
                continue
            
if __name__ == '__main__':
      main()   
