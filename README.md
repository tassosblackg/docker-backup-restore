# docker-backup-restore
Backup all volumes described in `docker-compose.yaml` and restore them when needed.

## Instructions:

1. `git clone` repo.

2. `mv` or `cp` files into `docker/`.

3. `sudo chmod +x backup-volumes.sh`.

4. `sudo chmod +x restore.sh`.

## BackUp execution:

- `./backup-volumes.sh` to create a `tar.gz` file with all the volume data.

## Restore execution:

- `./restore.sh filename.tar.gz`, give a filename you want to restore from. 


## NOTICE:

- Scripts must be inside `docker/` folder, where your `docker-compose.yaml` file is.
