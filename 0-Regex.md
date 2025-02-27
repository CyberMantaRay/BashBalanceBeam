# Bash Regex
**Explore:** [Basics](/0-Basics.md)

## Cheatsheet
- grep ∙∙∙∙∙∙∙ `wc -l`
- sort ∙∙∙∙∙∙∙ `uniq -c`

## Examples
```bash
grep -Eo "[0-9]+(\.[0-9]+){3}" sample.log | sort | uniq -c
  # : Count occurences of unique ip's
```

## Commands

### grep
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

### awk

## Learn Regex
- [Extended Regex | Seneca](https://pressbooks.senecapolytechnic.ca/uli101/chapter/extended-regular-expressions/)
- [EREs | Gnu.org](https://www.gnu.org/software/sed/manual/html_node/Extended-regexps.html)
- See the [PowerShell regex md](https://github.com/CyberMantaRay/PowerShellHoverNet/blob/trunk/0-Regex.md#learn-regex) for resources.
