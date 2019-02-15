FROM ubuntu:18.04

RUN set -e -x ;\
    sed -i 's,# deb-src,deb-src,' /etc/apt/sources.list ;\
    apt -y update ;\
    apt-get -y install build-essential ;\
    cd /root ;\
    apt-get -y build-dep libseccomp ;\
    apt-get source libseccomp

ADD stage1.c /root/stage1.c
ADD stage2.c /root/stage2.c
ADD run.sh  /root/run.sh
RUN set -e -x ;\
    chmod 777 /root/run.sh
