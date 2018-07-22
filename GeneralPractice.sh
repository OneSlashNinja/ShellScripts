#! /bin/bash

# eho command
echo "Hello World!"

# VARIABLES

NAME="Derek"

echo "Hello $NAME"
echo "Hello again ${NAME}"

# User Input
read -p "Please input your name: " NAME
echo "Hello $NAME!"

# IF Statement
if [ "$NAME" == "Derek" ]
then
    echo "Your name is Derek"
elif [ "$NAME" == "Madeline" ]
then
    echo "Your name is Madeline"
else
    echo "Your name is not Derek or Madeline"
fi

# Comparison
########
# val1 -eq val2 Returns true if the values are equal
# val1 -ne val2 Returns true if the values are not equal
# val1 -gt val2 Returns true if val1 is greater than val2
# val1 -ge val2 Returns true if val1 is greater than or equal to val2
# val1 -lt val2 Returns true if val1 is less than val2
# val1 -le val2 Returns true if val1 is less than or equal to val2
########
NUM1=10
NUM2=20

if [ "$NUM1" -gt "$NUM2" ]
then
    echo "$NUM1 is greater than $NUM2"
else
    echo "$NUM1 is not greater than $NUM2"
fi

# File Conditions
########
# -d file   True if the file is a directory
# -e file   True if the file exists (note that this is not particularly portable, thus -f is generally used)
# -f file   True if the provided string is a file
# -g file   True if the group id is set on a file
# -r file   True if the file is readable
# -s file   True if the file has a non-zero size
# -u    True if the user id is set on a file
# -w    True if the file is writable
# -x    True if the file is an executable
########

FILE="test.txt"
if [ -f "$FILE" ]
then
    echo "$FILE is a file"
else
    echo "$FILE is not a file"
fi

# Case Statement
read -p "Are you 21 or over? Y/N" ANSWER
case "$ANSWER" in
    [yY] | [yY][eE][sS])
        echo "You may have a beer :)"
        ;;
    [nN] | [nN][oO])
        echo "Sorry, no drinking"
        ;;
    *) # this is for default case
        echo "Please enter y/yes or n/no"
        ;;
esac

# FOR LOOP
NAMES="Derek Ninja Tiger"
for NAME in $NAMES # Do not put a $ before NAME c/s we are defining a variable called NAME
    do
        echo "Hello $NAME"
done

# For loop to Rename Files
FILES=$(ls *.txt)
NEW="new"
for FILE in $FILES
    do
        echo "Renaming $FILE to $NEW-$FILE"
        mv $FILE $NEW-$FILE
done


# While Loop - read through file line by line
# text generated from lipsum.com
LINENUM=1
while read -r CURRENT_LINE
    do
        echo "$LINENUM: $CURRENT_LINE"
        ((LINENUM++))
done < "./test.txt"

# Function
function sayHello(){
    echo "Hello World!"
}

sayHello #notice there is no ()


# Function with Params
function geet(){
    echo "Hello $1, Hello $2"
}

geet "Derek" "Madeline"

# Create Folder and write to a file

mkdir hello
touch "hello/world.txt"
echo "Hello world" >> "hello/world.txt"
echo "File created"