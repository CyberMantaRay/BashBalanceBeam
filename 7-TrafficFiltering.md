# Traffic Filtering
**Explore:** [Home](/README.md) [Recon](/7-Recon.md) [Tunneling](/7-Tunneling.md) [Networking](/2-Networking.md)

## nftables
```bash
sudo nft add table ip CCTC
sudo nft list ruleset

sudo nft add chain ip CCTC INPUT { type filter hook input priority 0 \; policy accept \; } &&
sudo nft add chain ip CCTC OUTPUT { type filter hook output priority 0 \; policy accept \; }

sudo nft add rule ip CCTC INPUT tcp sport { 22-23, 3389 } ct state { new,established } accept &&
sudo nft add rule ip CCTC INPUT tcp dport { 22-23, 3389 } ct state { new,established } accept &&
sudo nft add rule ip CCTC OUTPUT tcp sport { 22-23, 3389 } ct state { new,established } accept &&
sudo nft add rule ip CCTC OUTPUT tcp dport { 22-23, 3389 } ct state { new,established } accept

sleep 60 && sudo nft flush ruleset          # In new terminal in case of lockout; Ctrl + C to cancel

sudo nft add chain ip CCTC INPUT {\; policy drop \;} &&
sudo nft add chain ip CCTC OUTPUT {\; policy drop \;}

sudo nft add rule ip CCTC INPUT ip saddr 10.10.0.40 icmp type 8 accept &&
sudo nft add rule ip CCTC INPUT ip saddr 10.10.0.40 icmp type 0 accept &&
sudo nft add rule ip CCTC OUTPUT ip daddr 10.10.0.40 icmp type 8 accept &&
sudo nft add rule ip CCTC OUTPUT ip daddr 10.10.0.40 icmp type 0 accept

sudo nft add rule ip CCTC INPUT tcp sport { 5050, 5150 } accept &&
sudo nft add rule ip CCTC INPUT tcp dport { 5050, 5150 } accept &&
sudo nft add rule ip CCTC OUTPUT tcp sport { 5050, 5150 } accept &&
sudo nft add rule ip CCTC OUTPUT tcp dport { 5050, 5150 } accept

sudo nft add rule ip CCTC INPUT tcp sport 80 ct state { new,established } accept &&
sudo nft add rule ip CCTC INPUT tcp dport 80 ct state { new,established } accept &&
sudo nft add rule ip CCTC OUTPUT tcp sport 80 ct state { new,established } accept &&
sudo nft add rule ip CCTC OUTPUT tcp dport 80 ct state { new,established } accept
```


## iptables
```bash
sudo iptables -L -n --line-numbers
sudo iptables -D <chain> <ruleno>            # E.g. sudo iptables -D INPUT 2

sudo iptables -t filter -A INPUT -p tcp -m multiport --ports 22,23,3389 -m state --state NEW,ESTABLISHED -j ACCEPT &&
sudo iptables -t filter -A OUTPUT -p tcp -m multiport --ports 22,23,3389 -m state --state NEW,ESTABLISHED -j ACCEPT

sleep 45 && sudo iptables -P INPUT ACCEPT &&
sudo iptables -P OUTPUT ACCEPT && sudo iptables -P FORWARD ACCEPT        # In new terminal in case of lockout; Ctrl + C to cancel

sudo iptables -P INPUT DROP  &&
sudo iptables -P OUTPUT DROP &&
sudo iptables -P FORWARD DROP

sudo iptables -A INPUT -s 10.10.0.40 -p icmp --icmp-type 8 -j ACCEPT &&
sudo iptables -A INPUT -s 10.10.0.40 -p icmp --icmp-type 0 -j ACCEPT &&
sudo iptables -A OUTPUT -d 10.10.0.40 -p icmp --icmp-type 8 -j ACCEPT &&
sudo iptables -A OUTPUT -d 10.10.0.40 -p icmp --icmp-type 0 -j ACCEPT

sudo iptables -A INPUT -p tcp -m multiport --ports 6579,4444 -j ACCEPT &&
sudo iptables -A OUTPUT -p tcp -m multiport --ports 6579,4444 -j ACCEPT &&
sudo iptables -A INPUT -p udp -m multiport --ports 6579,4444 -j ACCEPT &&
sudo iptables -A OUTPUT -p udp -m multiport --ports 6579,4444 -j ACCEPT

sudo iptables -A INPUT -p tcp -m multiport --ports 80 -m state --state New,Established -j ACCEPT  &&
sudo iptables -A OUTPUT -p tcp -m multiport --ports 80 -m state --state New,Established -j ACCEPT
```

## Snort IDS/IPS
-  `/etc/snort/snort.conf` ∙∙∙∙∙∙∙∙∙∙∙ `/etc/snort/rules/` ∙∙∙∙∙∙∙∙∙∙∙ `/etc/snort/` (install dir)
-  `/var/log/snort/` ∙∙∙∙∙∙∙∙∙∙∙ `[name].rules`

```bash
sudo snort -D -c /etc/snort/snort.conf -l /var/log/snort        # Run as daemon
sudo snort -c /etc/snort/rules/file.rules -r file.pcap          # Run against pcap

ps -ef | grep snort
ping 172.16.0.1 -c 3
file snort.log.<num>
tcpdump -tnr /var/log/snort/snort.log.<num> | awk '{print $2} {print $4}' | sort | sed 's/:$//' | uniq -c
snort -r snort.log.<num>
kill -9 <snortd_PID>
```

### Flags (Snort)
- `-D` - run as daemon
- `-l` - specify log directory; `/var/log/snort` def. logging location
- `-c` - specify configuration file when running; no def.
- `-r` - read a pcap file

### Snort Rule Format
#### \[action] \[protocol] \[s.ip] \[s.port] \[direction] \[d.ip] \[d.port] ( match conditions ;)

| Token | Values |
| --- | --- |
| Action | alert, log, pass, drop, or reject
| Protocol | TCP, UDP, ICMP, or IP
| Source IP | one IP, network, [IP range], or any
| Source Port | one, [multiple], any, or [range of ports]
| Direction | source to destination or both
| Destination IP | one IP, network, [IP range], or any
| Destination port | one, [multiple], any, or [range of ports]

### Rule Options:
| Option | Desc.|
| --- | --- |
| msg:"text" | human-readable alert msg |
| sid: | uniquely identifies Snort rules (required) |
| reference: | links to ext. src of rule |
| rev: | uniquely identifies revisions of Snort rules |
| classtype: | describes what successful attack would do |
| priority: | 1 - critical, 2 - serious, 3 - informational) | 
| metadata: | additional info about rule |


### Payload Detection Options:
| Option | Desc. |
| --- | --- |
| content:"text" | search for string |
| content:"\|binary data\|" | search for string of HEX |
| nocase | make content case insensitive |
| depth: | num bytes into packet that Snort should search for pattern |
| offset: | num bytes skipped before searching |
| distance: | packet section ignored b/f starting search for specified pattern; relative to end of prev. pattern match |
| within: | ensures at most N bytes b/w pattern matches using content keyword | 

  
### Non-Payload Detection Options
| Option | Desc. |
| --- | --- |
| flow: | direction (to/from client and server) & state of connection (established, stateless, stream/no stream) |
| ttl: | check IP time-to-live |
| tos: | check IP TOS field for spec. val |
| ipopts: | check if spec. IP option present |
| fragbits: | check for R/D/M ip flags |
| dsize: | test packet payload size |
| seq: | check for spec. TCP sequence number |
| ack: | check for a spec. TCP ack number |
| flags: | check for E/C/U/A/P/R/S/F/0 TCP flags |
| itype: | check for spec. ICMP type val |
| icode: | check for spec. ICMP code val |

### POST Detection Options
| Option | Desc. |
| --- | --- |
| logto: | log all packets triggering this rule to special output log file |
| session: | extract user data from TCP Sessions |
| react: | react to traffic matching a rule by closing connection and sending notice |
| tag: | log more than just single packet that triggered rule |
| detection_filter | defines rate to be exceeded by a src or dest. host before rule can generate event |


### Thresholding & Suppression Options
#### threshold: type \[limit | threshold | both], track \[by_src | by_dst], count \[#], seconds \[seconds]

| Option | Desc. |
| --- | --- |
| limit | alerts on 1st event during defined period then ignores the rest |
| threshold | alerts every [x] times during defined period |
| both | alerts once per time internal after seeing [x] amount of occurrences of event; then ignores all other events during period |
| track | rate is tracked either by source IP address, or destination IP address |
| count | num rule matches in [s] seconds that will cause event_filter limit to be exceeded |
| seconds | time period over which count is accrued; nonzero val |

```snort
alert tcp any any -> any 21 (msg:"Anonymous FTP Login"; content: "anonymous"; offset:5; sid:2121; )
alert tcp any any -> any 21 (msg:"Anonymous FTP Login"; content: "anonymous"; nocase; sid:2121; )
alert icmp any any -> 10.10.0.40 any (msg: "NMAP ping sweep Scan"; itype:8; icode:0; dsize:0; sid:10000004; rev: 1; )
alert tcp any any -> any any (msg:"NOP Slide"; content: "|9090 9090 9090|"; sid:9090; rev: 1; )
alert tcp any 23 -> any any (msg:"TELNET login incorrect"; content:"Login incorrect"; nocase; flow:established, from_server; threshold: type both, track by_src, count 3, seconds 30; classtype: bad-unknown; sid:2323; rev:6; )
alert tcp any any -> any 22 (threshold: type both, track by_src, count 3, seconds 10; sid:1000003;)        # SSH brute force

alert tcp any any -> 10.0.0.0/8 [445,139,137] (sid:1000007)      # Multiple ports
alert udp any any -> 10.0.0.0/8 [139,138,137] (sid:1000008)      # Targetting SMB & CIFS
```
