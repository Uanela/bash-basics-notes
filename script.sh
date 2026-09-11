#!/usr/bin/env bash

# spouse="Sheuzia"
#
# echo "$spouse"
#
# echo "Hello World! $spouse $1"

# echo "What is the name of your spouse?"
# read spouse

# read -p "What is your spouse' name? " spouse
#
# if [[ -z ${spouse} ]]
# then
#   echo "You such a dumbass, don't wanna tell ha"
# else
# echo "Cool your spouse is $spouse"
# fi

# checks if user is root
# if (( $EUID == 0 )) then
#   echo "You are root bro can't run this"
#   exit
# elif [[ 4 > 2 ]] && [[ 2 < 3 ]] then
#   echo "Jesus is the GOAT"
# fi

# case $1 in
#   Banana| Mango)
#     echo "GOAT"
#     ;;
#   Strawberry| Orange)
#     echo "Kind cool"
#     ;;
#   *)
#     echo "Yahh u've bad taste"
#     ;;
# esac
#
#
# words=("Hello" "From" "World")
#
# for word in "${words[@]}"
# do
#     echo "$word"
# done
#
# for i in {0..10}
# do
#   echo "$i"
# done


function greet_someone() {
    echo "Hello $1"
}

greet_someone_without_function() {
    echo "Hello $1"
}

greet_someone Sheuzia
greet_someone_without_function  You
