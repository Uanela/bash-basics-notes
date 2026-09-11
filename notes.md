# 1. Introduction

## 1.1. Structure

- we use `.sh`
- all got start with Shebang `#!/bin/bash` - tells the OS to run it using the /bin/bash executable or you can still use `#!/usr/bin/env bash` because sometimes the exec might not be on that default folder, so it will search for bash in enviroment PATH

## 1.2. Hello World

```bash
#!/usr/bin/env bash

echo "Hello World!"
```

- Make it executable by running `chmod +x script.sh` or simply run it `bash script.sh`

## 1.3. Variables

```bash
#!/usr/bin/env bash

spouse="Sheuzia"

echo "$spouse"
```

- Always enclose them into double quote, because without it bash will perfom word splitting and globbing
- use curly braces `"${varname}text"` when the var is followed with characters
- Curly braces are required for array `${array[0]}`, slicing `${name:0:3}` and default values `${name:-default}`
- You can pass args `./script.sh myArg secondArg`, then access through `$@ (all)` or `$n`

## 1.4. User Input

```bash
#!/usr/bin/env bash

echo "What is the name of your spouse?"
read spouse

echo "Cool you spouse is $spouse"
```

- You can do also `read -p "Message" name` this make `-p` output before reading

## 1.5. Comments

- Just do `# This is a comment`

## 1.6. Arguments

- You can pass args `./script.sh myArg secondArg`, then access through `$@ (all)` or `$n`
- Have in mind that `$0` is the script filename

## 1.7. Arrays

```bash
#!/usr/bin/env bash

my_array=("Value 1" "Value 2" "Value 3")

echo "${my_array[1]}"
echo "${my_array[-1]}" # reverse bro
echo "${my_array[@]}" # get's all
echo "${#my_array[@]}" # the length, kind like lua
```

### 1.7.1. Array and String Slicing

- This is just magic on paradise, you make it all string `${my_array[@]}` the use string slicing `${array[@]:start:length}` (length can be ommited), btw if length goes beyong last index it will cust on the end without raising an error.

## 1.8 Conditionals Expressions

- `[[` called conditional compound command to run conditional expressions
- `[` built-in commands also conditional expressions
- You can put them together with `&&` or `||`

### 1.8.1. File Expressions

- Notation is `[[ -<char> ${file} ]]`
- a: file exists
- b: file exists and is block special file
- c: file exists and is character special file
- d: file exists and is a directory
- e: file exists
- f: file exists and is a regular file
- h: file exists and is a symbolic link
- r: file exists and is readable
- w: file exists and is writeable
- s: file exists and has a size gt zero
- x: file exists and is executable
- L: file exists and is a symbolic link

### 1.8.2. String Expressions

- [[ -v varname ]] - Note not `${varname}` because it expects the var name not the value
- Notation is `[[ -<char> ${string} ]]`
- z: if length is zero
- n: if length is non-zero
- `[[ ${string1} <operator> ${string2} ]]` **Operators**: ==, !=, <, >

### 1.8.3 Arithmetic Operators

- `[[ ${n1} -<operator> ${n2} ]]`
- **Operators**: eq, ne, lt, le, gt, ge

### 1.8.4. Exit status operators

- `[[ $? -eq 0 ]]` - True if command was successful
- `[[ $? -ge 0 ]]` - True if command has errors

## 1.9 Conditionals Statements

- Those are `if`, `if-else` and `switch case`

### 1.9.1. If and Else If

```bash
#!/usr/bin/env bash

read -p "What is your spouse' name? " spouse

if [[ -z ${spouse} ]]
then
  echo "You such a dumbass, don't wanna tell ha"
else
echo "Cool your spouse is $spouse"
fi

# checks if user is root
if (( $EUID == 0 )) then
  echo "You are root bro can't run this"
  exit
elif [[ 4 > 2 ]] && [[ 2 < 3 ]] then
  echo "Jesus is the GOAT"
fi
```

### 1.9.2. Switch Statements

```bash
case $1 in
  Banana| Mango)
    echo "GOAT"
    ;;
  Strawberry| Orange)
    echo "Kind cool"
    ;;
  *)
    echo "Yahh u've bad taste"
    ;;
esac
```

## 1.10. Loops

- We've got `for`, `while` && `until`

### 1.10.1. For Loop

```bash
#!/usr/bin/env bash

words=("Hello" "From" "World")

for word in "${words[@]}"
do
    echo "$word"
done

for i in {0..10}
do
  echo "$i"
done
```

### 1.10.2. While Loop

- Runs while is True

```bash
counter=1
while [[ $counter -le 10 ]]
do
    echo "$counter"
    ((counter++))
done
```

### 1.10.3. Until Loop

- Runs while is False

```bash
counter=1
until [[ $counter -gt 10 ]]
do
    echo "$counter"
    ((counter++))
done
```

### 1.10.3. Continue and Break

- `continue` will skip
- `break` will break the entire loop, `break 2` to stop the nested loop only

## 1.11. Functions

```bash
#!/usr/bin/var bash

function greet_someone() {
    echo "Hello $1"
}

#######################################
# Description: Hello function
# Globals:
#    None
# Arguments:
#   Single input argument
# Outputs:
#   Value of input argument
# Returns:
#   0 if successful, non-zero on error.
#######################################
greet_someone_without_function() {
    echo "Hello $1"
}

greet_someone Sheuzia
greet_someone_without_function  You
```

- the `function` can be ommited

## 1.12. Debuggin, Testing and Shortcuts

- Debug using `bash -x ./script.sh` or add `set -x` before a specific line (set -x will make all executed commands to be printed to the terminal)

### 1.12.1 Useful Terminal Commands

Here I am just resambling it to vim (if you don't know it go search)

- C-k -> d$
- C-u -> d^
- C-w -> C-w
- C-r -> /
- C-l -> cae
- C-s -> not vim, it will stop outputing
- C-q -> not vim, will enable output if was stopped with C-s
- C-c -> You know it at least
- C-z -> sends it to bg (as time of writing make no idea what it is)

## 1.13. Creating Custom Bash Commands

- `alias hello='echo "Hello World!"'` - this will create an alias `hello` to print `Hello World!`
- We can such line to ~/.bashrc to make alias persistent

