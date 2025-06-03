# Linux Boot Process

**Explore:** [Home](/README.md) [Basics](/0-Basics.md)

## MBR

| Addr | Description | Bytes |
|---|---|---|
| 0x0000 | Bootstrap Code Area | 446 |
| 0x01BE | Partition Entry #1 | 16 |
| 0x01CE | Partition Entry #2 | 16 |
| 0x01DE | Partition Entry #3 | 16 |
| 0x01EE | Partition Entry #4 | 16 |
| 0x01FF | 0x55 Boot Signature | 2 |

```bash
lsblk                                                    # Locate partitions
sudo cat /dev/vda | xxd                                  # Hexdump MBR
sudo cat /dev/sda | xxd -l 16 -s 0x1CE                   # Hexdump 2nd partition entry
dd if=<file> skip=$((<hex_pos>)) bs=1 count=16           # Extract hexdump from file
dd if=/dev/sda skip=$((0x01BE)) bs=1 count=16 | xxd          # E.g. extract 1st partition entry and display as hexdump
```
- `xxd`
  - `-l n` - display n bytes
  - `-s +n` - offset by n bytes from start of input
  - `-g n` - n bytes grouped together in display column (def. 2)
- `dd`
  - `if` - read from file instead of stdin
  - `bs=n` - read n bytes at a time (def. 512); overwrites ibs/obs
  - `count=n` - copy n input blocks
  - `skip=n` - skip n ibs sized blocks
  - `of` - write to file instead of stdout

## GRUB
- linux /boot/vmlinuz-4.9.0-16-amd64              # e.g. linux cmd, arg is kernel

```bash
less /boot/grub/grub.cfg
```

## Init Systems
```bash
ps -p 1                           # Determine init daemon via 1st process
```
- Shared Persistence Locations
  - `/etc/profile` ∙∙∙∙∙∙∙∙∙∙∙ `/etc/profile.d/`
  - `/etc/environment`
  - `/etc/init.d/` - honored by Systemd via compat. wrappers
  - User
    - `~/.profile` ∙∙∙∙∙∙∙∙∙∙∙ `~/.bashrc` ∙∙∙∙∙∙∙∙∙∙∙ `~/.bash_profile` ∙∙∙∙∙∙∙∙∙∙∙ `~/.bash_logout`

### Systemd (modern)
- `systemctl` - cmd to interact w/ systemd sys and svc mngr

```bash
ls -l /sbin | grep init
ls -l /lib/systemd/system | grep default.target
tail -n 8 /lib/systemd/system/graphical.target
find /etc -name "*rsyslog*" 2> /dev/null | xargs file

systemctl --all
systemctl cat hello.service

systemctl list-unit-files
systemctl list-dependencies graphical.target
systemctl show -p Wants graphical.target
systemctl cat default.target

systemctl list-timers --all
journalctl -u hello.service
```

#### Persistence Locations
- System
  - `/lib/systemd/system/` ∙∙∙∙∙∙∙∙∙∙∙ `/etc/systemd/system/*.service`
  - `/etc/systemd/system/*.timer` - scheduled tasks via systemd-timers (local)
    - `backup.timer` → activates `backup.service`
- User
  - `~/.config/systemd/user/` - per user systemd-timers

### SystemV (legacy)
- `/etc/init` → `/sbin/init` → runs `/etc/inittab`

```bash
less /etc/inittab
ls -l /etc | grep rc.*\.d
ls -l /etc/rc6.d/
find /etc/ -type f -name "ssh*"
less /etc/init.d/ssh
```

#### Persistence Locations
- User
  - `/var/spool/cron/`
- System
  - `/etc/inittab`
    - `/etc/init.d/` ∙∙∙∙∙∙∙∙∙∙∙ `/etc/rc[0-6].d/`
  - `/etc/crontab` ∙∙∙∙∙∙∙∙∙∙∙ `/etc/cron.d/` 
  - `/etc/default/`


### Run Levels
| RL | Description | Systemd Target |
| --- | --- | --- |
| 0 | Halt (Shutdown) | poweroff.target |
| 1 | Single User | rescue.target |
| 2	| Multi-user mode | multi-user.target |
| 3 | Multi-user mode w/ networking | multi-user.target |
| 4 | Unused/user-definable | multi-use.target |
| 5 | Multi-user mode w/ networking & GUI Desktop| graphical.target |
| 6 | Reboot | reboot.target |
