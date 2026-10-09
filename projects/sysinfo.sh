#!/bin/bash
# =====================================================================
#  Lugnuts // Project: sysinfo.sh
# =====================================================================
#
# WHAT IT DOES:
#   Prints a quick report about your computer: its name, how long it's
#   been on, how full the disk is, how much memory is free, and which
#   programs are working the hardest.
#
#
# HOW DO I RUN IT?
#       bash sysinfo.sh
#
#   Want to save the report to a file instead? Use the > arrow:
#       bash sysinfo.sh > my_report.txt
#       cat my_report.txt
#
# USES: echo, variables, if/else, and a function.
# ---------------------------------------------------------------------

# A function that prints a heading, so each section stands out.
heading() {
    echo ""
    echo "========== $1 =========="
}

heading "WHO AND WHERE"
echo "Computer name: $(hostname)"
echo "Your username: $USER"
echo "Today is:      $(date)"

heading "HOW LONG HAS IT BEEN ON?"
# uptime shows how long since the last restart, and how busy it is.
uptime

heading "DISK SPACE"
# df = "disk free". -h = "human readable" (shows GB instead of huge numbers).
# The / means "the main disk".
df -h /

heading "MEMORY"
# "free" shows memory on Linux. Macs don't have it, so we check first.
if command -v free > /dev/null; then
    free -h
else
    echo "The 'free' command isn't available on this computer (it's a Linux command)."
fi

heading "BUSIEST PROGRAMS"
# ps aux lists every running program. That's a LOT of lines, so:
#   ps aux | head -1    first, print just the top line (the column names)
#   |                   the "pipe" sends the list into the next command
#   sort -nrk 3         sorts by the 3rd column (%CPU), biggest first
#   head -5             keeps only the first 5 lines
ps aux | head -1
ps aux | sort -nrk 3 | head -5

heading "WHO IS LOGGED IN"
who

echo ""
echo "Report finished!"

# =====================================================================
#  TRY IT YOURSELF
# =====================================================================
#  1. Save the report to a file and open it:
#        bash sysinfo.sh > report.txt
#        cat report.txt
#
#  2. Add a new section called "MY HOME FOLDER" that runs:
#        ls ~
#
#  3. Add a section that shows your IP address. On Linux, try:
#        ip address
