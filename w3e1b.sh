echo "Enter a number: "
number 
echo "The multiplication table of $number is: "
for i in {1..10}
do 
	echo "$number x $i = $((number*i))"
done
