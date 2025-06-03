# Linux Audit
**Explore:** [Home](/README.md) [Basics](/0-Basics.md) [Logging](/3-Logging.md)

## Locations
- /etc/passwd
- /etc/shadow\*
- /etc/group
- /etc/sudoers\*

\* = requires admin
```bash
sudo find /etc/passwd -exec /bin/sh \;


cat /etc/passwd > /tmp/etc/passwd
cat /etc/shadow > /tmp/etc/shadow
cat /etc/hosts > /tmp/etc/hosts
cat /etc/group > /tmp/etc/group
cat /etc/sudoers > /tmp/etc/sudoers
```

### /etc/sudoers
- [Sudoers File | DigitalOcean](https://www.digitalocean.com/community/tutorials/how-to-edit-the-sudoers-file#how-to-modify-the-sudoers-file)

```
# Sample sudoers file
# _____________________________________________

# Please consider adding local content in /etc/sudoers.d/ instead of
# directly modifying this file.
#
# See the man page for details on how to write a sudoers file.
#
Defaults	env_reset
Defaults	mail_badpass
Defaults	secure_path="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin"

# Host alias specification

# User alias specification

# Cmnd alias specification

# User privilege specification
root	ALL=(ALL:ALL) ALL

# Members of the admin group may gain root privileges
%admin ALL=(ALL) ALL

# Allow members of group sudo to execute any command
%sudo	ALL=(ALL:ALL) ALL

# See sudoers(5) for more information on "#include" directives:

#includedir /etc/sudoers.d
```
