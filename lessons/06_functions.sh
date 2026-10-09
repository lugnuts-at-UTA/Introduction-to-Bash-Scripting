#!/bin/bash
# =====================================================================
#  Lugnuts // Intro to Bash -- Lesson 06: Functions
# =====================================================================
#
# A FUNCTION is a group of commands with a name.
# You write the commands once, then run them anytime just by
# typing the name. It's like making your own mini command.
#
# It looks like this:
#
#     say_hello() {
#         echo "Hello!"
#     }
#
# You might also see this style. It does the exact same thing:
#
#     function say_hello {
#         echo "Hello!"
#     }
#
# RULE: write the function ABOVE the line where you use it.
#
# HOW DO I RUN THIS?
#       bash 06_functions.sh
# ---------------------------------------------------------------------

# ---- 1. Make a function, then use it ---------------------------------
say_hello() {
    echo "Hello from inside a function!"
}

say_hello       # this runs the function
say_hello       # and we can run it again as many times as we want
echo ""

# or loop over it as many times as you'd like
for number in {1..5}; do 
  say_hello
done

# ---- 2. Giving a function some information ----------------------------
# Whatever you write after the function name gets passed in.
#   $1 is the first thing, $2 is the second thing, and so on.
greet() {
    echo "Welcome to Lugnuts, $1! Enjoy using $2."
}

greet "Alice" "Fedora"
greet "Bob" "Arch"
greet "Sam" "Ubuntu"
echo ""

# ---- 3. A practical one: a message with the time on it ----------------
# Scripts often print messages with a timestamp, so you know when
# each step happened. "date +%H:%M:%S" prints the time like 14:30:05.
log() {
    echo "[$(date +%H:%M:%S)] $1"
}

log "Starting up"
log "Doing some work..."
log "All done"
echo ""

# ---- 4. A practical one: check if programs are installed ---------------
# This function checks ONE program. Then a loop uses it to check many.
check_installed() {
    if command -v "$1" > /dev/null; then
        echo "  [yes] $1 is installed"
    else
        echo "  [no]  $1 is NOT installed"
    fi
}

echo "Checking your toolbox:"
for program in git curl ssh python3 nano vim; do
    check_installed "$program"
done

# =====================================================================
#  WHEN DO I NEED FUNCTIONS?
# =====================================================================
#  For short scripts, you usually don't! They become useful when you
#  notice yourself copying and pasting the same set of lines over and over.
#
# =====================================================================
#  TRY IT YOURSELF
# =====================================================================
#  1. Add your own name and distro to the greet lines.
#
#  2. Add more programs to the toolbox check (htop, nmap, docker...).
#
#  3. Write a function called "shout" that prints its first input
#     with "!!!" on the end, then use it:
#        shout "Linux rocks"     ->   Linux rocks!!!
