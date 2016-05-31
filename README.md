## Coursera Assignment: "Getting and Cleaning Data Course Project" 


This Repository includes the files and explanation of the Coursera Assignment: "Getting and Cleaning Data Course Project"

The data worked with can be get from: 
https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip 

The data has been collected from the accelerometers from the Samsung Galaxy S smartphone for 30 Persons on 6 different activities.

The original data comes from http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones


#### The Repository includes the following files:

1) **run_analyis.R**
This is the R script to run to do the analysis and cleaning for this project.
Note: packages plyr is used and can be downloaded from CRAN using install.packages("plyr")

The script does the following:
- downloads the file to a directory called Data in your working directory, unzips the file and reads the relevant files into R 
- merges the data as required and gives desciptive labels and column names
- creates a new tidy data frame called tidy_data

2) **CodeBook.md**
This gives the details on the data used and how it has been transformed

3) **tidy_data.csv**
This is the csv format file for the tidy data created by the run_analysis.R script.
It can be viewed by just opening it on github or you can also load it into R using read.csv.





