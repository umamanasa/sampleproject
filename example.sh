#program to display GM,GA,GE,GN according to system time

hour=$(date +%H)
if [ $hour -lt 12 ]
then
  greet="Good Morning"
  elif [ $hour -le 16 ]
  then
    greet="Good Afternoon"
    elif [ $hour -lt 20 ]
    then
      greet="Good Evening"
      else
        greet="Good Night"
        fi
        echo "$greet"