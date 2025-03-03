# printf
**Explore:** [Home](/README.md) [Basics](/0-Basics.md)

## Cheatsheet
- %s, %b (%c) ∙∙∙∙∙∙∙ %X (%x)
- %d≡%i (%u) ∙∙∙∙∙∙∙ %f
- %q ∙∙∙∙∙∙∙ %%

## Examples
```bash
$ printf "%s\n" "Uxie" "Mesprit" "\nAzelf"
$ printf "%b" "Raikou\n" "Entei\n" "Suicune\n"
  # Difference b/w %s and %b tokens?

$ printf "%.2f\n" 255 0xff 0377 3.75
$ for i in $(seq 1 10); do printf "%03d\t" "$i"; done

printTable() {
    divider=======================================
    divider=$divider$divider

    header="\n %-12s %13s %16s %10s\n"
    format=" %-12s %13.04d %16s %10.1f\n"

    width=56

    printf "$header" "POKEMON" "NATIONAL_DEX#" "COLOR" "WEIGHT_KG"

    printf "%$width.${width}s\n" "$divider"

    printf "$format" \
    Turtwig 387  green 10.2 \
    Prinplup 394 blue 23 \
    Infernape 392 orange 55 \
    Luxray 405 "black/blue" 42 \
    Abomasnow 460 "white/green" 135.5 \
    Dialga 483 "dark blue/gray" 683 \
    Palkia 484 pink 336
}
```

## Resources
- [📑 Printf w/ Examples | LinuxConfig](https://linuxconfig.org/bash-printf-syntax-basics-with-examples)
- [-- flag | StackOverflow](https://stackoverflow.com/questions/47928698/how-to-print-using-printf)
