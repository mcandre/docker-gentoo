IMAGE=mcandre/docker-gentoo
STAGE3=stage3-amd64-20150604.tar.bz2

all: run

tar:
	wget -O tar "https://github.com/vikraman/docker-gentoo/blob/master/bb?raw=true"
	chmod a+x tar

$(STAGE3):
	wget http://ftp.ussg.iu.edu/linux/gentoo/releases/amd64/autobuilds/current-stage3-amd64/xstage3-amd64-20150604.tar.bz2

build: Dockerfile tar $(STAGE3)
	docker build -t $(IMAGE) .

run: clean-containers build
	docker run --rm $(IMAGE) sh -c 'cat /etc/*release*'
	docker run --rm $(IMAGE) sh -c 'emerge ruby && ruby -v'

clean-containers:
	-docker ps -a | grep -v IMAGE | awk '{ print $$1 }' | xargs docker rm -f

clean-images:
	-docker images | grep -v IMAGE | grep $(IMAGE) | awk '{ print $$3 }' | xargs docker rmi -f

clean-layers:
	-docker images | grep -v IMAGE | grep none | awk '{ print $$3 }' | xargs docker rmi -f

clean-tarballs:
	-rm tar
	-rm *.tar.bz2*

clean: clean-containers clean-images clean-layers clean-tarballs

editorconfig:
	flcl . | xargs -n 100 editorconfig-cli check

dockerlint:
	$(shell npm bin)/dockerlint

lint: editorconfig dockerlint

publish:
	docker push $(IMAGE)
