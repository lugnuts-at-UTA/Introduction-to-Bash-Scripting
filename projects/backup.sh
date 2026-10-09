#!/bin/bash
# =====================================================================
#  Lugnuts // Project: backup.sh
# =====================================================================
#
# WHAT IT DOES:
#   Takes a folder, compresses everything inside it into one zip like file, 
#   and saves that file in a "backups" folder in your home folder.
#   The file name includes the date and time, so you never overwrite
#   an older backup.
#
# HOW DO I RUN IT?
#   bash backup.sh ~/Documents
#
#   The ~/Documents part is the folder you want to back up.
#   (~ is a shortcut for your home folder.)
#
# USES: variables, if/else, and a few new commands (tar, du).
# ---------------------------------------------------------------------

# $1 is the first thing typed after the script name.
# So for "bash backup.sh ~/Documents", folder is ~/Documents.
# remember bash interactive mode works the same as scripting
folder="$1"

# Where to save the backups.
backup_folder="$HOME/backups"

# ---- Step 1: make sure we were given a folder -------------------------
# -z checks "is this empty?" (did the person forget to type a folder?)
if [ -z "$folder" ]; then
    echo "Please tell me which folder to back up. For example:"
    echo "    bash backup.sh ~/Documents"
    exit 1        # "exit" stops the script right here
fi

# ! means "NOT". So this reads: "if it is NOT a folder..."
if [ ! -d "$folder" ]; then
    echo "Sorry, I can't find a folder called: $folder"
    exit 1
fi

# ---- Step 2: make the backups folder if it isn't there yet -------------
# The -p option means "don't complain if it already exists".
mkdir -p "$backup_folder"

# ---- Step 3: pick a name for the backup file ---------------------------
# This makes a name like:  backup_2026-10-08_14-30-05.tar.gz
now=$(date +%Y-%m-%d_%H-%M-%S)
backup_file="$backup_folder/backup_$now.tar.gz"

# ---- Step 4: make the backup ------------------------------------------
echo "Backing up $folder ..."

# Go into the folder we're backing up.
cd "$folder"

# tar packs many files into one file. The letters mean:
#   c = create a new backup file
#   z = compress it (make it smaller)
#   f = the next word is the file name to save to
# The . at the end means "everything in this folder".
tar -czf "$backup_file" .

# ---- Step 5: tell the person what happened -----------------------------
echo "Done! Your backup is saved here:"
echo "    $backup_file"
echo "It is this big:"
du -h "$backup_file"

# =====================================================================
#  HOW DO I GET MY FILES BACK OUT?
# =====================================================================
#  1. See what's inside a backup without unpacking it:
#        tar -tzf ~/backups/backup_DATE.tar.gz
#
#  2. Unpack it into a new folder (so nothing gets overwritten):
#        mkdir ~/restored
#        tar -xzf ~/backups/backup_DATE.tar.gz -C ~/restored
#
#     (x = extract,  -C = put the files in this folder)
#
#  Tip: a backup you've never tested is just a hope. Try restoring once!
#
# =====================================================================
#  TRY IT YOURSELF
# =====================================================================
#  1. Make a practice folder with a few files and back it up.
#  2. Run it again a minute later. Look in ~/backups -- two backups!
#  3. Change backup_folder to a different place, like "$HOME/Desktop".
