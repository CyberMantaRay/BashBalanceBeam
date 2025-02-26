# Bash Regex
**Explore:** [Basics](/0-Basics.md)

## Commands
- grep ∙∙∙∙∙∙∙ `wc -l`
- sort ∙∙∙∙∙∙∙ `uniq -c`

## Examples
```bash
grep -Eo "[0-9]+(\.[0-9]+){3}" sample.log | sort | uniq -c
  # : Count occurences of unique ip's
```

## Learn Regex
- [Extended Regex | Seneca](https://pressbooks.senecapolytechnic.ca/uli101/chapter/extended-regular-expressions/)
- [EREs | Gnu.org](https://www.gnu.org/software/sed/manual/html_node/Extended-regexps.html)
- See the [PowerShell regex md](https://github.com/CyberMantaRay/PowerShellHoverNet/blob/trunk/0-Regex.md#learn-regex) for resources.
