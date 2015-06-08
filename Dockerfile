FROM scratch
MAINTAINER Andrew Pennebaker <andrew.pennebaker@gmail.com>
ADD tar /tar
ADD stage3-amd64-20150604.tar.bz2 /
RUN echo 'default' > /run/openrc/softlevel && \
    sed -e 's/#rc_sys=""/rc_sys="lxc"/g' -i /etc/rc.conf && \
    ln -s /etc/init.d/net.lo /run/openrc/started/net.lo && \
    ln -s /etc/init.d/net.lo /etc/init.d/net.eth0 && \
    ln -s /etc/init.d/net.eth0 /run/openrc/started/net.eth0 && \
    echo 'UTC' > /etc/timezone && \
    mkdir -p /usr/portage/{distfiles,metadata,packages} && \
    chown -R portage:portage /usr/portage && \
    echo 'masters = gentoo' > /usr/portage/metadata/layout.conf && \
    emerge-webrsync && \
    eselect news read new && \
    env-update
