#!/bin/bash
# =====================================================================
#  Lugnuts // Intro to Bash -- Lesson 01: Your First Script
# =====================================================================
#
# WHAT IS THIS FILE?
#   A bash script is just a text file full of commands.
#   When you run it, bash does each command, one line at a time,
#   from top to bottom. That's it!
#
# WHAT ARE ALL THESE # SIGNS?
#   A line that starts with # is a COMMENT. Bash ignores it.
#   Comments are notes for humans (like this one you're reading).
#
# WHAT IS THE FIRST LINE?  #!/bin/bash
#   That's called the "shebang". It tells your computer:
#   "use the program called bash to run this file".
#   Every script you write should start with it.
#   ( most people make their bash scripts executable that's why we do this )
#
# HOW DO I RUN THIS?
#   In your terminal, go to the lessons folder and type:
#
#       bash 01_hello_world.sh
#       (optionally `chmod +x 01_hello_world.sh && ./01_hello_world.sh`)
#
#   Then press Enter.
# ---------------------------------------------------------------------

# "echo" prints whatever comes after it onto the screen.
# Put your text inside "double quotes".
echo "Hello, World!"
echo "Welcome to Lugnuts!"

# An empty echo prints a blank line, which makes things easier to read.
echo ""

# You can also run commands inside a script, just like in the terminal.
# "whoami" prints your username.
whoami

# "date" prints today's date and the time.
date

# "pwd" means "print working directory" (the folder you're in right now)
pwd

# =====================================================================
#  TRY IT YOURSELF
# =====================================================================
#  1. Open this file in a text editor, change "Welcome to Lugnuts!" to
#     say something else, save it, and run it again.
#
#  2. Add a new line at the bottom that says:   echo "I made a script!"
#     Save and run it again.
#
#  3. Make your own script from scratch:
#       a. Type:  nano my_first_script.sh     (nano is a simple editor)
#       b. Type these two lines into it:
#              #!/bin/bash
#              echo "This is my very first script"
#       c. Save with Ctrl+O then Enter, and quit with Ctrl+X.
#       d. Run it:  bash my_first_script.sh
