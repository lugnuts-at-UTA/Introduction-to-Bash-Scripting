#!/bin/bash
# =====================================================================
#  Lugnuts // Intro to Bash -- Lesson 02: Essential Commands
# =====================================================================
#
# Any command you can type in the terminal also works in a script.
# This script shows the most common ones. It makes a practice folder
# called "lugnuts_playground", plays with some files inside it, and
# then deletes the practice folder at the end. It's safe to run.
#
# HOW DO I RUN THIS?
#       bash 02_essential_commands.sh
#
# Don't know what a command does?
#   Type "man" and the command name, like: `man ls`
#   That opens the manual. Use the arrow keys to scroll, press q to quit.
# ---------------------------------------------------------------------

echo "--- mkdir: make a new folder ---"
mkdir lugnuts_playground
echo "Made a folder called lugnuts_playground"
echo ""

echo "--- cd: go into a folder ---"
cd lugnuts_playground
echo "We are now inside it. pwd shows where we are:"
pwd
echo ""

echo "--- touch: make a new, empty file ---"
touch shopping_list.txt
echo "Made shopping_list.txt (empty)"
echo ""

echo "--- ls: list what's in this folder ---"
ls
echo ""

echo "--- > and >>: put text inside a file ---"
# The > arrow sends the text INTO the file instead of onto the screen.
# - this is called a redirection
# One arrow  >   REPLACES everything in the file.
# - Overwrites a file completlty
# Two arrows >>  ADDS a new line to the bottom of the file.
# - Appends a file
echo "pizza" > shopping_list.txt
echo "ethernet cables" >> shopping_list.txt
echo "USB stick for Linux installs" >> shopping_list.txt
echo "Wrote 3 lines into shopping_list.txt"
echo ""

echo "--- cat: show what's inside a file (con*cat*enate)---"
cat shopping_list.txt
echo ""

echo "--- cp: copy a file ---"
# cp ORIGINAL COPY
cp shopping_list.txt shopping_list_backup.txt
ls
echo ""

echo "--- mv: move or rename a file ---"
# mv OLD_NAME NEW_NAME
mv shopping_list_backup.txt old_list.txt
ls
echo ""

echo "--- ls -l: list files with details ---"
# The -l is called an "option". Options change how a command behaves.
# -l means "long": show permissions, owner, size, and date.
ls -l
echo ""

echo "--- grep: search for a word inside a file ---"
# grep stands for Global Regular Expressions
echo "Lines in shopping_list.txt that contain 'USB':"
grep "USB" shopping_list.txt
echo ""

echo "--- rm: delete a file ---"
rm old_list.txt
echo "Deleted old_list.txt. What's left:"
ls
echo ""

# "read" makes the script wait until you press Enter.
# This gives you time to look at the playground folder yourself.
# also read itself takes user input
read -p "Press Enter to delete the practice folder... "

echo "--- cleaning up ---"
cd ..
# rm -r deletes a folder AND everything inside it.
# -r == recursively
rm -r lugnuts_playground
echo "Practice folder deleted. All clean!"

# =====================================================================
#  BE CAREFUL WITH rm
# =====================================================================
#  The terminal has no trash can. When rm deletes something, it's gone.
#  Always read an rm command twice before pressing Enter, especially
#  "rm -rf", which deletes a whole folder forcefully without asking.
#  This goes double if an AI tool suggests the command to you.
#
# =====================================================================
#  TRY IT YOURSELF  (type these straight into your terminal)
# =====================================================================
#  1. mkdir test_folder        make a folder
#  2. cd test_folder           go into it
#  3. echo "hi" > hello.txt    make a file with "hi" in it
#  4. cat hello.txt            read it
#  5. ls -l                    look at the details
#  6. cd ..                    go back up one folder
#  7. rm -r test_folder        clean up
