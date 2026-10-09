# Lugnuts // Intro to Bash Scripting

Hands-on lessons to go with the **Intro to Bash Scripting** talk.
You don't need any experience. If you can type, you can do this.

## What is this?

A **bash script** is a text file full of commands. When you run it, the computer does those commands one at a time, top to bottom. People use scripts so they don't have to type the same commands over and over: backing up files, setting up computers, checking on servers, and more.

Each lesson is a script you can **run** and **read**. The `#` lines inside each file explain what every part does.

## Step 1: Open a terminal

| Your computer | How to open a terminal |
|---|---|
| Linux | Press `Ctrl` + `Alt` + `T`, or search your apps for "Terminal" |
| Mac | Press `Cmd` + `Space`, type `Terminal`, press Enter |
| Windows | Install WSL (search "install WSL" on Microsoft's site), then open "Ubuntu" from the Start menu |

You'll see a line ending in `$` or `%`. That's the **prompt**: the terminal waiting for you to type something.

## Step 2: Go to the lessons folder

Copy this whole folder onto your computer (for example, into your home folder). Then type `cd` followed by the folder's location and press Enter. For example:

```bash
cd ~/lugnuts_bash_scripting/lessons
```

Type `ls` and press Enter. You should see the lesson files listed.

> **Tip:** type the first few letters of a folder or file name and press `Tab`. The terminal will finish the name for you.

## Step 3: Run your first lesson

```bash
bash 01_hello_world.sh
```

You should see `Hello, World!` and a few facts about your computer. **You just ran a script!**

## Step 4: Read it, change it, run it again

Open the lesson in a text editor to see how it works. `nano` is the easiest one to start with:

```bash
nano 01_hello_world.sh
```

Inside nano: use the arrow keys to move around and type to make changes. Press `Ctrl` + `O` and then `Enter` to save, and `Ctrl` + `X` to quit.

Each lesson ends with a **TRY IT YOURSELF** section. Don't skip it. Changing things and breaking them is how this stuff sticks.

## The lessons

Do them in order. Each one builds on the last.

| # | File | You'll learn |
|---|---|---|
| 1 | `lessons/01_hello_world.sh` | What a script is, the `#!/bin/bash` line, comments, `echo` |
| 2 | `lessons/02_essential_commands.sh` | `ls`, `cd`, `pwd`, `mkdir`, `touch`, `cat`, `cp`, `mv`, `rm`, `grep`, `man` |
| 3 | `lessons/03_variables.sh` | Saving values, built-in variables, asking the user questions |
| 4 | `lessons/04_conditionals.sh` | Making decisions with `if` / `else` |
| 5 | `lessons/05_loops.sh` | Repeating things with `for`, `while`, and `until` |
| 6 | `lessons/06_functions.sh` | Making your own mini commands |

## Projects: real scripts you can actually use

Once you've finished the lessons, these put it all together. Run them from the `projects` folder.

| File | What it does | Try it |
|---|---|---|
| `projects/sysinfo.sh` | Prints a health report for your computer | `bash sysinfo.sh` |
| `projects/backup.sh` | Backs up any folder into a dated, compressed file | `bash backup.sh ~/Documents` |

## Word list

| Word | What it means |
|---|---|
| **terminal** | The window you type commands into |
| **shell / bash** | The program inside the terminal that understands your commands. Bash is the most common one |
| **command** | An instruction, like `ls` or `echo` |
| **option** | A setting that changes a command, usually starting with `-`. In `ls -l`, the `-l` is an option |
| **argument** | Extra info you give a command. In `cd Documents`, `Documents` is the argument |
| **directory** | Another word for folder |
| **path** | Where a file lives, like `/home/alice/notes.txt` |
| `~` | Shortcut for your home folder |
| `.` | "This folder" |
| `..` | "The folder above this one" |
| `./` | "Run the file in this folder", like `./myscript.sh` |
| `#!/bin/bash` | The "shebang": the first line of a script, saying which program runs it |
| `sudo` | "Run this as the administrator." Only use it when you have to, and always read the command first |

## Common mistakes (everyone makes these!)

| What you see | What's wrong | Fix |
|---|---|---|
| `No such file or directory` | You're in the wrong folder, or there's a typo in the name | Run `pwd` to see where you are and `ls` to see what's there |
| `Permission denied` when running `./script.sh` | The file isn't allowed to run yet | Run `chmod +x script.sh` once, or use `bash script.sh` instead |
| `command not found` after `name = "value"` | Spaces around the `=` | Write it as `name="value"` with no spaces |
| `[: missing ']'` | No space inside the brackets | Write `[ "$a" = "b" ]` with spaces next to `[` and `]` |
| Script seems frozen | It's waiting for you to type something, or it's stuck in a loop | Type an answer and press Enter, or press `Ctrl` + `C` to stop it |

## Getting help

- `man ls` opens the manual for any command (here, `ls`). Press `q` to quit.
- [explainshell.com](https://explainshell.com): paste a command and it explains each piece.
- [shellcheck.net](https://www.shellcheck.net): paste your script and it points out mistakes.
- Ask people around you for help!

## Already know bash or you're done, it's time for OverTheWire Bandit

[OverTheWire Bandit](https://overthewire.org/wargames/bandit/) is a free game played entirely in the terminal. Each level teaches a new command, and it's how a lot of us learned. Start at Level 0 and come to a meetup to work through it together!
