#! /user/bin/bash

: <<'com'
Scenario
You've been tasked by your team to create an automated Extract, Transform, Load (ETL) process 
to extract daily weather forecast and observed weather data and load it into a live report to 
be used for further analysis by the analytics team. As part of a larger prediction modelling project, 
the team wants to use the report to monitor and measure the historical accuracy of temperature forecasts by source and station.

As a proof-of-concept (POC), you are only required to do this for a single station and one source to begin with. 
For each day at noon (local time), you will gather both the actual temperature and the temperature forecasted for 
noon on the following day for Casablanca, Morocco.

At a later stage, the team anticipates extending the report to include lists of locations, 
different forecasting sources, different update frequencies, and other weather metrics such as wind speed and direction, 
precipitation, and visibility.

Data source
For this practice project, you'll use the weather data package provided by the open source project wttr.in, 
a web service that provides weather forecast information in a simple and text-based format. For further information, 
you can read more about the service on its GitHub Repo.

First, you'll use the curl command to scrape weather data via the wttr.in website. 
For example, to get data for Casablanca, enter:
# curl wttr.in/casablanca

Download today’s weather report from wttr.in
Tip: It’s good practice to keep a copy of the raw data you are using to extract the data you need.

By appending a date or time stamp to the file name, you can ensure it’s name is unique.
This builds a history of the weather forecasts which you can revisit at any time to recover from errors or expand the scope of your reports
Using the prescribed date format ensures that when you sort the files, they will be sorted chronologically. It also enables searching for the report for any given date.
If needed, you can compress and archive the files periodically. You can even automate this process by scheduling it.

Extracting the required data is a process that will take some trial and error until you get it right.
Study the weather report you downloaded, and determine what you need to extract. Look for patterns.
You must find a way to ‘chip away’ at the weather report:

Use shell commands to extract only the data you need (the signal)
Filter everything else out (the noise)
Combine your filters into a pipeline (recall the use of pipes to chain filters together)
Tip: We introduce three more simple filters here that you will find very useful for your data extraction strategy.

tr - trim repeated characters to a single character.
For example, to remove extra spaces from text:

echo "There are    too    many spaces in this    sentence." | tr -s " "
{: codeblock}

xargs - can be used to trim leading and trailing spaces from a string.
For example, to remove the spaces from the begining and the end of text:

echo " Never start or end a sentence with a space. " | xargs 
rev - reverse the order of characters on a line of text.
Try entering the following commmand:

echo ".sdrawkcab saw ecnetnes sihT" | rev
{: codeblock}

You will find rev to be a useful operation to apply in combination with the cut command.
For example, suppose you want to access the last field in a delimited string of fields:

# print the last field of the string
echo "three two one" | rev | cut -d " " -f 1 | rev
You will also find xargs to be a useful operation to apply in combination with the cut command.
For example, suppose you want to access the last word in a sentence as above, but there happens to be an extra space at the end:

# Unfortunately, this prints the last field of the string, which is empty:
echo "three two one " | rev | cut -d " " -f 1 | rev
# But if you trim the trailing space first, you get the expected result:
echo "three two one " | xargs | rev | cut -d " " -f 1 | rev

FULL SOLUTION:

#! usr/bin/bash

# create a datestamped filename for the raw wttr data:
today=$(date +%Y%m%d)
weather_report=raw_data_$today

# download today's weather report from wttr.in:
city=Casablanca
curl wttr.in/$city --output $weather_report

# use command substitution to store the current day, month, and year in corresponding shell variables:
hour=$(TZ='Morocco/Casablanca' date -u +%H) 
day=$(TZ='Morocco/Casablanca' date -u +%d) 
month=$(TZ='Morocco/Casablanca' date +%m)
year=$(TZ='Morocco/Casablanca' date +%Y)

# extract all lines containing temperatures from the weather report and write to file
grep °C $weather_report > temperatures.txt

# extract the current temperature 
obs_tmp=$(head -1 temperatures.txt | tr -s " " | xargs | rev | cut -d " " -f2 | rev)

# extract the forecast for noon tomorrow
fc_temp=$(head -3 temperatures.txt | tail -1 | tr -s " " | xargs | cut -d "C" -f2 | rev | cut -d " " -f2 |rev)

# create a tab-delimited record
# recall the header was created as follows:
# header=$(echo -e "year\tmonth\tday\thour_UTC\tobs_tmp\tfc_temp")
# echo $header>rx_poc.log

record=$(echo -e "$year\t$month\t$day\t$obs_tmp\t$fc_temp")
# append the record to rx_poc.log
echo $record>>rx_poc.log
com





