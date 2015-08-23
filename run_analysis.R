###Getting and Cleaning Data Course Project
###Jeferson Vaz dos Santos
###jefo2k@gmail.com

### READ FILES

### Test group
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt", colClasses = c("numeric"), 
                             header = FALSE, nrows = 2947, comment.char = "", stringsAsFactors = FALSE)
#str(subject_train)

activity_test <- read.table("./UCI HAR Dataset/test/y_test.txt", colClasses = c("numeric"), 
                            header = FALSE, nrows = 2947, comment.char = "", stringsAsFactors = FALSE)
#str(subject_train)

measurement_test <- read.table("./UCI HAR Dataset/test/X_test.txt", colClasses = c("numeric"), 
                               header = FALSE, nrows = 2947, comment.char = "", stringsAsFactors = FALSE)
#str(subject_train)

### Train group
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt", colClasses = c("numeric"), 
                              header = FALSE, nrows = 7352, comment.char = "", stringsAsFactors = FALSE)
#str(subject_train)

activity_train <- read.table("./UCI HAR Dataset/train/y_train.txt", colClasses = c("numeric"), 
                             header = FALSE, nrows = 7352, comment.char = "", stringsAsFactors = FALSE)
#str(activity_train)

measurement_train <- read.table("./UCI HAR Dataset/train/X_train.txt", colClasses = c("numeric"), 
                                header = FALSE, nrows = 7352, comment.char = "", stringsAsFactors = FALSE)
#str(measurement_train)

### Features
features <- read.table("./UCI HAR Dataset/features.txt", colClasses = c("character"), 
                       header = FALSE, nrows = 561, comment.char = "", stringsAsFactors = FALSE)
#str(features)

### Activity lables
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt", header = FALSE, stringsAsFactors = FALSE)

### MERGE THE TEST AND TRAIN DATAFRAMES
### Combine dataframes together vertically (by row)

### subject_test + subject_train
#names(subject_test) == names(subject_train) # check if both dataframes have the same names
subject <- rbind(subject_test, subject_train)

#### activity_test + activity_train
activity <- rbind(activity_test, activity_train)

### measurement_test + measurement_train
#names(measurement_test) == names(measurement_train) # check if both dataframes have the same names
measurement <- rbind(measurement_test, measurement_train)

### CHANGE COLUMN NAMES

colnames(subject)[1] <- "subject"
colnames(activity)[1] <- "activity"
colnames(measurement) <- features[, 2]

### 1. MERGES THE TRAINING AND THE TEST SETS TO CREATE ONE DATA SET
### Combine all dataframes together horizontally (by column)

### subject + activity
full_dataset <- cbind(subject, activity)

### subject + activity + measurement
full_dataset <- cbind(full_dataset, measurement) # answer 1
#str(full_dataset)

### 2. EXTRACTS ONLY THE MEASUREMENTS ON THE MEAN AND STANDARD DEVIATION FOR EACH MEASUREMENT 

length(i <- grep("mean\\(\\)", colnames(full_dataset)))
colnames(full_dataset)[i]

length(j <- grep("std\\(\\)", colnames(full_dataset)))
colnames(full_dataset)[j]

#intersect(colnames(full_dataset)[i], colnames(full_dataset)[j])
#length(colnames(full_dataset)[c(i, j)])
#colnames(full_dataset)[c(i, j)]

small_dataset <- full_dataset[, colnames(full_dataset)[c(1, 2, i, j)]] # answer 2
#colnames(small_dataset)

### 3. USES DESCRIPTIVE ACTIVITY NAMES TO NAME THE ACTIVITIES IN THE DATA SET

### apply the labels with subsetting using sapply
small_dataset$activity <- sapply(small_dataset$activity, 
                                 function(x) activity_labels[activity_labels$V1 == x, 2]) # answer 3

### 4. APPROPRIATELY LABELS THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES

### from ")-" to "" - 48 times
### from "Acc" to "Acceleration" - 41 times
### from "-mean(" to "Mean" - 33 times
### from "-std(" to "StandardDeviation" - 33 times
### from "tBody" to "timeBody" - 32 times
### from "fBody" to "frequencyBody" - 26 times
### from "Gyro" to "Gyroscope" - 26 times
### from "Mag" to "Magnitude" - 18 times
### from "tGravity" to "timeGravity" - 8 times
### from ")" to "" - left ones

colnames(small_dataset) <- gsub("\\)\\-","", colnames(small_dataset))
colnames(small_dataset) <- gsub("Acc","Acceleration", colnames(small_dataset))
colnames(small_dataset) <- gsub("\\-mean\\(","Mean", colnames(small_dataset))
colnames(small_dataset) <- gsub("\\-std\\(","StandardDeviation", colnames(small_dataset))
colnames(small_dataset) <- gsub("tBody","timeBody", colnames(small_dataset))
colnames(small_dataset) <- gsub("fBody","frequencyBody", colnames(small_dataset))
colnames(small_dataset) <- gsub("Gyro","Gyroscope", colnames(small_dataset))
colnames(small_dataset) <- gsub("Mag","Magnitude", colnames(small_dataset))
colnames(small_dataset) <- gsub("tGravity","timeGravity", colnames(small_dataset))
colnames(small_dataset) <- gsub("\\)","", colnames(small_dataset))

colnames(small_dataset) # answer 4

### 5. FROM THE DATA SET IN STEP 4, CREATES A SECOND, INDEPENDENT TIDY DATA SET WITH THE AVERAGE OF EACH VARIABLE FOR EACH ACTIVITY AND EACH SUBJECT

library(reshape2)

#aql <- melt(small_dataset, id.vars = c("subject"))
#aqw <- dcast(aql, subject + activity ~ variable, fun.aggregate = mean)
#data_wide <- dcast(small_dataset, subject ~ activity)
