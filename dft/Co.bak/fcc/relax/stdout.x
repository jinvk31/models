 ----------------------------------------------------
    OOO  PPPP  EEEEE N   N M   M PPPP
   O   O P   P E     NN  N MM MM P   P
   O   O PPPP  EEEEE N N N M M M PPPP   -- VERSION
   O   O P     E     N  NN M   M P
    OOO  P     EEEEE N   N M   M P
 ----------------------------------------------------
 running   24 mpi-ranks, with    1 threads/rank
 distrk:  each k-point on   24 cores,    1 groups
 distr:  one band on    6 cores,    4 groups
 vasp.6.3.2 27Jun22 (build Aug 12 2022 00:53:59) complex                        
  
 POSCAR found type information on POSCAR Co
 POSCAR found :  1 types and       1 ions
 Reading from existing POTCAR
 scaLAPACK will be used
 Reading from existing POTCAR
 LDA part: xc-table for Pade appr. of Perdew
 POSCAR, INCAR and KPOINTS ok, starting setup
 FFT: planning ... GRIDC
 FFT: planning ... GRID_SOFT
 FFT: planning ... GRID
 WAVECAR not read
 entering main loop
       N       E                     dE             d eps       ncg     rms          rms(c)
DAV:   1     0.234792726666E+02    0.23479E+02   -0.35603E+03  2948   0.786E+02
DAV:   2    -0.705456733308E+01   -0.30534E+02   -0.28586E+02  3084   0.139E+02
DAV:   3    -0.780094981564E+01   -0.74638E+00   -0.74461E+00  3448   0.251E+01
DAV:   4    -0.780847079417E+01   -0.75210E-02   -0.75194E-02  3376   0.223E+00
DAV:   5    -0.780865997361E+01   -0.18918E-03   -0.18918E-03  3784   0.324E-01    0.114E+01
DAV:   6    -0.720327077465E+01    0.60539E+00   -0.11767E+01  3740   0.448E+01    0.436E+00
DAV:   7    -0.703675851754E+01    0.16651E+00   -0.13348E+00  3592   0.140E+01    0.246E+00
DAV:   8    -0.702560991436E+01    0.11149E-01   -0.15140E-02  3800   0.991E-01    0.114E+00
DAV:   9    -0.701970358562E+01    0.59063E-02   -0.55003E-03  4584   0.583E-01    0.249E-01
DAV:  10    -0.701913350286E+01    0.57008E-03   -0.32735E-04  4336   0.117E-01    0.328E-02
DAV:  11    -0.701913403149E+01   -0.52863E-06   -0.20837E-05  3668   0.479E-02    0.331E-02
DAV:  12    -0.701913442758E+01   -0.39609E-06   -0.18744E-06  3384   0.145E-02
   1 F= -.70191344E+01 E0= -.70183907E+01  d E =-.701913E+01  mag=     1.5864
 curvature:   0.00 expect dE= 0.000E+00 dE for cont linesearch  0.000E+00
 trial: gam= 0.00000 g(F)=  0.844E-64 g(S)=  0.622E-04 ort = 0.000E+00 (trialstep = 0.100E+01)
 search vector abs. value=  0.622E-04
 bond charge predicted
       N       E                     dE             d eps       ncg     rms          rms(c)
DAV:   1    -0.702009464551E+01   -0.96061E-03   -0.15617E-02  3620   0.174E+00    0.249E-01
DAV:   2    -0.701931046285E+01    0.78418E-03   -0.10078E-02  3664   0.119E+00    0.158E-01
DAV:   3    -0.701914479217E+01    0.16567E-03   -0.97707E-04  3464   0.397E-01    0.754E-02
DAV:   4    -0.701913067753E+01    0.14115E-04   -0.38836E-06  3292   0.181E-02    0.224E-02
DAV:   5    -0.701911969303E+01    0.10985E-04   -0.15839E-05  4204   0.232E-02    0.425E-03
DAV:   6    -0.701911947175E+01    0.22128E-06   -0.11888E-07  1852   0.383E-03
   2 F= -.70191195E+01 E0= -.70183784E+01  d E =0.149558E-04  mag=     1.5845
 trial-energy change:    0.000015  1 .order    0.000012   -0.000062    0.000087
 step:   0.4172(harm=  0.4172)  dis= 0.00000  next Energy=    -7.019147 (dE=-0.130E-04)
 bond charge predicted
       N       E                     dE             d eps       ncg     rms          rms(c)
DAV:   1    -0.701948053629E+01   -0.36084E-03   -0.53019E-03  3636   0.102E+00    0.145E-01
DAV:   2    -0.701921005897E+01    0.27048E-03   -0.34539E-03  3672   0.694E-01    0.923E-02
DAV:   3    -0.701915303539E+01    0.57024E-04   -0.33680E-04  3452   0.233E-01    0.442E-02
DAV:   4    -0.701914781690E+01    0.52185E-05   -0.13478E-06  3108   0.107E-02    0.132E-02
DAV:   5    -0.701914351534E+01    0.43016E-05   -0.53560E-06  2636   0.136E-02    0.262E-03
DAV:   6    -0.701914373102E+01   -0.21568E-06   -0.17818E-07  1688   0.416E-03
   3 F= -.70191437E+01 E0= -.70184007E+01  d E =-.930344E-05  mag=     1.5856
 curvature:  -0.21 expect dE=-0.133E-06 dE for cont linesearch -0.133E-06
 trial: gam= 0.00000 g(F)=  0.955E-70 g(S)=  0.640E-06 ort =-0.631E-05 (trialstep = 0.883E+00)
 search vector abs. value=  0.640E-06
 reached required accuracy - stopping structural energy minimisation
 writing wavefunctions
