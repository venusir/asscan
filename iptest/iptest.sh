#!/bin/bash

git pull

./CloudflareST -f ip_hk.txt -tl 500 -sl 5 -url https://speedtest.venusir.com

git add .

git commit . -m 每日更新优选IP

git push