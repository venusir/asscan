#!/bin/bash

git pull

chmod +x CloudflareST

cat /dev/null > proxy.txt

for ips in $(find ips -name "*.txt") 
do
  echo "Start scan $ips"
  asn=`echo $(basename $ips .txt) | awk '{print toupper($0)}'`
  ./CloudflareST -f $ips -tl 250 -sl 5 -dn 5 -url https://speedtest.venusir.com
  awk -F "," 'NR!=1&&$6>5{print $1}' result.csv > tmp.txt
  sed 's/$/:443#'$asn'/g' tmp.txt >> proxy.txt
done;

rm -rf tmp.txt
rm -rf result.csv

git add .
git commit . -m 每日更新优选IP
git push