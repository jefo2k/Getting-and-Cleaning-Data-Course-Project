# Getting and Cleaning Data Course Project

This is the final project for the Coursera's MOOC Getting and Cleaning Data.
The objective of the procect is to demonstrate my hability to collect, work with and clean a data set.

In this file I'm going to put some information about the choices I have made to create run_analysis.R.

# Read files
The first thing I have done was read the files using read.table command, from ./UCI HAR Dataset/ folder, and save the results in the follow variables:

subject_test to hold the dataframe from ./UCI HAR Dataset/test/subject_test.txt file.
activity_test to hold the dataframe from ./UCI HAR Dataset/test/y_test.txt file.
measurement_test to hold the dataframe from ./UCI HAR Dataset/test/X_test.txt file.

subject_train to hold the dataframe from ./UCI HAR Dataset/train/subject_train.txt file.
activity_train to hold the dataframe from ./UCI HAR Dataset/train/y_train.txt file.
measurement_train to hold the dataframe from ./UCI HAR Dataset/train/X_train.txt file.

features to hold the dataframe from ./UCI HAR Dataset/features.txt file.

activity_labels to hold the dataframe from ./UCI HAR Dataset/activity_labels.txt file.

# Merge the test and train dataframes individually

# Change column names

# Merge all datasets together

# Extracted the measurements on the mean ans standard deviation

# Changed to descriptive activity names

# Labeled the data set with more descriptive variable names

# Generate the final dataset
Unfortunatelly I was not able to finish this final task. I have strugled a lot with dcast and melt from reshape2 library but couldn't find a solution on time. 
