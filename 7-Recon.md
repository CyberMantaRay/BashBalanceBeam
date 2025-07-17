# Network Recon
**Explore:** [Home](/README.md) [Basics](/0-Basics.md) [Networking](/2-Networking.md) [WebExploit](/8-WebExploitation.md) [LinuxExploit](/8-LinuxExploitation.md) [WindowsExploit](/8-WindowsExploitation.md)


- [Ip Addr Lookup | iplocation.net](https://www.iplocation.net/ip-lookup)

```bash
rm ~/.ssh/known_hosts && rm ~/.config/freerdp/known_hosts
```

## Linux Toolbox
- ping ∙∙∙∙∙∙∙∙∙∙∙ nc ∙∙∙∙∙∙∙∙∙∙∙ nmap ∙∙∙∙∙∙∙∙∙∙∙ /dev/tcp

```bash
for i in {1..254} ;do (ping -c 1 192.168.28.$i | grep "bytes from" &) ;done | awk '{ print $4 }' | sed 's/://g'

# Can help Identify a box based on the ping response
# 60 = mac    64 = nix    128 = windows    255 = solaris/cisco

for i in 100 105 111 120; do proxychains nmap -Pn -T5 -p1-10000 192.168.28.$i 2>/dev/null >> out.txt; echo -e "===============================\n" >> out.txt; done
````

### nmap
- Port 🏳
    - sT ∙∙∙∙∙∙∙∙∙∙∙ sS
    - `-F` Top 100 ∙∙∙∙∙∙∙∙∙∙∙ `-p21-23,80` ∙∙∙∙∙∙∙∙∙∙∙ `-p-` All 65535

```bash
nmap 172.16.0.30/27 -F
nmap -Pn -sT -T5 -iL ips -p 80
proxychains nmap -Pn -T5 -p135-139,22,80,443,445,21,8080 8.8.8.8

sudo nmap -sU --max-retries 2 --max-rtt-timeout 4 172.16.0.2

# ls -al /usr/share/nmap/scripts | grep "smb*"
nmap -Pn -sV -p22 127.0.0.1                            # Banner grabbing, or use nc/browser
proxychains nmap -Pn -T5 -p80 --script http-enum 192.168.28.111
proxychains nmap -Pn -T5 -p80 --script http-sql-injection 192.168.28.111
proxychains nmap -Pn -T5 -p135-139,445 --script smb-os-discovery 192.168.150.245
```


### Netcat Scripts

```bash
#!/bin/bash
echo "Enter first 3 octets of network address (e.g. 192.168.0): "; read net
echo "Enter starting host range (e.g. 1): "; read start
echo "Enter ending host range (e.g. 254): "; read end
echo "Enter the TCP ports space-delimited (e.g. 21-23 80): "; read ports
for ((i=$start; $i<=$end; i++))
do
    nc -nvzw1 $net.$i $ports 2>&1 | grep -E 'succ|open' &
done; wait
```
- `-n` not resolving names. numeric only IP(no D.S)
- `-z` without sending any data. zero-I/O mode(used for scanning)
- `-w1` waiting no more than 1second for a connection to occur
- `2>&1` redirect STDERR to STDOUT; results of scan are errors.. redirect to grep

```bash
#!/bin/bash
echo "Enter first 3 octets of network address (e.g. 192.168.0): "; read net
echo "Enter starting host range (e.g. 1): "; read start
echo "Enter ending host range (e.g. 254): "; read end
echo "Enter the UDP ports space-delimited (e.g. 21-23 80): "; read ports
for ((i=$start; $i<=$end; i++))
do
    nc -nuvz $net.$i $ports 2>&1 | grep -E 'succ|open' &
done; wait
```
- `-u` Check UDP ports

## Routers

### VyOS

- show interfaces
- show host os
- show ip neighbors | no-match FAILED | count
- show arp \[interface eth0] | no-match FAILED
