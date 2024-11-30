 ----------------------------------------------------
    OOO  PPPP  EEEEE N   N M   M PPPP
   O   O P   P E     NN  N MM MM P   P
   O   O PPPP  EEEEE N N N M M M PPPP   -- VERSION
   O   O P     E     N  NN M   M P
    OOO  P     EEEEE N   N M   M P
 ----------------------------------------------------
 running   24 mpi-ranks, with    1 threads/rank
 distrk:  each k-point on   24 cores,    1 groups
 distr:  one band on    1 cores,   24 groups
 vasp.6.3.2 27Jun22 (build Aug 12 2022 00:53:59) complex                        
  
 POSCAR found type information on POSCAR Pt
 POSCAR found :  1 types and       2 ions
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
DAV:   1     0.141518669004E+03    0.14152E+03   -0.23236E+04  3384   0.127E+03
DAV:   2    -0.113483012185E+02   -0.15287E+03   -0.15207E+03  3576   0.276E+02
DAV:   3    -0.127448644772E+02   -0.13966E+01   -0.13919E+01  4248   0.336E+01
DAV:   4    -0.127497763558E+02   -0.49119E-02   -0.49109E-02  5040   0.178E+00
DAV:   5    -0.127497774584E+02   -0.11026E-05   -0.11032E-05  4512   0.266E-02    0.197E+01
DAV:   6    -0.120753085864E+02    0.67447E+00   -0.26471E+00  3480   0.101E+01    0.599E+00
DAV:   7    -0.120423277672E+02    0.32981E-01   -0.14482E-01  4608   0.200E+00    0.185E+00
DAV:   8    -0.120400551569E+02    0.22726E-02   -0.72570E-03  3600   0.914E-01    0.254E-01
DAV:   9    -0.120398830063E+02    0.17215E-03   -0.24125E-04  4632   0.102E-01    0.306E-02
DAV:  10    -0.120398972792E+02   -0.14273E-04   -0.10548E-05  3984   0.246E-02    0.103E-02
DAV:  11    -0.120398968980E+02    0.38122E-06   -0.12002E-06  3840   0.881E-03
   1 F= -.12039897E+02 E0= -.12037539E+02  d E =-.120399E+02
 curvature:   0.00 expect dE= 0.000E+00 dE for cont linesearch  0.000E+00
 trial: gam= 0.00000 g(F)=  0.175E-46 g(S)=  0.157E-01 ort = 0.000E+00 (trialstep = 0.100E+01)
 search vector abs. value=  0.157E-01
 bond charge predicted
       N       E                     dE             d eps       ncg     rms          rms(c)
DAV:   1    -0.127955102429E+02   -0.75561E+00   -0.18853E+01  3360   0.401E+01    0.110E+01
DAV:   2    -0.120300803585E+02    0.76543E+00   -0.31826E+00  3360   0.124E+01    0.155E+00
DAV:   3    -0.120192751958E+02    0.10805E-01   -0.94474E-02  3672   0.218E+00    0.169E+00
DAV:   4    -0.120257329876E+02   -0.64578E-02   -0.71312E-03  3576   0.621E-01    0.349E-01
DAV:   5    -0.120261053837E+02   -0.37240E-03   -0.22444E-04  5040   0.920E-02    0.265E-02
DAV:   6    -0.120261113240E+02   -0.59403E-05   -0.12853E-06  3648   0.923E-03    0.210E-03
DAV:   7    -0.120261116193E+02   -0.29533E-06   -0.13142E-07  2088   0.269E-03
   2 F= -.12026112E+02 E0= -.12023896E+02  d E =0.137853E-01
 trial-energy change:    0.013785  1 .order    0.014286   -0.015706    0.044278
 step:   0.2717(harm=  0.2618)  dis= 0.00000  next Energy=   -12.042041 (dE=-0.214E-02)
 bond charge predicted
       N       E                     dE             d eps       ncg     rms          rms(c)
DAV:   1    -0.124560089896E+02   -0.42990E+00   -0.10161E+01  3360   0.298E+01    0.614E+00
DAV:   2    -0.120417689015E+02    0.41424E+00   -0.18134E+00  3360   0.909E+00    0.741E-01
DAV:   3    -0.120385830064E+02    0.31859E-02   -0.48895E-02  3624   0.156E+00    0.734E-01
DAV:   4    -0.120420518925E+02   -0.34689E-02   -0.34447E-03  3504   0.373E-01    0.213E-02
DAV:   5    -0.120420612117E+02   -0.93192E-05   -0.18711E-05  4992   0.300E-02    0.157E-02
DAV:   6    -0.120420622647E+02   -0.10530E-05   -0.97920E-07  3552   0.707E-03    0.135E-03
DAV:   7    -0.120420621732E+02    0.91520E-07   -0.54111E-08  1968   0.161E-03
   3 F= -.12042062E+02 E0= -.12039745E+02  d E =-.216528E-02
 curvature:  -0.13 expect dE=-0.132E-04 dE for cont linesearch -0.185E-06
 ZBRENT: interpolating
 opt :   0.2742  next Energy=   -12.042062 (dE=-0.217E-02)
 bond charge predicted
       N       E                     dE             d eps       ncg     rms          rms(c)
DAV:   1    -0.120420668210E+02   -0.45563E-05   -0.11236E-04  3408   0.984E-02    0.228E-02
DAV:   2    -0.120420619159E+02    0.49051E-05   -0.19436E-05  3360   0.301E-02    0.281E-03
DAV:   3    -0.120420619861E+02   -0.70151E-07   -0.58785E-07  1752   0.543E-03
   4 F= -.12042062E+02 E0= -.12039745E+02  d E =-.216509E-02
 curvature:  -0.13 expect dE=-0.128E-04 dE for cont linesearch -0.153E-06
 ZBRENT: interpolating
 opt :   0.3013  next Energy=   -12.042064 (dE=-0.217E-02)
 bond charge predicted
       N       E                     dE             d eps       ncg     rms          rms(c)
DAV:   1    -0.120426079843E+02   -0.54607E-03   -0.13961E-02  3360   0.110E+00    0.255E-01
DAV:   2    -0.120420378496E+02    0.57013E-03   -0.24033E-03  3360   0.335E-01    0.315E-02
DAV:   3    -0.120420322121E+02    0.56376E-05   -0.74260E-05  3672   0.606E-02    0.355E-02
DAV:   4    -0.120420404465E+02   -0.82344E-05   -0.50796E-06  3504   0.151E-02    0.160E-03
DAV:   5    -0.120420406019E+02   -0.15544E-06   -0.33848E-08  2016   0.137E-03
   5 F= -.12042041E+02 E0= -.12039728E+02  d E =-.214370E-02
 curvature:  -1.57 expect dE=-0.423E-03 dE for cont linesearch -0.234E-03
 ZBRENT: interpolating
 opt :   0.2764  next Energy=   -12.042062 (dE=-0.217E-02)
 bond charge predicted
       N       E                     dE             d eps       ncg     rms          rms(c)
DAV:   1    -0.120425423895E+02   -0.50194E-03   -0.11798E-02  3360   0.101E+00    0.233E-01
DAV:   2    -0.120420682116E+02    0.47418E-03   -0.20321E-03  3360   0.308E-01    0.285E-02
DAV:   3    -0.120420612515E+02    0.69601E-05   -0.62458E-05  3648   0.556E-02    0.321E-02
DAV:   4    -0.120420622924E+02   -0.10409E-05   -0.43304E-06  3504   0.139E-02    0.105E-03
DAV:   5    -0.120420622314E+02    0.60990E-07   -0.26606E-08  1824   0.120E-03
   6 F= -.12042062E+02 E0= -.12039746E+02  d E =-.216533E-02
 curvature:  -0.00 expect dE=-0.105E-06 dE for cont linesearch -0.256E-08
 ZBRENT: interpolating
 opt :   0.2751  next Energy=   -12.042062 (dE=-0.217E-02)
 bond charge predicted
       N       E                     dE             d eps       ncg     rms          rms(c)
DAV:   1    -0.120420636954E+02   -0.14030E-05   -0.32717E-05  3432   0.532E-02    0.124E-02
DAV:   2    -0.120420625519E+02    0.11435E-05   -0.56705E-06  3456   0.163E-02    0.150E-03
DAV:   3    -0.120420624739E+02    0.78054E-07   -0.17223E-07  1728   0.293E-03
   7 F= -.12042062E+02 E0= -.12039746E+02  d E =-.216558E-02
 curvature:  -0.02 expect dE=-0.249E-05 dE for cont linesearch -0.331E-07
 ZBRENT: interpolating
 opt :   0.2746  next Energy=   -12.042062 (dE=-0.217E-02)
 bond charge predicted
       N       E                     dE             d eps       ncg     rms          rms(c)
DAV:   1    -0.120420625293E+02    0.22675E-07   -0.39533E-06  3408   0.184E-02    0.429E-03
DAV:   2    -0.120420624268E+02    0.10250E-06   -0.70919E-07  1704   0.577E-03
   8 F= -.12042062E+02 E0= -.12039746E+02  d E =-.216553E-02
 curvature:  -0.02 expect dE=-0.225E-05 dE for cont linesearch -0.420E-07
 ZBRENT: interpolating
 opt :   0.2744  next Energy=   -12.042062 (dE=-0.217E-02)
 bond charge predicted
       N       E                     dE             d eps       ncg     rms          rms(c)
DAV:   1    -0.120420624602E+02    0.69081E-07   -0.85855E-07  1680   0.888E-03    0.182E-03
DAV:   2    -0.120420624268E+02    0.33365E-07   -0.19442E-07  1680   0.303E-03
   9 F= -.12042062E+02 E0= -.12039746E+02  d E =-.216553E-02
 curvature:  -0.01 expect dE=-0.696E-06 dE for cont linesearch -0.560E-08
 ZBRENT: interpolating
 opt :   0.2743  next Energy=   -12.042062 (dE=-0.217E-02)
 bond charge predicted
       N       E                     dE             d eps       ncg     rms          rms(c)
DAV:   1    -0.120420624096E+02    0.50613E-07   -0.92435E-08  1680   0.298E-03    0.512E-04
DAV:   2    -0.120420623964E+02    0.13201E-07   -0.26298E-08  1680   0.112E-03
  10 F= -.12042062E+02 E0= -.12039746E+02  d E =-.216550E-02
 curvature:  -0.01 expect dE=-0.606E-06 dE for cont linesearch -0.131E-08
 ZBRENT: interpolating
 opt :   0.2742  next Energy=   -12.042062 (dE=-0.217E-02)
 bond charge predicted
       N       E                     dE             d eps       ncg     rms          rms(c)
DAV:   1    -0.120420623871E+02    0.22524E-07   -0.67139E-08  1680   0.246E-03    0.402E-04
DAV:   2    -0.120420623797E+02    0.73242E-08   -0.14967E-08  1680   0.845E-04
  11 F= -.12042062E+02 E0= -.12039746E+02  d E =-.216548E-02
 curvature:  -0.01 expect dE=-0.114E-05 dE for cont linesearch -0.139E-08
 ZBRENT: bisectioning
 opt :   0.2742  next Energy=   -12.042062 (dE=-0.217E-02)
 bond charge predicted
       N       E                     dE             d eps       ncg     rms          rms(c)
DAV:   1    -0.120420623714E+02    0.15691E-07   -0.48730E-09  1680   0.681E-04    0.164E-04
DAV:   2    -0.120420623661E+02    0.52405E-08   -0.16064E-09  1680   0.280E-04
  12 F= -.12042062E+02 E0= -.12039746E+02  d E =-.216547E-02
 curvature:  -0.01 expect dE=-0.682E-06 dE for cont linesearch -0.310E-09
 ZBRENT: bisectioning
 opt :   0.2742  next Energy=   -12.042062 (dE=-0.217E-02)
 bond charge predicted
       N       E                     dE             d eps       ncg     rms          rms(c)
DAV:   1    -0.120420623609E+02    0.10452E-07   -0.14981E-09  1680   0.368E-04    0.104E-04
DAV:   2    -0.120420623583E+02    0.26266E-08   -0.40452E-10  1680   0.142E-04
  13 F= -.12042062E+02 E0= -.12039746E+02  d E =-.216546E-02
 curvature:  -0.00 expect dE=-0.495E-06 dE for cont linesearch -0.140E-09
 ZBRENT: bisectioning
 opt :   0.2742  next Energy=   -12.042062 (dE=-0.217E-02)
 bond charge predicted
       N       E                     dE             d eps       ncg     rms          rms(c)
DAV:   1    -0.120420623551E+02    0.58008E-08   -0.38015E-10  1680   0.184E-04    0.766E-05
DAV:   2    -0.120420623545E+02    0.65666E-09   -0.10271E-10  1680   0.715E-05
  14 F= -.12042062E+02 E0= -.12039746E+02  d E =-.216546E-02
 curvature:  -0.00 expect dE=-0.349E-06 dE for cont linesearch -0.727E-10
 trial: gam= 0.00748 g(F)=  0.191E-46 g(S)=  0.994E-04 ort =-0.180E-04 (trialstep = 0.855E+00)
 search vector abs. value=  0.100E-03
 bond charge predicted
       N       E                     dE             d eps       ncg     rms          rms(c)
DAV:   1    -0.120430145536E+02   -0.95220E-03   -0.39516E-02  3408   0.145E+00    0.184E-01
DAV:   2    -0.120422140311E+02    0.80052E-03   -0.13878E-03  3624   0.226E-01    0.587E-02
DAV:   3    -0.120421098842E+02    0.10415E-03   -0.32210E-04  4416   0.987E-02    0.138E-02
DAV:   4    -0.120421105865E+02   -0.70234E-06   -0.33855E-06  3744   0.161E-02
  15 F= -.12042111E+02 E0= -.12039782E+02  d E =-.482321E-04
 trial-energy change:   -0.000048  1 .order   -0.000056   -0.000085   -0.000028
 step:   1.2681(harm=  1.2681)  dis= 0.00000  next Energy=   -12.042125 (dE=-0.630E-04)
 reached required accuracy - stopping structural energy minimisation
 writing wavefunctions
