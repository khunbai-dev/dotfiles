#!/bin/bash

# Renders a text based list of options that can be selected by the
# user using up, down and enter keys and returns the chosen option.
#
#   Arguments   : list of options, maximum of 256
#                 "opt1" "opt2" ...
#   Return value: selected index (0 for opt1, 1 for opt2 ...)
function select_option {

    # little helpers for terminal print control and key input
    ESC=$( printf "\033")
    cursor_blink_on()  { printf "$ESC[?25h"; }
    cursor_blink_off() { printf "$ESC[?25l"; }
    cursor_to()        { printf "$ESC[$1;${2:-1}H"; }
    print_option()     { printf "   $1 "; }
    print_selected()   { printf "  $ESC[7m $1 $ESC[27m"; }
    get_cursor_row()   { IFS=';' read -sdR -p $'\E[6n' ROW COL; echo ${ROW#*[}; }
    key_input()        { 
                        #== Default code =======================================
                        #  read -s -n3 key 2>/dev/null >&2
                        #  if [[ $key = $ESC[A ]]; then echo up;    
                        #  elif [[ $key = $ESC[B ]]; then echo down;
                        #  elif [[ $key = ""     ]]; then echo enter; fi;

                        #=== Update for vim like keys ==========================
                        local key
                        IFS= read -rsn1 key 2>/dev/null >&2
                        if [[ $key = ""      ]]; then echo enter; fi;
                        if [[ $key = $'\x20' ]]; then echo space; fi;
                        if [[ $key = "k" ]]; then echo up; fi;
                        if [[ $key = "j" ]]; then echo down; fi;
                        if [[ $key = $'\x1b' ]]; then
                            read -rsn2 key
                            if [[ $key = [A || $key = k ]]; then echo up;    fi;
                            if [[ $key = [B || $key = j ]]; then echo down;  fi;
                        fi
                       }

    # initially print empty new lines (scroll down if at bottom of screen)
    for opt; do printf "\n"; done

    # determine current screen position for overwriting the options
    local lastrow=`get_cursor_row`
    local startrow=$(($lastrow - $#))

    # ensure cursor and input echoing back on upon a ctrl+c during read -s
    trap "cursor_blink_on; stty echo; printf '\n'; exit" 2
    cursor_blink_off

    local selected=0
    while true; do
        # print options by overwriting the last lines
        local idx=0
        for opt; do
            cursor_to $(($startrow + $idx))
            if [ $idx -eq $selected ]; then
                print_selected "$opt"
            else
                print_option "$opt"
            fi
            ((idx++))
        done

        # user key control
        case `key_input` in
            enter) break;;
            space) break;;
            up)    ((selected--));
                   if [ $selected -lt 0 ]; then selected=$(($# - 1)); fi;;
            down)  ((selected++));
                   if [ $selected -ge $# ]; then selected=0; fi;;
        esac
    done

    # cursor position back to normal
    cursor_to $lastrow
    printf "\n"
    cursor_blink_on

    return $selected
}

function clear_screen () {
    #(v) Restore cursor (go up to the most top left)
    tput rc
    #(v) Clear from the cursor to the end of the screen
    tput ed
}

function main_menu () {
    echo
    echo "====================================="
    echo "=== j(Down) k(Up) spacebar(Enter) ==="
    echo "====================================="
    echo
    echo "Select one option using up/down keys and enter to confirm:"
    
    options=(
        "- Network and Internet"
        "- Hardisk and Disk Space"
        "- Exit"
    )
    
    select_option "${options[@]}"
    choice=$?
    
    #echo "Choosen index = $choice"
    #echo "        value = ${options[$choice]}"
    #echo
    
    if [ $choice -eq 0 ]
    then
        clear_screen
        network_menu
    elif [ $choice -eq 1 ]
    then
        clear_screen
        disk_menu
    else
        # Exit function
        return 0
    fi
}

function network_menu () {
    echo
    echo "Network and Internet options:"
    
    options=(
        "- Check listening port"
        "- Go back to main menu")

    select_option "${options[@]}"
    choice=$?
    
    #echo "Choosen index = $choice"
    #echo "        value = ${options[$choice]}"
    
    if [ $choice -eq 0 ]
    then
        netstat -tulpn | grep LISTEN
    else
        clear_screen
        main_menu
    fi
}

function disk_menu () {
    echo "Hardisk And Disk Space options:"
    echo
    
    options=(
        "- Check disk space"
        "- Go back to main menu")

    select_option "${options[@]}"
    choice=$?
    
    #echo "Choosen index = $choice"
    #echo "        value = ${options[$choice]}"
    
    if [ $choice -eq 0 ]
    then
        df -h
    else
        clear_screen
        main_menu
    fi
}



#=== Main function to called
function bai() {
  clear_screen
  main_menu
}