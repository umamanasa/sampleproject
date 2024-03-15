#To print a message
echo Hello World!!
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
echo -e "\e[36mHello\e[0m"
echo -e "\e[32mHello\e[0m"

#Variables
a=10
echo a is $a

DATE = $(date)
echo Today date is $DATE
ADD = $(2+2)
echo add of 2+2 = $ADD