#!/usr/bin/bash

# this down here is a multi-line comment 
: <<'com'
you will create a report based on a supplied dataset using the CSV format. 
You will extract the columns of the dataset into separate arrays and create a new column using arithmetic and array logic. 
Finally, you will combine the dataset with the new column and save the resulting report as a CSV file.
com

csv="./arrays_table.csv"

# Parse table columns into 3 arrays
column1=($(cut -d "," -f 1 $csv))
column2=($(cut -d "," -f 2 $csv))
column3=($(cut -d "," -f 3 $csv))

# Printing first array
echo "Displaying the first column: "
echo "${column1[@]}"

# Create a new array as the difference of columns 2 and 3
# Initialize array with header
column4=("column_3")
# Get the number of lines in the file (excluding header)
nlines=$(($(cat $csv | wc -l) - 1))
echo "There are $nlines data lines in the file."

# Populate the array (skip the header)
for ((i=1; i<=$nlines; i++)); do
    column4[$i]=$((column3[$i] - column2[$i]))
done

# Print the new column
echo "New column: ${column4[@]}"

# Combine the new array with the CSV file
# Initialize the file with a header
echo "${column4[0]}" > column4.txt

# Write the new array to the file
for ((i=1; i<=nlines; i++)); do
  echo "${column4[$i]}" >> column4.txt
done

# Combine CSV file and new column into the final report
paste -d "," $csv column4.txt > report.csv
echo "Report saved as report.csv"

# Clean up temporary files
rm column4.txt
