# Host Enumeration
**Explore:** [Home](/README.md) [Basics](/0-Basics.md) [HostEnum::Windows](https://github.com/CyberMantaRay/PowerShellHoverNet/blob/trunk/4-HostEnum.md)

## General
- date & time ∙∙∙∙∙∙∙∙∙∙∙ whoami ∙∙∙∙∙∙∙∙∙∙∙ id ∙∙∙∙∙∙∙∙∙∙∙ groups
- sudo -l ∙∙∙∙∙∙∙∙∙∙∙ cat /etc/passwd ∙∙∙∙∙∙∙∙∙∙∙ cat /etc/shadow ∙∙∙∙∙∙∙∙∙∙∙ w
- w ∙∙∙∙∙∙∙∙∙∙∙ last ∙∙∙∙∙∙∙∙∙∙∙ uptime ∙∙∙∙∙∙∙∙∙∙∙ hostname
- uname -a ∙∙∙∙∙∙∙∙∙∙∙ `cat /etc/*rel*`


## Networking
- ip addr ∙∙∙∙∙∙∙∙∙∙∙ ifconfig -a ∙∙∙∙∙∙∙∙∙∙∙ cat /etc/hosts ∙∙∙∙∙∙∙∙∙∙∙ cat /etc/resolv.conf
- ss -antp ∙∙∙∙∙∙∙∙∙∙∙ `-p`* ∙∙∙∙∙∙∙∙∙∙∙ netstat -antp ∙∙∙∙∙∙∙∙∙∙∙ netstat -anup
- netstat -rn ∙∙∙∙∙∙∙∙∙∙∙ arp -an

## Process/Service
- ps -ef ∙∙∙∙∙∙∙∙∙∙∙ ps -auxf ∙∙∙∙∙∙∙∙∙∙∙ `lsof -p [pid]` ∙∙∙∙∙∙∙∙∙∙∙ `ls -al /proc/[pid]`
- service --status-all ∙∙∙∙∙∙∙∙∙∙∙ systemctl list-units --type=service

## Logging
- /var/log/ ∙∙∙∙∙∙∙∙∙∙∙ cat /etc/rsyslog.conf ∙∙∙∙∙∙∙∙∙∙∙ /etc/rsyslog.d/ 

## Crontabs
- cat /etc/crontab
- ls -al /etc/cron*
- /var/spool/cron/crontabs/ ∙∙∙∙∙∙∙∙∙∙∙ /etc/cron.d
- sudo crontab -u student -l

## Locating Files of Interest
- /home ∙∙∙∙∙∙∙∙∙∙∙ /etc ∙∙∙∙∙∙∙∙∙∙∙ /tmp ∙∙∙∙∙∙∙∙∙∙∙ /var/tmp
- find / -type f -name *.txt ∙∙∙∙∙∙∙∙∙∙∙ `find / -type f -name ".*"` ∙∙∙∙∙∙∙∙∙∙∙ `find / -type d -name ".*"`
- find / -name password* 2>/dev/null ∙∙∙∙∙∙∙∙∙∙∙ find / -iname \*test\* 2>/dev/null
- `find /home -maxdepth 2 -type d -exec ls -AlR {} \;`

_____

- **\*** requires admin
- [Basic Linux Priv. Escalation | g0tmi1k](https://blog.g0tmi1k.com/2011/08/basic-linux-privilege-escalation/)
