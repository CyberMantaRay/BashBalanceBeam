# Linux Processes
**Explore:** [Home](/README.md) [Basics](/0-Basics.md)

## Services

```bash
systemctl list-units --type=service
```

## Processes
- ps ∙∙∙∙∙∙∙∙∙∙∙ top ∙∙∙∙∙∙∙∙∙∙∙ pidof
- lsof ∙∙∙∙∙∙∙∙∙∙∙ htop ∙∙∙∙∙∙∙∙∙∙∙ kill

```bash
systemctl status <pid>

ps -elf --forest
ps --pid <pid> -lf
ps -p $(pidof <pname>) -o args       # '-o args' shows cmd arguments
ps -eo args | grep <pname>

sudo ls -l /proc/<pid>               # Explore files rel. to process (view symlinks), e.g. ./cmdline
tr '\0' ' ' </proc/28865/cmdline

netstat -ano | grep -E "(tcp |udp )"        # -anop requires sudo

ps --ppid 2 -lf | head               # Display only kthreadd processes (kernel)
ps --ppid 2 -Nlf | head              # Display only user processes, i.e. non-kernel (-N negates)
```


### top
- `f` - modify displayed columns
  - `→` - make column movable w/ up/down arrow; `←` to return
- `shift + v` - hierarchical process tree

### htop
- `f2` - add/remove display columns
- `f5` - hierarchical tree view
- Options shown in terminal bottom

### kill
- `-l` - list signals
  - SIGTERM(15) - termination signal; end process gracefully, allow teardown phase
  - SIGSTOP(19) - pause signal; allows process to continue with SIGCONT(18)
  - SIGKILL(9) - annihilate process; abrupt, no teardown

### lsof
- `-c c` - list files for procs exec. cmd beginning w/ chars c
- `-i <addr?>` - list of internet/network files
- [lsof](https://cheat.sh)

```bash
sudo lsof -p <pid>                       # Using process id
sudo lsof -i :<port>                     # Using port
sudo lsof -c sshd | grep -v ' mem '      # For process name starting w/ chars

cat /proc/net/tcp
sudo lsof | grep <inode>             # Provides process id
```

## Cron Jobs (Scheduler)
- crontab
- Cron job dirs: `/etc/cron.d/` ∙∙∙∙∙∙∙∙∙∙∙ `/etc/crontab/` ∙∙∙∙∙∙∙∙∙∙∙ `/var/spool/cron/`
1. System Cron Job (root) - `/etc/crontab/`
2. User Cron Job - `/var/spool/cron/crontabs/`
- [Cronitor | crontab.guru](https://crontab.guru)

```bash
crontab -l -u <user>
sudo ls -al /var/spool/cron/crontabs/
```
