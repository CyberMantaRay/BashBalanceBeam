# Network Tunneling
**Explore:** [Home](/README.md) [Recon](/7-Recon.md) [Networking](/2-Networking.md)

## SSH Port Forwarding

```bash
# E.g. 10.10.0.40 (ጸ) → 172.16.1.15 (T1) → 172.16.40.10 (T2) → 172.16.82.106 (T3)

ssh student@172.16.1.15 -L 2222:172.16.40.10:22                 # Local port forward via server
ssh student@localhost -p 2222
ssh student@localhost -p 2222 -L 3333:172.16.82.106:23          # Forward through tunnel, e.g. port 22/23
telnet localhost 3333

telnet <ip>
ssh student@10.10.0.40 -R 4444:localhost:22                     # Remote port forward (e.g. ssh blocked but telnet open)
```
```bash
ss -lnt                      # Display active ports
netstat -alntu
ip neigh | grep -v FAILED
scp -P <sshport> <user>@<ip>:/remote/path/* ~/local/path/
```

### Dynamic Forwarding
```bash
ssh student@172.16.1.15 -D 9050 2>/dev/null                     # Dynamic port forwarding for enumeration
ssh student@localhost -p 2222 -D 9050 2>/dev/null

proxychains <cmd>              # Def. port 9050; /etc/proxychains.conf
wget -r <ip>                 # Auto fetches from port 80 of target
wget -r ftp://<ip>           # Fetches from port 21
scp -P <port> Zuko@localhost:/usr/share/<dir>/* .
```

- `-L` - Create port on local mapped to \<ip:port> of server
- `-R` - Create port on server mapped to \<ip:port> of local
- `-NT` - Do not execute remote command and disable pseudo-tty (hangs window)
- `-D` - Create port on local and set up SOCKS4 proxy tunnel where the target \<ip:port> is specified dynamically

### Bridging Local & Remote
```bash
ጸ$ ssh student@172.16.1.15 -L 2223:172.16.20.10:23
ጸ$ telnet localhost 2223
T2$ ssh student@172.16.1.15 -R 1122:localhost:22
ጸ$ ssh student@172.16.1.15 -L 2222:localhost:1122
ጸ$ ssh student@localhost -p 2222 -D 9050 2>/dev/null
```

## Netcat Relays

```bash
nc 172.16.40.10 43210 > p43210.txt
```
