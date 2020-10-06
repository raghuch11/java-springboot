# A menu driven shell script sample template 
## ----------------------------------
# Step #1: Define variables
# ----------------------------------
EDITOR=vim
PASSWD=/etc/passwd
RED='\033[0;41;30m'
STD='\033[0;0;39m'
 
# ----------------------------------
# Step #2: User defined function
# ----------------------------------
pause(){
  read -p "Press [Enter] key to continue..." fackEnterKey
}

one(){
	echo "nano called, enter filename "
        local filename
	read -p "Enter filename :" filename
        nano $filename
        pause
}
 
# do something in two()
two(){
echo "enter filename: "

 local fname
read -p "enter file name" fname
echo " filnem is "
if [ ! -f $fname ]; then
    echo "No such file!" >&2
    exit 1
fi


lines=$( wc -l <"$fname" )
words=$( wc -w <"$fname" )
chars=$( wc -c <"$fname" )

printf 'The file "%s" has %d lines, %d words and %d characters\n' \ "$fname" "$lines" "$words" "$chars"        
pause
}
three(){
	local filename
	read -p "Enter filename :" filename
        read -p "more or less :" ml
    if [ $ml == 'm' ]; then
        more $filename
else 
      less $filename
fi
        pause
}

four(){
	local filename
	read -p "Enter filename to sort :" filename
sort $filename >> sorted.txt
read -p "select cat or more to display data :" cm
 if [ $cm == 'c' ]; then
        cat sorted.txt
else 
      more sorted.txt
fi

pause
}

 
# function to display menus
show_menus() {
	clear
	echo "~~~~~~~~~~~~~~~~~~~~~"	
	echo " M A I N - M E N U"
	echo "~~~~~~~~~~~~~~~~~~~~~"
	echo "1. Use nano editor"
	echo "2. Run word count"
	echo "3. Display the output"
	echo "4. Sort"
	echo "5. Exit"
}
# read input from the keyboard and take a action
# invoke the one() when the user select 1 from the menu option.
# invoke the two() when the user select 2 from the menu option.
# Exit when user the user select 3 form the menu option.
read_options(){
	local choice
	read -p "Enter choice [ 1 - 3] " choice
	case $choice in
		1) one ;;
		2) two ;;
      		3) three ;;
		4) four ;;
		5) exit 0;;
		*) echo -e "${RED}Error...${STD}" && sleep 2
	esac
}
 
# ----------------------------------------------
# Step #3: Trap CTRL+C, CTRL+Z and quit singles
# ----------------------------------------------
trap '' SIGINT SIGQUIT SIGTSTP
 
# -----------------------------------
# Step #4: Main logic - infinite loop
# ------------------------------------
while true
do
 
	show_menus
	read_options
done
