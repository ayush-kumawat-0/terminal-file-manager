#!/usr/bin/bash

# =========================================================
#                    COLOR SETTINGS
# =========================================================

RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
CYAN="\033[36m"
WHITE="\033[37m"
BOLD="\033[1m"
RESET="\033[0m"


# =========================================================
#                    CREATE FILE
# =========================================================

create_file()
{
        echo
        echo -e "${CYAN}${BOLD}╭────────────── CREATE FILE ──────────────╮${RESET}"
        echo -e "${CYAN}${BOLD}╰─────────────────────────────────────────╯${RESET}"
        echo

        echo -e "${YELLOW}Examples:${RESET}"
        echo -e "  notes.txt"
        echo -e "  script.sh"
        echo -e "  config.conf"
        echo

        read -r -p "Enter the file name : " file

        if [ -z "$file" ];
        then
                echo -e "${RED}✗ File name cannot be empty!${RESET}"
                return
        fi

        if [ -e "$file" ];
        then
                echo -e "${YELLOW}⚠  File already exists!${RESET}"
                return
        fi

        touch "$file"

        if [ $? -eq 0 ];
        then
                echo -e "${GREEN}✓ File created successfully!${RESET}"
        else
                echo -e "${RED}✗ Failed to create file!${RESET}"
        fi
}


# =========================================================
#                    COPY FILE
# =========================================================

copy_file()
{
        echo
        echo -e "${BLUE}${BOLD}╭─────────────── COPY FILE ───────────────╮${RESET}"
        echo -e "${BLUE}${BOLD}╰─────────────────────────────────────────╯${RESET}"
        echo

        echo -e "${YELLOW}Files available in current directory:${RESET}"
        echo -e "${BLUE}─────────────────────────────────────────${RESET}"
        ls -lh
        echo

        echo -e "${YELLOW}Example:${RESET}"
        echo -e "  Source      : notes.txt"
        echo -e "  Destination : backup/notes.txt"
        echo

        read -r -p "Enter source file : " src
        read -r -p "Enter destination : " dst

        if [ ! -e "$src" ];
        then
                echo -e "${RED}✗ Source file '$src' does not exist!${RESET}"
                return
        fi

        cp "$src" "$dst"

        if [ $? -eq 0 ];
        then
                echo -e "${GREEN}✓ File copied successfully!${RESET}"
        else
                echo -e "${RED}✗ Failed to copy file!${RESET}"
        fi
}


# =========================================================
#                    DELETE FILE
# =========================================================

delete_file()
{
        echo
        echo -e "${RED}${BOLD}╭────────────── DELETE FILE ──────────────╮${RESET}"
        echo -e "${RED}${BOLD}╰─────────────────────────────────────────╯${RESET}"
        echo

        echo -e "${YELLOW}Files and directories in current location:${RESET}"
        echo -e "${BLUE}─────────────────────────────────────────${RESET}"
        ls -lh
        echo

        echo -e "${YELLOW}Example:${RESET}"
        echo -e "  old_file.txt"
        echo -e "  test.sh"
        echo

        read -r -p "Enter the file to delete : " file

        if [ ! -e "$file" ];
        then
                echo -e "${RED}✗ '$file' does not exist!${RESET}"
                return
        fi

        echo
        echo -e "${YELLOW}⚠  You are about to delete: ${WHITE}$file${RESET}"
        read -r -p "Are you sure? (y/n) : " choice

        if [[ "$choice" == "y" || "$choice" == "Y" ]];
        then
                rm -rf "$file"

                if [ $? -eq 0 ];
                then
                        echo -e "${GREEN}✓ File deleted successfully!${RESET}"
                else
                        echo -e "${RED}✗ Failed to delete file!${RESET}"
                fi
        else
                echo -e "${YELLOW}Deletion cancelled.${RESET}"
        fi
}


# =========================================================
#                    RENAME FILE
# =========================================================

rename_file()
{
        echo
        echo -e "${CYAN}${BOLD}╭────────────── RENAME FILE ──────────────╮${RESET}"
        echo -e "${CYAN}${BOLD}╰─────────────────────────────────────────╯${RESET}"
        echo

        echo -e "${YELLOW}Files available in current directory:${RESET}"
        echo -e "${BLUE}─────────────────────────────────────────${RESET}"
        ls -lh
        echo

        echo -e "${YELLOW}Example:${RESET}"
        echo -e "  Old name : old.txt"
        echo -e "  New name : new.txt"
        echo

        read -r -p "Enter the file to rename : " old_file
        read -r -p "Enter the new file name : " new_file

        if [ ! -e "$old_file" ];
        then
                echo -e "${RED}✗ File '$old_file' does not exist!${RESET}"
                return
        fi

        if [ -e "$new_file" ];
        then
                echo -e "${YELLOW}⚠  File '$new_file' already exists!${RESET}"
                return
        fi

        mv "$old_file" "$new_file"

        if [ $? -eq 0 ];
        then
                echo -e "${GREEN}✓ File renamed successfully!${RESET}"
        else
                echo -e "${RED}✗ Failed to rename file!${RESET}"
        fi
}


# =========================================================
#                    MOVE FILE
# =========================================================

move_file()
{
        echo
        echo -e "${BLUE}${BOLD}╭──────────────── MOVE FILE ──────────────╮${RESET}"
        echo -e "${BLUE}${BOLD}╰─────────────────────────────────────────╯${RESET}"
        echo

        echo -e "${YELLOW}Files available to move:${RESET}"
        echo -e "${BLUE}─────────────────────────────────────────${RESET}"
        ls -lh
        echo

        echo -e "${YELLOW}Example:${RESET}"
        echo -e "  Source      : notes.txt"
        echo -e "  Destination : Documents/"
        echo

        read -r -p "Enter source file : " src
        read -r -p "Enter destination directory : " dst

        if [ ! -e "$src" ];
        then
                echo -e "${RED}✗ Source '$src' does not exist!${RESET}"
                return
        fi

        if [ ! -d "$dst" ];
        then
                echo -e "${RED}✗ Destination directory '$dst' does not exist!${RESET}"
                return
        fi

        mv "$src" "$dst"

        if [ $? -eq 0 ];
        then
                echo -e "${GREEN}✓ File moved successfully!${RESET}"
        else
                echo -e "${RED}✗ Failed to move file!${RESET}"
        fi
}


# =========================================================
#                    INSPECT FILE
# =========================================================

inspect_file()
{
        echo
        echo -e "${CYAN}${BOLD}╭────────────── INSPECT ITEM ─────────────╮${RESET}"
        echo -e "${CYAN}${BOLD}╰─────────────────────────────────────────╯${RESET}"
        echo

        echo -e "${YELLOW}Items available in current directory:${RESET}"
        echo -e "${BLUE}─────────────────────────────────────────${RESET}"
        ls -lah
        echo

        echo -e "${YELLOW}Example:${RESET}"
        echo -e "  notes.txt"
        echo -e "  Documents/"
        echo

        read -r -p "Enter file or directory name : " item

        if [ ! -e "$item" ];
        then
                echo -e "${RED}✗ '$item' does not exist!${RESET}"
                return
        fi

        echo
        echo -e "${GREEN}${BOLD}Item Details${RESET}"
        echo -e "${BLUE}─────────────────────────────────────────${RESET}"

        echo -e "${WHITE}Name       :${RESET} $item"
        echo -e "${WHITE}Type       :${RESET} $(file "$item")"
        echo -e "${WHITE}Permission :${RESET} $(stat -c "%A" "$item")"
        echo -e "${WHITE}Owner      :${RESET} $(stat -c "%U" "$item")"
        echo -e "${WHITE}File Size  :${RESET} $(du -sh "$item" | cut -f1)"
}


# =========================================================
#                    CREATE DIRECTORY
# =========================================================

create_directory()
{
        echo
        echo -e "${CYAN}${BOLD}╭──────────── CREATE DIRECTORY ───────────╮${RESET}"
        echo -e "${CYAN}${BOLD}╰─────────────────────────────────────────╯${RESET}"
        echo

        echo -e "${YELLOW}Existing directories:${RESET}"
        echo -e "${BLUE}─────────────────────────────────────────${RESET}"
        find . -maxdepth 1 -type d -printf "%f/\n"
        echo

        echo -e "${YELLOW}Examples:${RESET}"
        echo -e "  projects"
        echo -e "  backup"
        echo -e "  documents"
        echo

        read -r -p "Enter directory name : " dir

        if [ -z "$dir" ];
        then
                echo -e "${RED}✗ Directory name cannot be empty!${RESET}"
                return
        fi

        if [ -d "$dir" ];
        then
                echo -e "${YELLOW}⚠  Directory already exists!${RESET}"
                return
        fi

        mkdir "$dir"

        if [ $? -eq 0 ];
        then
                echo -e "${GREEN}✓ Directory created successfully!${RESET}"
        else
                echo -e "${RED}✗ Failed to create directory!${RESET}"
        fi
}


# =========================================================
#                    CHECK DIRECTORY
# =========================================================

validate_directory()
{
        echo
        echo -e "${CYAN}${BOLD}╭──────────── CHECK DIRECTORY ────────────╮${RESET}"
        echo -e "${CYAN}${BOLD}╰─────────────────────────────────────────╯${RESET}"
        echo

        echo -e "${YELLOW}Directories available here:${RESET}"
        echo -e "${BLUE}─────────────────────────────────────────${RESET}"
        find . -maxdepth 1 -type d -printf "%f/\n"
        echo

        echo -e "${YELLOW}Examples:${RESET}"
        echo -e "  ."
        echo -e "  Documents"
        echo -e "  projects"
        echo

        read -r -p "Enter directory name : " dir

        if [ -d "$dir" ];
        then
                echo -e "${GREEN}✓ Directory '$dir' exists!${RESET}"
        else
                echo -e "${RED}✗ Directory '$dir' does not exist!${RESET}"
        fi
}


# =========================================================
#                    BROWSE DIRECTORY
# =========================================================

browse_directory()
{
        echo
        echo -e "${CYAN}${BOLD}╭─────────── BROWSE DIRECTORY ────────────╮${RESET}"
        echo -e "${CYAN}${BOLD}╰─────────────────────────────────────────╯${RESET}"
        echo

        echo -e "${YELLOW}Current directory:${RESET}"
        echo -e "${GREEN}$(pwd)${RESET}"
        echo

        echo -e "${YELLOW}Examples:${RESET}"
        echo -e "  .                       → Current directory"
        echo -e "  Documents               → Documents folder"
        echo -e "  /home/ayush/projects    → Specific directory"
        echo

        read -r -p "Enter directory path : " dir

        if [ ! -d "$dir" ];
        then
                echo -e "${RED}✗ Directory '$dir' does not exist!${RESET}"

                read -r -p "Do you want to create it? (y/n) : " choice

                if [[ "$choice" == "y" || "$choice" == "Y" ]];
                then
                        mkdir -p "$dir"

                        if [ $? -eq 0 ];
                        then
                                echo -e "${GREEN}✓ Directory created successfully!${RESET}"
                                echo
                                echo -e "${YELLOW}Directory is empty.${RESET}"
                        else
                                echo -e "${RED}✗ Failed to create directory!${RESET}"
                        fi
                fi

                return
        fi

        echo
        echo -e "${GREEN}Directory: $(realpath "$dir")${RESET}"
        echo
        echo -e "${BLUE}${BOLD}──────────── DIRECTORY CONTENTS ────────────${RESET}"
        echo

        ls -lah "$dir"
}


# =========================================================
#                    SEARCH FILE
# =========================================================

search_file()
{
        echo
        echo -e "${CYAN}${BOLD}╭─────────────── FIND FILE ───────────────╮${RESET}"
        echo -e "${CYAN}${BOLD}╰─────────────────────────────────────────╯${RESET}"
        echo

        echo -e "${YELLOW}You can search for:${RESET}"
        echo -e "  notes.txt"
        echo -e "  script.sh"
        echo -e "  config.conf"
        echo

        read -r -p "Enter file name to search : " file

        echo
        echo -e "${YELLOW}Searching...${RESET}"
        echo

        results=$(find . -type f -name "$file")

        if [ -z "$results" ];
        then
                echo -e "${RED}✗ File not found!${RESET}"
        else
                echo -e "${GREEN}✓ File(s) found:${RESET}"
                echo "$results"
        fi
}


# =========================================================
#                    SEARCH TEXT
# =========================================================

search_text()
{
        echo
        echo -e "${CYAN}${BOLD}╭────────────── SEARCH TEXT ──────────────╮${RESET}"
        echo -e "${CYAN}${BOLD}╰─────────────────────────────────────────╯${RESET}"
        echo

        echo -e "${YELLOW}Examples:${RESET}"
        echo -e "  password"
        echo -e "  TODO"
        echo -e "  hello world"
        echo

        read -r -p "Enter the text you want to search : " text

        echo
        echo -e "${YELLOW}Searching...${RESET}"
        echo

        grep -Rni --exclude="File_manager.sh" "$text" . 2>/dev/null

        if [ $? -ne 0 ];
        then
                echo -e "${RED}✗ Text not found!${RESET}"
        fi
}


# =========================================================
#                    FILTER FILES
# =========================================================

filter_files()
{
        echo
        echo -e "${CYAN}${BOLD}╭────────── FILTER BY EXTENSION ──────────╮${RESET}"
        echo -e "${CYAN}${BOLD}╰─────────────────────────────────────────╯${RESET}"
        echo

        echo -e "${YELLOW}Common extensions:${RESET}"
        echo -e "  txt"
        echo -e "  sh"
        echo -e "  conf"
        echo -e "  log"
        echo

        read -r -p "Enter extension (Example: txt or .txt) : " ext

        ext="${ext#.}"

        echo
        echo -e "${YELLOW}Files with .$ext extension:${RESET}"
        echo -e "${BLUE}─────────────────────────────────────────${RESET}"

        find . -type f -name "*.$ext"
}


# =========================================================
#                    COUNT FILES
# =========================================================

count_files()
{
        echo
        echo -e "${CYAN}${BOLD}╭────────────── COUNT ITEMS ──────────────╮${RESET}"
        echo -e "${CYAN}${BOLD}╰─────────────────────────────────────────╯${RESET}"
        echo

        echo -e "${YELLOW}This operation counts files and directories${RESET}"
        echo -e "${YELLOW}inside the current directory.${RESET}"
        echo

        echo -e "${GREEN}Current Directory:${RESET} $(pwd)"
        echo

        directory="."

        total_file=$(find "$directory" -type f | wc -l)
        total_dir=$(find "$directory" -type d | wc -l)

        echo -e "${BLUE}─────────────────────────────────────────${RESET}"
        echo -e "${WHITE}Total files       :${RESET} $total_file"
        echo -e "${WHITE}Total directories :${RESET} $total_dir"
}


# =========================================================
#                    ANALYZE DIRECTORY
# =========================================================

analyze_directory()
{
        echo
        echo -e "${CYAN}${BOLD}╭────────── DIRECTORY STATISTICS ─────────╮${RESET}"
        echo -e "${CYAN}${BOLD}╰─────────────────────────────────────────╯${RESET}"
        echo

        echo -e "${YELLOW}Examples:${RESET}"
        echo -e "  ."
        echo -e "  Documents"
        echo -e "  /home/ayush/projects"
        echo

        read -r -p "Enter directory : " dir

        if [ ! -d "$dir" ];
        then
                echo -e "${RED}✗ Directory '$dir' does not exist!${RESET}"
                return
        fi

        echo
        echo -e "${GREEN}${BOLD}Directory Analysis${RESET}"
        echo -e "${BLUE}─────────────────────────────────────────${RESET}"

        total_file=$(find "$dir" -type f | wc -l)
        total_dir=$(find "$dir" -type d | wc -l)

        echo -e "${WHITE}Files       :${RESET} $total_file"
        echo -e "${WHITE}Directories :${RESET} $total_dir"

        echo
        echo -e "${YELLOW}Disk Usage:${RESET}"
        du -sh "$dir"
}


# =========================================================
#                    MAIN MENU
# =========================================================

while true
do

        clear

        echo
        echo -e "${CYAN}${BOLD}╔══════════════════════════════════════════════════════════════╗${RESET}"
        echo -e "${CYAN}${BOLD}║                    TERMINAL FILE MANAGER                     ║${RESET}"
	echo -e "${CYAN}${BOLD}║							       ║${RESET}"
        echo -e "${CYAN}${BOLD}║                  Linux • Bash • File Tools                   ║${RESET}"
        echo -e "${CYAN}${BOLD}╚══════════════════════════════════════════════════════════════╝${RESET}"
        echo

        echo -e "${WHITE}Current Directory:${RESET}"
        echo -e "${YELLOW}$(pwd)${RESET}"
        echo

        echo -e "${BLUE}${BOLD}FILE MANAGEMENT${RESET}"
        echo -e "${BLUE}──────────────────────────────────────────────────────────────${RESET}"
	echo
        echo -e "  ${GREEN}[1]${RESET} Create File              ${GREEN}[2]${RESET} Copy File"
        echo -e "  ${GREEN}[3]${RESET} Delete File              ${GREEN}[4]${RESET} Rename File"
        echo -e "  ${GREEN}[5]${RESET} Move File                ${GREEN}[6]${RESET} Inspect File"
        echo

        echo -e "${BLUE}${BOLD}DIRECTORY MANAGEMENT${RESET}"
        echo -e "${BLUE}──────────────────────────────────────────────────────────────${RESET}"
	echo
        echo -e "  ${GREEN}[7]${RESET} Create Directory         ${GREEN}[8]${RESET} Check Directory"
        echo -e "  ${GREEN}[9]${RESET} Browse Directory"
        echo

        echo -e "${BLUE}${BOLD}SEARCH & ANALYSIS${RESET}"
        echo -e "${BLUE}──────────────────────────────────────────────────────────────${RESET}"
	echo
        echo -e "  ${GREEN}[10]${RESET} Find Files               ${GREEN}[11]${RESET} Search Text"
        echo -e "  ${GREEN}[12]${RESET} Filter by Extension      ${GREEN}[13]${RESET} Count Files"
        echo -e "  ${GREEN}[14]${RESET} Directory Statistics"
        echo

        echo -e "${RED}${BOLD}[15] Exit${RESET}"
        echo

        echo -e "${BLUE}──────────────────────────────────────────────────────────────${RESET}"
        echo

        read -r -p "Enter your choice (1-15) : " yourChoice

        case "$yourChoice" in

                1)
                        clear
                        create_file
                        ;;

                2)
                        clear
                        copy_file
                        ;;

                3)
                        clear
                        delete_file
                        ;;

                4)
                        clear
                        rename_file
                        ;;

                5)
                        clear
                        move_file
                        ;;

                6)
                        clear
                        inspect_file
                        ;;

                7)
                        clear
                        create_directory
                        ;;

                8)
                        clear
                        validate_directory
                        ;;

                9)
                        clear
                        browse_directory
                        ;;

                10)
                        clear
                        search_file
                        ;;

                11)
                        clear
                        search_text
                        ;;

                12)
                        clear
                        filter_files
                        ;;

                13)
                        clear
                        count_files
                        ;;

                14)
                        clear
                        analyze_directory
                        ;;

                15)
                        clear
                        echo
                        echo -e "${GREEN}${BOLD}╔══════════════════════════════════════════════════════════════╗${RESET}"
                        echo -e "${GREEN}${BOLD}║             Thank you for using File Manager!                ║${RESET}"
                        echo -e "${GREEN}${BOLD}╚══════════════════════════════════════════════════════════════╝${RESET}"
                        echo
                        exit 0
                        ;;

                *)
                        echo
                        echo -e "${RED}✗ Invalid choice! Please choose between 1 and 15.${RESET}"
			sleep 1.5
                        ;;

        esac

        echo
        echo -e "${CYAN}──────────────────────────────────────────────────────────────${RESET}"
        read -r -p "Press Enter to return to the main menu..."


done
