login-motd
============

Custom login MOTD to display some useful informations about your servers as soon as you login into the shell.

![](http://up.frd.mn/QjCXU.png)

# Requirements

* `figlet`
* `bc`
* `update-motd` apt package

# Installation

    cd /usr/src
    git clone https://github.com/yeahwhat-mc/login-motd.git
    ln -s /usr/src/login-motd/motd.sh /etc/update-motd.d/10-motd

I recommend to disable `50-landscape-sysinfo` in `/etc/update-motd.d` since it's taking a lot of space:

`chmod -x /etc/update-motd.d/50-landscape-sysinfo`

## License

[WTFPL](LICENSE)
