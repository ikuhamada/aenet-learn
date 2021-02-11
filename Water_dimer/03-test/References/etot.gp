set terminal postscript eps color 'Helvetica' 24
set output 'etot_h4o2.eps'
set encoding iso
xmin=2
xmax=14
emin=-1196.1
emax=-1195.6
set xrange [xmin:xmax]
set yrange [emin:emax]
set xlabel 'Distance (\305)'
set ylabel 'Total energy (eV)'
plot 'etot_true.dat'    using ($1):($2) with points title 'DFT' pt 13 ps 2 lc rgb 'black',\
     'etot_predict.dat' using ($1):($2) with points title 'ANN' pt 12 ps 2 lc rgb 'blue'
