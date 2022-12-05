#!/bin/bash

docker-compose pause

dirname=${PWD##*/}
timestamp=$(date +%d-%m-%Y_%H:%M:%S)
# echo $timestamp
# backupFileName="posteges_data-"
# backupFileName+=$timestamp
# echo $backupFileName
for nv in `docker volume ls -q`
do

  if [[ $nv = ${dirname}* ]]; then

    
    f=${nv//${dirname}_/}
    
    echo -n "Backing up $f ..."
    # docker run -it --rm \
    #   -v $nv:/data -v $PWD:/backup alpine \
    #   tar -cjf /backup/$f.tar.bz2 -C /data ./
    docker run --rm \
      -v $nv:/backup-volume \
      -v "$(pwd)":/backup \
      busybox \
      tar -zcvf /backup/"$f-$timestamp".tar.gz /backup-volume
    echo "done"
  fi
done

docker-compose unpause