#!/bin/sh
# Generate a report.dat file using the script in scripts/benchamarks-report.lua.
# The code is a bit clunky because I don't understand how LUA works in some use cases.
# Usange example: ./generate-report.sh http://localhost:8080/updates\?queries\=3

# Rates (-R parameter)
declare -a arr=(100 1000 5000 10000 50000)

for r in "${arr[@]}"
do
  ./wrk -c 100 -d 30 -t 2 -R ${r} -s scripts/benchmarks-report.lua ${1} -- ${r}
   sed -i -e "s:__PLACEHOLDER__:${r}:" report.dat
done
