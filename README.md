# docker-gentoo - Docker base image for Gentoo

# ABOUT

docker-gentoo is stage 3 Gentoo base image.

# DOCKER HUB

https://registry.hub.docker.com/u/mcandre/docker-gentoo/

# EXAMPLE

```
$ make
docker run --rm mcandre/docker-gentoo sh -c 'cat /etc/*release*'
Gentoo Base System release 2.2
NAME=Gentoo
ID=gentoo
PRETTY_NAME="Gentoo/Linux"
ANSI_COLOR="1;32"
HOME_URL="http://www.gentoo.org/"
SUPPORT_URL="http://www.gentoo.org/main/en/support.xml"
BUG_REPORT_URL="https://bugs.gentoo.org/"
```

# REQUIREMENTS

* [Docker](https://www.docker.com/)

## Optional

* [make](http://www.gnu.org/software/make/)
* [Node.js](https://nodejs.org/en/) (for dockerlint)
