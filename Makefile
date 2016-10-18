AUTHOR=tleijtens
NAME=ipfs_host
VERSION=latest

start:	ipfs

stop:
	docker stop $(NAME)

clean:
	docker rm -f $(NAME)

cleanrestart:	clean start

ipfs:
	docker run -d --name $(NAME) -v $(ipfs_staging):/export -v $(ipfs_data):/data/ipfs -p 8080:8080 -p 4001:4001 -p 5001:5001 ipfs/go-ipfs:latest

rmipfs:
	docker rm -f $(NAME)
