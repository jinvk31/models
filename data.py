import numpy as np
import pandas as pd

import sys

system = sys.argv[1] # 'Co', 'Pt'

def preprocess(system):
    fcc_svn = pd.read_csv(f'data/svn/{system}-fcc.csv')
    hcp_svn = pd.read_csv(f'data/svn/{system}-hcp.csv')
    fcc_dft = pd.read_csv(f'data/dft/{system}-fcc.out')
    hcp_dft = pd.read_csv(f'data/dft/{system}-hcp.out')
    fcc_dft.columns = ['ratio','vol-fcc', 'energy-fcc']
    hcp_dft.columns = ['ratio', 'vol-hcp', 'energy-hcp']
    dft_df = pd.concat([fcc_dft, hcp_dft], axis=1)
    dft_df.to_csv(f'data/dft/{system}.csv')
    
    return dft_df, fcc_svn, hcp_svn

def normalize_energies(df1, df2, df3, models =['l3i3', 'l3i4', 'l3i5']):
    dft_fcc = df1['energy-fcc'].to_numpy()
    dft_hcp = df1['energy-hcp'].to_numpy()
    l3i3_fcc = df2['energy-l3i3'].to_numpy()
    l3i3_hcp = df3['energy-l3i3'].apply(lambda x: x/2).to_numpy()
    l4i3_fcc = df2['energy-l4i3'].to_numpy()
    l4i3_hcp = df3['energy-l4i3'].apply(lambda x: x/2).to_numpy()
    l3i5_fcc = df2['energy-l3i5'].to_numpy()
    l3i5_hcp = df3['energy-l3i5'].apply(lambda x: x/2).to_numpy()
    energies = np.concatenate([dft_fcc, dft_hcp, l3i3_fcc, l3i3_hcp, l4i3_fcc, l4i3_hcp, l3i5_fcc, l3i5_hcp])
    min_energy = np.min(energies)
    
     
    dft_fcc_rel = dft_fcc - min_energy
    dft_hcp_rel = dft_hcp - min_energy
    l3i3_fcc_rel = l3i3_fcc - min_energy
    l3i3_hcp_rel = l3i3_hcp - min_energy
    l4i3_fcc_rel = l4i3_fcc - min_energy
    l4i3_hcp_rel = l4i3_hcp - min_energy
    l3i5_fcc_rel = l3i5_fcc - min_energy
    l3i5_hcp_rel = l3i5_hcp - min_energy
   
    
    df1['energy-fcc-rel'] = dft_fcc_rel
    df1['energy-hcp-rel'] = dft_hcp_rel
    df2['energy-l3i3-rel'] = l3i3_fcc_rel
    df3['energy-l3i3-rel'] = l3i3_hcp_rel
    df2['energy-l4i3-rel'] = l4i3_fcc_rel
    df3['energy-l4i3-rel'] = l4i3_hcp_rel
    df2['energy-l3i5-rel'] = l3i5_fcc_rel
    df3['energy-l3i5-rel'] = l3i5_hcp_rel
    
    df1.to_csv(f'data/dft_{system}.csv')
    df2.to_csv(f'data/svn_{system}-fcc.csv')
    df3.to_csv(f'data/svn_{system}-hcp.csv')
    
def main():
    dft_df, fcc_svn, hcp_svn = preprocess(system)
    normalize_energies(dft_df, fcc_svn, hcp_svn)
    
if __name__ == '__main__':
    main()  