#!/bin/bash
useradd -m -s /bin/bash $SSH_USER
usermod -a -G xpra $SSH_USER
usermod -a -G sudo $SSH_USER
echo "$SSH_USER:$SSH_PW"|chpasswd
echo "$SSH_USER            ALL = (ALL) NOPASSWD: ALL" >> /etc/sudoers
/usr/sbin/sshd -D
