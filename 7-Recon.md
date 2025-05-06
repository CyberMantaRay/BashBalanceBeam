# Network Recon
**Explore:** [Home](/README.md) [Basics](/0-Basics.md) [Networking](/2-Networking.md)

- [Ip Addr Lookup | iplocation.net](https://www.iplocation.net/ip-lookup)

## Toolbox
- ping ∙∙∙∙∙∙∙∙∙∙∙ nc ∙∙∙∙∙∙∙∙∙∙∙ nmap ∙∙∙∙∙∙∙∙∙∙∙ /dev/tcp

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
- `-u` Use UDP instead of TCP

### nmap
- Port 🏳
    - `-F` Top 100 ∙∙∙∙∙∙∙∙∙∙∙ `-p21-23,80` ∙∙∙∙∙∙∙∙∙∙∙ `-p-` All 65535

```bash
nmap 172.16.0.30/27 -F
sudo nmap -sU --max-retries 1 --max-rtt-timeout 2 172.16.0.2
```
