# ipfs_docker

Welcome to the YellowBrainz ipfs docker host. This makefile will allow you to build a fully functional
ipfs docker with mappings to local ipfs folders; ```ipfs_staging``` and ```ipfs_data```.  Where the
staging folder is used to capture files that you would like to expose to the Inter Planetary File System
(ipfs).  The current ```Makefile``` asumes that these folders are created in your system' root folder.
If you choose to move these folders to a different location, you will need to make the obvious changes
to the ```Makefile```.

Whatever you choose to do you `must` share these folders in Docker (either in the Virtual box configuration
or in the Docker configuration).  Also you will need to put these folders open for ipfs (mode 0x777). To do
so perform the following actions:

```
$ sudo mkdir /ipfs_staging
$ sudo mkdir /ipfs_data
$ sudo chmod -R 777 /ipfs_staging
$ sudo chmod -R 777 /ipfs_data
```

If you add more folders/files to ```/ipfs_staging```, you must repeat the chmod command to keep ensuring
that your filesystem is open for ipfs to use!

For a working build you will need to also export the two required ipfs_folders such that the Makefile can
use these directly in the ```docker run``` command.

Simply add the following environment settings (in .bashrc or .profile or .bashrc_profile). Which you can
find in your home directory.

## Makefile targets
`start`:        This will start a new ipfs_host docker.
`stop`:         This will stop a running ipfs_host dockker.
`clean`:        This will remove the stopped ipfs_host container
`cleanrestart`: This will remove the container and start a new one from scratch.

## Starting ipfs commands
Once the ipfs_host docker is running you can run the ```ipfs``` commands using the docker exec argument,
like so:

```docker exec ipfs_host ipfs <args...>```

## Adding new files to share
```
cp -r <something> $ipgs_staging
chmod -R 777 #ipfs_staging
docker exec ipfs_host ipfs add -r /export/<something>
```

Note that the /export folder is the one in the docker container mapped to the $ipfs_staging folder on the
host computer running the docker.

## Checking logs
From the host you can check the log messages using the following command:
```docker logs -f ipfs_host```

## Using remote files
When you add new files to ipfs you will get a hash (key) use this key to inspect the folder/file using a
following link:
```https://ipfs.io/ipfs/<hash key>```

Another way to look at you node and see what's there you can open the web-application which offers a view
on your host. For this open the following url in your favourite browser:
```
http://localhost:5001/webgui
```

Further information can be found at https://ipfs.io/docs/getting-started it is definitely worth a visit.

Toon Leijtens
(toonleijtens@yellowbrainz.com)
