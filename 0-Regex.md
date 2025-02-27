# Bash Regex
**Explore:** [Basics](/0-Basics.md)

## Cheatsheet
- grep ∙∙∙∙∙∙∙ `wc -l`
- `sort -u` ∙∙∙∙∙∙∙ `uniq -c`

## Examples
```bash
grep -Eo "[0-9]+(\.[0-9]+){3}" sample.log | sort | uniq -c
  # : Count occurences of unique ip's
awk '/Name/ {print NR " "$2" "$3}' Pokemart_Employees.txt
awk '/Name/ { if (length($2) > max) max = length($2) } END {print max}' Pokemart_Employees.txt
  # : Print length of longest first name
sed -Ee 's/[0-9]{3}-[0-9]{2}-[0-9]{4}/XXX-XX-XXXX/w redacted.txt' Pokemart_Employees.txt
  # : Replace all SSNs and write to new file
echo -e "hello world\ngoodbye world\nhello brave new world" | awk -F o '/goodbye/ {print NR, $1, $3, $4}'
```

## Commands

### grep

#### Flags/Parameters
- `-E, --extended-regexp` Interpret PATTERNS as Extended Regex (EREs)
- `-P, --perl-regexp` Interpret PATTERNS as Perl-compatible regex (PCREs)
- `-o, --only-matching` Print only the matched (non-empty) parts of a matching line, with each such part on a separate output line
- `-v, --invert-match` Invert the sense of matching, to select non-matching lines
- `-r, --recursive` Read  all  files  under  each  directory, recursively, following symbolic links only if on command line

_Cannot be used in conjunction with -o_
- `-A` Prints n number of lines after the match
- `-B` Prints n number of lines before the match
- `-C` Prints n number of lines around the match

### sed
- `s/<pattern>/<newstr>/` - Substitute pattern w/ string, e.g. `sed -Ee 's/[0-9]{3}-[0-9]{2}-[0-9]{4}/XXX-XX-XXXX/' Pokemart_Employees.txt`
- `-i[SUFFIX], --in-place[=SUFFIX]` Edit files in place (makes backup if SUFFIX supplied)
- `-E, -r, --regexp-extended` Use extended regular expressions (ERE) in the script
- [Useful Sed | Adrian Larion](https://github.com/adrianlarion/useful-sed)

### awk
- Pattern written b/w forward slashes, e.g. `'/<regex>/ {print NR " " $2 " " $3}'`
  - **NR** specifies row number
  - Tokens (whitespace separated) selected with `$` + token position in line
- [Practical Awk | Seth Kenlon](https://opensource.com/article/20/9/awk-ebook)
- [Awk Examples | GeeksForGeeks](https://www.geeksforgeeks.org/awk-command-unixlinux-examples/)
- [Simple Awk | Adrian Larion ](https://github.com/adrianlarion/simple-awk)

#### Flags/Params
- `-F fs, --field-separator fs` Use fs for the input field separator

## Learn Regex
- [Extended Regex | Seneca](https://pressbooks.senecapolytechnic.ca/uli101/chapter/extended-regular-expressions/)
- [EREs | Gnu.org](https://www.gnu.org/software/sed/manual/html_node/Extended-regexps.html)
- See the [PowerShell regex md](https://github.com/CyberMantaRay/PowerShellHoverNet/blob/trunk/0-Regex.md#learn-regex) for resources.
- [Negative Lookahead](https://stackoverflow.com/questions/977251/regular-expressions-and-negating-a-whole-character-group)
