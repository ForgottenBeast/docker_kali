#!/bin/bash

getent passwd $SSH_USER  > /dev/null
if [ $? -ne 0 ]; then
    useradd -m -s /bin/bash $SSH_USER
    usermod -a -G xpra $SSH_USER
    usermod -a -G sudo $SSH_USER
    echo "$SSH_USER:$SSH_PW"|chpasswd
    echo "$SSH_USER            ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers
    echo "alias ls='ls --color=auto'" >> /root/.bashrc
    echo "alias ls='ls --color=auto'" >> /home/$SSH_USER/.bashrc
    echo "PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '" >> /home/$SSH_USER/.bashrc
    echo "PS1='${debian_chroot:+($debian_chroot)}\[\033[01;31m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '" >> /root/.bashrc
fi

ip route del 0/0
ip route add default via 172.31.0.254
sed -i 's/127.0.0.11/8.8.8.8/g' /etc/resolv.conf
/usr/sbin/sshd -D
