#!/bin/bash
# =====================================================================
#  Lugnuts // Intro to Bash -- Lesson 04: If / Else (making decisions)
# =====================================================================
#
# An "if" lets your script do different things depending on the situation.
# In plain English:  "IF this is true, THEN do that, OTHERWISE do this."
#
# In bash it looks like this:
#
#     if [ something is true ]; then
#         do this
#     else
#         do this instead
#     fi
#
#   - "fi" is "if" backwards. It marks the end.
#   - You NEED spaces inside the brackets:  [ "$a" = "b" ]   not  ["$a"="b"]
#   - The indented lines are just to make it easy to read.
#
# HOW DO I RUN THIS?
#       bash 04_conditionals.sh
# ---------------------------------------------------------------------

# ---- 1. Yes or no? ---------------------------------------------------
# =  checks if two pieces of text are the same.
read -p "Do you like Linux? (yes/no) " answer

if [ "$answer" = "yes" ]; then
    echo "Awesome! You're in the right club."
else
    echo "Stick around, we'll change your mind."
fi
echo ""

# ---- 2. Does a file exist? -------------------------------------------
# -f checks "is there a file here?"
# /etc/hosts is a file that exists on almost every Linux and Mac computer.
# (for network hosts)
if [ -f /etc/hosts ]; then
    echo "Found /etc/hosts. Here's what's inside:"
    cat /etc/hosts
else
    echo "No /etc/hosts file on this computer???"
fi
echo ""

# ---- 3. Does a folder exist? ------------------------------------------
# -d checks "is there a folder here?"
# Scripts do this a LOT mainly to check a folder is there before saving 
# files into it.
if [ -d "$HOME/Documents" ]; then
    echo "You have a Documents folder."
else
    echo "You don't have a Documents folder."
fi
echo ""

# ---- 4. More than two choices: elif ----------------------------------
# "elif" means "else if". Bash checks each one from top to bottom
# and runs the FIRST one that's true.
read -p "How many hours of sleep did you get? " hours

# For numbers, use these instead of symbols:
#   -gt  greater than       -lt  less than       -eq  equal to
#   -ge  greater or equal   -le  less or equal   -ne  not equal
if [ "$hours" -ge 8 ]; then
    echo "Well rested! Ready to hack."
elif [ "$hours" -ge 5 ]; then
    echo "Not bad. Grab a coffee."
else
    echo "Oof."
fi
echo ""

# ---- 5. A practical one: is a program installed? ----------------------
# "command -v git" prints where git is, or nothing if it's not installed.
# "> /dev/null" throws that printout away -- we only care yes or no.
if command -v git > /dev/null; then
    echo "git is installed."
else
    echo "git is NOT installed. You can install it with your package manager."
fi
echo ""

# ---- 6. [ ] vs [[ ]] --------------------------------------------------
# You'll see both of these in scripts online:
#   [ ]    the classic version. Works in every shell. (POSIX compliant)
#   [[ ]]  bash's upgraded version. A little more forgiving, and it can
#          match patterns using * (the `*` is a glob which means "anything").
filename="vacation_photo.jpg"
if [[ "$filename" = *.jpg ]]; then
    echo "$filename is a JPG picture."
fi

# =====================================================================
#  CHEAT SHEET
# =====================================================================
#   [ -f "$x" ]        is there a FILE called x?
#   [ -d "$x" ]        is there a FOLDER called x?
#   [ "$a" = "$b" ]    is text a the SAME as text b?
#   [ "$a" != "$b" ]   is text a DIFFERENT from text b?
#   [ "$n" -gt 5 ]     is number n GREATER THAN 5?
#   [ "$n" -lt 5 ]     is number n LESS THAN 5?
#
# =====================================================================
#  TRY IT YOURSELF
# =====================================================================
#
#  1. Run the script again and give different answers. Try "YES" in
#     capitals.
#
#  2. Change the file check to look for a file that does NOT exist,
#     like /etc/unicorn. What happens?
#
#  3. Add your own question with if/else, like:
#     "Have you tried OverTheWire Bandit yet? (yes/no)"
#
#  4. When it asks how many hours you slept, type a word like "lots".
#     Read the error: "integer expression expected". That's bash saying
#     "-ge only works with numbers!" Error messages are clues to what went wrong
