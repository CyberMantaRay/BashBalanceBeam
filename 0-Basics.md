# Bash Fundamentals
**Related:** [Regex](/0-Regex.md)

## Commands
- echo ∙∙∙∙∙∙∙ `man -k "<searchfor>"` ∙∙∙∙∙∙∙ less
  - pwd ∙∙∙∙∙∙∙ ls ∙∙∙∙∙∙∙ cd
  - printenv ∙∙∙∙∙∙∙ which
- cat ∙∙∙∙∙∙∙ `head -n 4` ∙∙∙∙∙∙∙ `tail -n +8`
- touch ∙∙∙∙∙∙∙ mkdir ∙∙∙∙∙∙∙ `rm -r` ∙∙∙∙∙∙∙ mv ∙∙∙∙∙∙∙ cp
- source ∙∙∙∙∙∙∙ export ∙∙∙∙∙∙∙ declare


## Examples ‣
```bash

scp -P <port> tosend.log dstuser@ipdomain:~/Documents
tar xf uncompress.tar.gz
sudo tar --same-owner -p -xf uncompress.tar.gz
```

## Frequent Commands

### find
- `-size (+/-)500k`  Select files over/under a defined size in bytes
- `-perm mode`    permission bits are exactly mode (octal or symbolic).
- `-perm -mode`    All selected permission bits mode are set for the file.
- `-perm /mode`    Any of the permission bits mode are set for the file.
- [Linux Permissions | RedHat](https://www.redhat.com/en/blog/suid-sgid-sticky-bit)
  - XUGO ∙∙∙∙∙∙∙ (UGO = A)
  - X: SUID = 4 ∙∙∙∙∙∙∙ SGID = 2 ∙∙∙∙∙∙∙ Sticky = 1

```bash
find -size +500k -size -600k
find -regex "\.[^\.]*" ! -type d
  # : Find files w/o an extension
find -mindepth 5 | xargs tail -n 1

find -perm -770 -type f
find -perm -u+rwx,g+rwx -type f
find -perm -ug=rwx -type f
  # : 3 commands above are equivalent
find -perm -445 -perm -g+s
find -perm -1446
```
