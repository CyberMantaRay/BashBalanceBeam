# Network Debugging

**Explore:** [Home](/README.md)

## Cheatsheet
- `dig <domain|ip> <qry_type>`
  - **Query Types:** A (IPv4) ∙∙∙∙∙∙∙ AAAA (IPv6) ∙∙∙∙∙∙∙ CNAME (Canonical)  ∙∙∙∙∙∙∙ NS (Name Server)
  - SOA (Start of Authority) ∙∙∙∙∙∙∙ MX (Mail Exchange) ∙∙∙∙∙∙∙ PTR (Pointer Resource) ∙∙∙∙∙∙∙ ANY
  - **Options:** +short ∙∙∙∙∙∙∙ -X ∙∙∙∙∙∙∙ +trace ∙∙∙∙∙∙∙ +answer ∙∙∙∙∙∙∙ -t AXFR
    - +all/noall ∙∙∙∙∙∙∙ +comments ∙∙∙∙∙∙∙ +authority ∙∙∙∙∙∙∙ +additional ∙∙∙∙∙∙∙ +stats ∙∙∙∙∙∙∙ +answer
- ~~nslookup [-query=X] <domain|ip>~~ (deprec.)
  - -query=<NS|SOA|MX|any>
