#!/bin/bash
# =====================================================================
#  Lugnuts // Intro to Bash -- Lesson 05: Loops (doing things over and over)
# =====================================================================
#
# A loop repeats some commands so you don't have to type them again.
# Bash has three kinds:
#
#   for    -> do something once FOR each item in a list
#   while  -> keep going WHILE something is true
#   until  -> keep going UNTIL something becomes true
#
# Every loop has the same shape:   ... do   (the commands)   done
#
# HOW DO I RUN THIS?
#       bash 05_loops.sh
#
# STUCK IN A LOOP THAT WON'T STOP?  Press Ctrl+C. That stops any script.
# ---------------------------------------------------------------------

# ---- 1. for: go through a list ---------------------------------------
# Each time around, "distro" holds the next word in the list.
echo "Distros we've installed at meetups:"
for distro in Debian Fedora Arch Ubuntu; do
    echo "  - $distro"
done
echo ""

# ---- 2. for: count from 1 to 5 ---------------------------------------
# {1..5} is shorthand for "1 2 3 4 5".
for number in {1..5}; do
    echo "Lap number $number"
done
echo ""

# ---- 3. A practical one: make lots of folders at once ------------------
# Imagine you want a folder for every week of a 4-week workshop.
# Instead of typing mkdir 4 times, let a loop do it.
mkdir lugnuts_playground
cd lugnuts_playground

for week in 1 2 3 4; do
    mkdir "week_$week"
    echo "Made folder week_$week"
done

echo "Here's what we made:"
ls
echo ""

# ---- 4. Another practical one: back up every text file ----------------
# First, make a few text files to practice on.
echo "buy pizza" > notes.txt
echo "install Fedora" > todo.txt
echo "learn bash" > goals.txt

# *.txt means "every file whose name ends in .txt".
# For each one, make a copy with .bak on the end.
for file in *.txt; do
    cp "$file" "$file.bak"
    echo "Backed up $file  ->  $file.bak"
done

echo "Folder now contains:"
ls
echo ""

# Clean up the practice folder.
cd ..
rm -r lugnuts_playground

# ---- 5. while: keep going while something is true ---------------------
# This one counts up while the number is 3 or less.
count=1
while [ "$count" -le 3 ]; do
    echo "While loop, round $count"
    count=$(( count + 1 ))      # add 1 to count, or this would loop forever!
done
echo ""

# ---- 6. until: keep going until something is true ---------------------
# A countdown! It stops once count reaches 0.
count=5
until [ "$count" -eq 0 ]; do
    echo "$count..."
    sleep 1                     # wait 1 second
    count=$(( count - 1 ))      # subtract 1
done
echo "LAUNCH"

# =====================================================================
#  TRY IT YOURSELF
# =====================================================================
#  1. Change the distro list to the distros you have tried before.
#
#  2. Change {1..5} to {1..20}. Then try {10..1}. ?
#
#  3. Change the folder loop so it makes folders for 10 weeks.
#
#  4. Type this straight into your terminal. It lists every file in
#     your home folder, one at a time:
#        for item in ~/*; do echo "Found: $item"; done
