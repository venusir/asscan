#!/bin/bash

CURRENT_DIR=$(cd $(dirname $0); pwd)

echo $CURRENT_DIR

cd $CURRENT_DIR

git pull

chmod +x CloudflareST

cat /dev/null > proxy.txt

for ips in $(find ips -name "*.txt") 
do
  echo " "
  echo "------------------Start scan $ips------------------"
  echo " "
  
  asn=`echo $(basename $ips .txt) | awk '{print toupper($0)}'`
  ./CloudflareST -f $ips -tl 250 -sl 5 -dn 5 -url https://speedtest.venusir.com
  awk -F "," 'NR!=1&&$6>5{print $1}' result.csv > tmp.txt
  sed 's/$/:443#'$asn'/g' tmp.txt >> proxy.txt
done;

rm -rf tmp.txt
rm -rf result.csv

git add .
git commit . -m Update IP
git push