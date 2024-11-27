#Declare an array 
myarray=("Pushkar" 1 2 "Anuj" 24)

#Add an item to your array:
myarray+="Alka"
myarray+="Kanchan"

#Declare an array and load it with lines of text from a file:
#myarray=($(echo $(cat column.txt)))

#Use a for loop to iterate over values from 1 to 5:
for i in {0..6}; do
    echo "this is iterating number $i"
done

#Use a for loop to print all items in an array:
for item in ${myarray[@]}; do
    echo ${myarray[$i]}
done

#Use array indexing within a for loop, assuming the array has seven elements:
for i in {0..6}; do
    echo ${myarray[$i]}
done