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



#To print a message
echo Good Morning, Have a nice day!

#To print a message with colors
# echo -e "\e[CODEmMESSAGE\e[0m"
# Red       31
# Green     32
# Yellow    33
# Blue      34
# Magenta   35
# Cyan      36

echo -e "\e[33mHello\e[0m"

#Variables
a=10
echo a is $a

DATE=$(date)   #date variable
echo Today date is $DATE

ADD=$(( 2+2 ))   #special variables
echo add of 2+2 = $ADD

#Conditional statements
#if [ condition ]
#then
#  statements
#  fi
x=10
y=12
if [ $x -eq $y ]
then
  echo "EQUAL"
  else
    echo "NOT EQUAL"
  fi

#while condition
#while [ condition ]
#do
#  statements
#  done
