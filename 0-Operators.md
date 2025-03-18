# Bash Operators
**Explore:** [Home](/README.md) [Basics](/0-Basics.md)

## Cheatsheet
- `test` \[ ] (POSIX) ∙∙∙∙∙∙∙ \[\[ ]] (improved, allows pattern matching w/ `=~`)
  - `-z`=str null ∙∙∙∙∙∙∙ `-n`=str not null
  - `-f`=file exists ∙∙∙∙∙∙∙ `-s`=file size not zero
  - `-d`=directory
  - **Tip:** Variables that don't exist return a 0. How can this affect your conditionals?
- [:books: \[\[ vs \[ vs ( vs ((](https://unix.stackexchange.com/questions/306111/what-is-the-difference-between-the-bash-operators-vs-vs-vs)
- 

## Expansions
- **Tilde** `~` ≡ home directory, e.g. `/home/ash.ketchum`
- Parameter expansion - **!TODO**
- A**rithmetic expansion** - `$((...))`
- **Variable expansion** `${<var>}` -
  - `${variable#pattern}` will remove the shortest possible match of pattern from the beginning of the variable's value
  - `${variable%pattern}` will remove from the end of the variable's value
- **Brace expansion** - gen. arbitrary strings (can be nested)
  - `mkdir pkmn{01..16}`
  - `echo char{m{ander,eleon},izard}`
- **Command substitution** `$(<cmd>)` - cmd output replaces cmd
  - `mkdir "$(date)"`
  - `for i in $(ls)`

```bash
((42 > 0))                              # Arithmetic evaluation; returns exit code, for control flow
printf '0x%X\n' $((0x31a-0x21b))        # Arithmetic expansion w/ $((...)); allows use of value
```

 ## Bash Redirection
- **File Descriptors:** Standard input (0), output (1), error (2): `stdin` ∙∙∙∙∙∙∙ `stdout` ∙∙∙∙∙∙∙ `stderr`
  - Redir. stdout: `date > file.sh`
  - Redir. stderr : `find / pkmn.txt 2> /dev/null`
  - Redir. stdin: `sort < pkmn-gen4.txt`
  - Append: `sort pkmn.txt >> pkmn-sorted.txt`
- [:books: Expansions | The Bash Guide](https://guide.bash.academy/expansions/)
- More Examples
  - `>&2`	Redirect stdout to stderr
  - `2>&1`	Redirect stderr to stdout
