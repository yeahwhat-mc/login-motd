login-motd
============

Custom login MOTD to display some useful informations about your servers as soon as you login into the shell.

![](http://cl.ly/image/3h2D1p1A2v2q/+)

# Requirements

* `figlet`
* `bc`

# Installation

    cd /usr/src
    git clone https://github.com/yeahwhat-mc/login-motd.git
    ln -s /usr/src/login-motd/motd.sh /etc/profile.d/motd.sh
