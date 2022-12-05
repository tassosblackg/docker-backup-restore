#!/bin/bash

dirname=${PWD##*/}

# filename is in a format like postgres_data-Timestamp.tar.gz,
# need to strip out the last part with timestamp and extension
ffileName=$1
fileName=(${ffileName//-/ })

# echo ${arrIN[0]}

# for f in `ls *.tar.gz`
# do
nv="${dirname}_${fileName}"
# nv="${f%.tar.gz}"
echo -n "Restoring $nv ..."
# echo "RR ${fileName}"
# docker run -it --rm \
#   -v $nv:/data -v $PWD:/backup busybox \
#   sh -c "rm -rf /data/* /data/..?* /data/.[!.]* ; tar -C /data/ -xjf /backup/$ffilename"
docker run --rm \
    -v $nv:/backup-volume \
    -v "$(pwd)":/backup \
    busybox \
    tar -xvzf /backup/"$ffileName" -C /; 
echo "done"
# done