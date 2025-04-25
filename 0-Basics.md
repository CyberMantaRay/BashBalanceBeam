# Bash Fundamentals
**Explore:** [Home](/README.md) [Regex](/0-Regex.md)

## File System Navigation
- pwd ∙∙∙∙∙∙∙∙∙∙∙ `ls -al`  ∙∙∙∙∙∙∙∙∙∙∙ cd
- less ∙∙∙∙∙∙∙∙∙∙∙ touch ∙∙∙∙∙∙∙∙∙∙∙ mkdir
- cat ∙∙∙∙∙∙∙∙∙∙∙ `head -n 4` ∙∙∙∙∙∙∙∙∙∙∙ `tail -n +8`
- mv ∙∙∙∙∙∙∙∙∙∙∙ cp ∙∙∙∙∙∙∙∙∙∙∙ `rm -r`

## Commands
- **file** ∙∙∙∙∙∙∙∙∙∙∙ `man -k "<searchfor>"`
  - printenv ∙∙∙∙∙∙∙∙∙∙∙ which
- sleep ∙∙∙∙∙∙∙∙∙∙∙ diff ∙∙∙∙∙∙∙∙∙∙∙ comm

```bash
tar xf uncompress.tar.gz
scp -P <port> tosend.log dstuser@ipdomain:~/Documents
echo 'aHR0cHM6Ly93d3cueW91dHViZS5jb20vd2F0Y2g/dj1kUXc0dzlXZ1hjUQ==' | base64 -d
```

### echo
- `-e` Enable interpretation of backslash escapes

### diff/comm
- `diff file1 file2` 
- `comm [-1] [-2] [-3] file1 file2` (req. sorting files)
  - -1 Suppress lines unique to file1
  - -2 Suppress lines unique to file2
  - -3 Suppress lines duplicated in file1 and file2

```bash
awk 'NR==FNR{a[$1]++;next} a[$1] ' file1 file2
```

### find
- `-size (+/-)500k`  Select files over/under a defined size in bytes
- `-perm mode`    Permission bits are exactly mode (octal or symbolic).
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

# Exclude multiple branches w/ prune
find / -type d \( -path /var -o -path /sys -o -path /usr \) -prune -o -name "*syslog*" 2> /dev/null

find -type f -exec wc -l {} + | sort -nr | head -n 5
```

### Encryption

```bash
openssl enc -d -aes-128-cbc -in <encoded.txt> -out decoded.txt -pass pass:"AES128Key"
```


## Built-Ins
- type ∙∙∙∙∙∙∙ pwd ∙∙∙∙∙∙∙ echo
- read
- source ∙∙∙∙∙∙∙ export ∙∙∙∙∙∙∙ `declare -i/-A`
- local ∙∙∙∙∙∙∙ let
- set
  - '-' to set/ '+' to unset
  - -x (debug) ∙∙∙∙∙∙∙ -a (export variables by def.)
  - -u (error on unset variables) ∙∙∙∙∙∙∙ -e (stop on non-zero val)
- [:books: Executables vs. Built-ins](https://superuser.com/questions/1776275/are-linux-commands-grep-awk-etc-part-of-the-system-or-the-shell)

```bash
# Uncategorized
sudo tar --same-owner -p -xf uncompress.tar.gz
```