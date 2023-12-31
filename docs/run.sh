#!/bin/bash


make clean
make html
grep -rn "Theme by" ./build/html/* > delete


rm -rf file1
file="delete"
while read -r line
do
    #echo -e "$line\n"
    dir=$(echo $line | tr ":" "\n")
    echo $dir | awk '{print $1}' >> file1
    #sed -i "s| | |g" $dir | awk '{print $1}'
done <$file

file1="file1"

while read -r line
do
    sed -i 's|Theme by the <a href="https://ebp.jupyterbook.org">Executable Book Project</a>| |g' $line 
done < $file1


git add .
git commit -m "ad"
git push origin master:master
