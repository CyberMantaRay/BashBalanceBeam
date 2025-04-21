# Linux Logging
**Explore:** [Home](/README.md) [Basics](/0-Basics.md)

## Logging - `/var`
- Cfg: `/etc/rsyslog.conf`
- Svc: `/usr/sbin/rsyslog.d`
- `/var/log/syslog`- Ubuntu/Debian catch all
  - `/var/log/messages/` - legacy catch all
- `/var/log/auth.log`
  - `/var/run/wtmp` - history for utmp
  - `/var/run/utmp` - curr. logged in users
  - `/var/run/btmp` - failed login attempts

```bash
ls -l /var/log
cat /etc/logrotate.conf
head -n15 /etc/rsyslog.d/50-default.conf
last [-f /var/run/wtmp]        # For reading binary logs (wtmp def.)
```

## Journald Logs
- Logs: `*.units`
- Svc: `systemd-journald.service`

```bash
journalctl -e
journalctl --list-boots
journalctl -b <boot-id>                                 # Fetch logs by boot id
journalctl -u ssh.service --since "2 days ago"          # Fetch logs by unit

grep -Ev "timesyncd|anacron|dnsmasq|7qhp CRON|networkd|resolved|snapd" sample.log
```

### Kernel
- /var/log/kern.log

```bash
dmesg            # Manipulate kernel ring buffer
```

## Config Reference

### Syslog
| Num. Code | Severity      | ∙∙∙ | Facility                    |
|-----------|---------------|-----|-----------------------------|
| 0         | Emergency     | ∙∙∙ | kernel msgs                 |
| 1         | Alert         | ∙∙∙ | user-level msgs             |
| 2         | Critical      | ∙∙∙ | mail system                 |
| 3         | Error         | ∙∙∙ | sys daemons                 |
| 4         | Warning       | ∙∙∙ | security/authorization msgs |
| 5         | Notice        | ∙∙∙ | msgs by syslogd             |
| 6         | Informational | ∙∙∙ | line printer subsys.        |
| 7         | Debug         | ∙∙∙ | network news subsys.        |

- `man rsyslog.conf`
  - `<facility>.<severity>`, e.g. `0.*`, `4.!4`, `2,9,12.=5`, `kern.!=info`
  - `@` - udp; `@@` - tcp
- Match all messages produced by kernel by severity as follows:
  - `.` = `match <= s`; `.!` = `match > s`
  - `mail.info` -  w/ severity numerically less than or equal to `<=` 6/Informational, i.e. 0 to 6 (greater severity)
  - `mail.!info` - w/ severity numerically greater than `>` 6/Informational, i.e. 7 (lesser severity)
- [RFC 5424::Facilities/Severities | IETF](https://datatracker.ietf.org/doc/html/rfc5424#page-10)
_____

## Parsing Markup

- [XML Query Tool | XPath](https://xpather.com/)
- [Json Query Tool | ./JQ](https://shapeshed.com/jq-json/)
- [Markup Formatters | FreeFormatter](https://www.freeformatter.com/xml-formatter.html)

## ./JQ
- `-c` - compact output; each json obj. on single line

```jq
jq '.' pkmn.json
jq '.["id.orig_h"]' conn.log | sort -u | wc -l
jq -c 'select(.resp_ip_bytes > 40)' conn.log | wc -l
```

### XPath
- `-q` - quiet; errors to stderr
- `-e` - explore; specify query

```bash
xpath -q -e '//element/@attribute' log.xml
```
- [Xpath Syntax | W3](https://www.w3schools.com/Xml/xpath_syntax.asp)
- [Xpath Axes | Jrebecchi](https://jrebecchi.github.io/xpath-helper/xpath-axes.html)

#### Queries
- Equiv.
  - `//host[ports/port/state[@state='open']]/address/@addr | //host[ports/port/state[@state='open']]/ports/port[state[@state='open']]/@portid`
  - `//port[state[@state='open']]/@portid | //port[state[@state='open']]/ancestor::host/address/@addr`
  - `//host[ports/port/state[@state='open']]/(address/@addr | ports/port[state[@state='open']]/@portid)`

_____

## Reference
- [Attack Techniques | Mitre Att&ck](https://attack.mitre.org/)
