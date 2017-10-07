FROM kalilinux/kali-linux-docker

RUN apt-get update;

RUN apt-get install -y xserver-xorg-video-dummy openssh-server screen \
    curl rsync dbus-x11 mate-terminal

RUN curl http://winswitch.org/gpg.asc | apt-key add -

RUN echo "deb http://winswitch.org/ jessie main" >\
        /etc/apt/sources.list.d/winswitch.list;

RUN echo "deb http://ftp.ru.debian.org/debian/ jessie main" >> /etc/apt/sources.list

RUN apt-get update

RUN apt-get install -y xpra

RUN echo "X11Forwarding yes" >> /etc/ssh/sshd_config
RUN echo "X11UseLocalhost no" >> /etc/ssh/sshd_config

RUN mkdir /var/run/sshd;\
    chmod 0755 /var/run/sshd;

RUN apt-get install -y openvpn resolvconf

COPY runme.sh /runme.sh
EXPOSE 22

ENTRYPOINT ./runme.sh
