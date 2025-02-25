# Bash Regex
**Related:** [Basics](/0-Basics.md)

## Commands
- grep ∙∙∙∙∙∙∙ `wc -l`
- sort ∙∙∙∙∙∙∙ `uniq -c`

## Examples
```bash
grep -Eo "[0-9]+(\.[0-9]+){3}" sample.log | sort | uniq -c
  # : Count occurences of unique ip's
```

## Learn Regex
- See the [PowerShell regex md](https://github.com/CyberMantaRay/PowerShellHoverNet/blob/trunk/0-Regex.md#learn-regex) for resources.
