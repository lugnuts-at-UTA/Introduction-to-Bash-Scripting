#!/bin/bash
# =====================================================================
#  Lugnuts // Intro to Bash -- Lesson 03: Variables
# =====================================================================
#
# A VARIABLE is a name that holds a value, like a labeled box.
# You put something in the box once, and use it as many times as you want.
#
# ---------------------------------------------------------------------

# ---- 1. Making a variable ---------------------------------------------
# Write the name, an = sign, then the value.
# IMPORTANT: no spaces around the = sign!
#     club="Lugnuts"      <- correct
#     club = "Lugnuts"    <- WRONG, bash will give you an error
club="Lugnuts"
meetup_day="Thursday"
#bad = "this var" <- Wrong

# ---- 2. Using a variable ----------------------------------------------
# Put a $ in front of the name to get what's inside the box.
# $ in bash is just a special character usually used to refer to variables
echo "Welcome to $club!"
echo "We meet every other $meetup_day."
echo ""

# ---- 3. Changing a variable -------------------------------------------
# Just give it a new value. The old one is replaced.
meetup_day="Friday"
echo "Oops, schedule change! We now meet every $meetup_day."
echo ""

# ---- 4. Double quotes vs single quotes ---------------------------------
# "Double quotes" fill in the variable.
# 'Single quotes' print exactly what you typed, $ sign and all.
echo "Double quotes: $club"
echo 'Single quotes: $club'
# you can also append many special chars with `\` to still print out the og character
echo "double quotes: \$club but different" 
echo ""

# ---- 5. Variables your computer already has ----------------------------
# These are set for you automatically. They're written in CAPITAL letters.
echo "Your username is:     $USER"
echo "Your home folder is:  $HOME"
echo "Your bash version is: $BASH_VERSION"
echo "A random number:      $RANDOM"
echo ""

# ---- 6. Saving a command's answer in a variable ------------------------
# Wrap a command in $( ) and bash will run it and save what it prints.
today=$(date +%Y-%m-%d)
computer=$(hostname)
echo "Today's date is $today"
echo "This computer is called $computer"

# This is really handy for naming files:
echo "A backup made today could be called: backup_$today.tar.gz"
echo ""

# ---- 7. Simple math ---------------------------------------------------
# Bash can do whole-number math inside $(( )).
members=12
echo "We have $members members."
echo "If everyone brings 2 snacks, that's $(( members * 2 )) snacks."
echo ""

# ---- 8. Asking a question ---------------------------------------------
# "read" waits for you to type something and press Enter.
# Whatever you type gets saved in the variable (here, "name").
read -p "What's your name? " name
read -p "What's your favorite Linux distro? " distro
echo "Nice to meet you, $name! $distro is a great choice."

# =====================================================================
#  TRY IT YOURSELF
# =====================================================================
#  1. Type this into your terminal, WITH the spaces, and read the error:
#         club = "Lugnuts"
#     Now try it without spaces:   club="Lugnuts"
#     Then:                        echo $club
#
#  2. Add a question to the script that asks "How old is your computer?"
#     and prints the answer back.
#
#  3. Type  echo $RANDOM  a few times. You get a new number every time!
