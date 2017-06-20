# input: data/hep-th.mtx
# output: hepth.hipmcl



../bin/hipmcl -M ../data/hep-th.mtx -I 2 -p .0001 -S 1100 -R 1400 -pct .9 -base 0 -rand 0 -phases 1 -o hepth.out

../bin/mclconvert -M ../test/hepth.out -o ../test/hepth.hipmcl

rm ../test/hepth.out
