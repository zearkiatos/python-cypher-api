set terminal png size 600
set output "/home/data/reports/report_decipher.png"
set title "1000 request, 300 request concurrencies"
set size ratio 0.6
set grid y
set xlabel "Numbers of requests"
set ylabel "Response time (ms)"
plot "output.csv" using 9 smooth sbezier with lines title "http://server/decipher"
