# Getting and Cleaning Data Course Project

This is the final project for the Coursera's MOOC Getting and Cleaning Data.
The objective of the procect is to demonstrate my hability to collect, work with and clean a data set.

In this file I'm going to put some information about the choices I have made to create run_analysis.R.

# Read files
The first thing I have done was read the files using read.table command, from ./UCI HAR Dataset/ folder, and save the results in the follow variables:

subject_test to hold the dataframe from ./UCI HAR Dataset/test/subject_test.txt file. This dataframe holds the subject tested, according to the documentation, 30% of a 30 volunteers group within an age bracket of 19-48 years.

activity_test to hold the dataframe from ./UCI HAR Dataset/test/y_test.txt file. This dataframe holds the activities performed by the tested volunteers (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

measurement_test to hold the dataframe from ./UCI HAR Dataset/test/X_test.txt file. The 561 measurements captured by the Samsung Galaxy S II.

subject_train to hold the dataframe from ./UCI HAR Dataset/train/subject_train.txt file. Same as subject_test but for the train group.

activity_train to hold the dataframe from ./UCI HAR Dataset/train/y_train.txt file. Same as subject_test but for the train group.

measurement_train to hold the dataframe from ./UCI HAR Dataset/train/X_train.txt file. Same as subject_test but for the train group.

features to hold the dataframe from ./UCI HAR Dataset/features.txt file. All the 561 measurements labels and codes.

activity_labels to hold the dataframe from ./UCI HAR Dataset/activity_labels.txt file.

# Merge the test and train dataframes individually
With rbind command I have created a subject dataframe that binds together the subject_test and subject_train dataframes.
I have done the same for the activity dataframe - binding the activity_test and activity_train - and for dataframe
measurement that <- rbind(measurement_test, measurement_train).
rbind binds by row, appending the content of second dataframe to the end of the first one.

# Change column names
In order to give more descriptive names for the columns the dataframe subject, that have just one column, received the subject name. The activity dataframe, also with just one column, received the same name, subject. The measurement dataframe has 561 columns, and all the names comes from the features dataframe

# Merge all datasets together
With cbind command I was able to combine all the subject + activity + measurement datasets.

# Extracted the measurements on the mean and standard deviation
more information in the script comments.

# Changed to descriptive activity names
more information in the script comments.

# Labeled the data set with more descriptive variable names
more information in the script comments.

# Generate the final dataset
Unfortunatelly I was not able to finish this final task. I have strugled a lot with dcast and melt from reshape2 library but couldn't find a solution on time. 
