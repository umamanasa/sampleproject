# positional arguments
echo "No of arguments: $#"
echo "Name of the Script: $0"
echo "First Argument: $1"
echo "Second Argument: $2"

# storing output of commands
# syntax 1
#var=$(linux command )
# syntax 2
#var2='linux command'

# Operations on a file
c = 'cat $file | wc -c'
w = 'cat $file | wc -w'
l=`grep -c "." $file`
