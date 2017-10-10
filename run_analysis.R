# Programming Assignment - Getting and Cleaning Data Course Project 

##Dataset Given :  Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.
##                 UCI HAR Dataset.zip

if(!file.exists("UCI HAR Dataset.zip")){
file_URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(file_URL,destfile="UCI HAR Dataset.zip",method="auto")
}
###Unzipping file to the directory
unzip("UCI HAR Dataset.zip")
###Loading required packages
library(reshape)

## 1. Merge the training and the test sets to create one data set.

###Test Dataset
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt",header = FALSE,stringsAsFactors = FALSE)
x_test <- read.table("UCI HAR Dataset/test/X_test.txt",header = FALSE)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt",header = FALSE,stringsAsFactors = FALSE)
test <- cbind(subject_test,y_test,x_test)



###Train Dataset
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt",header = FALSE,stringsAsFactors = FALSE)
x_train <- read.table("UCI HAR Dataset/train/X_train.txt",header = FALSE,stringsAsFactors = FALSE)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt",header = FALSE,stringsAsFactors = FALSE)
train <- cbind(subject_train,y_train,x_train)


###Merging Test and Train Datasets into single dataset 'data_set'
data_set <- rbind(test,train)



## 2. Extracts only the measurements on the mean and standard deviation for each measurement.

features <- read.table("UCI HAR Dataset/features.txt")
Tomatch <- c(".*-std().?",".*-mean().?")
index <- grep(paste(Tomatch,collapse="|"),features[,2])
index <- index + 2
###Including only required features and Subject and ACtivity columns
data_set <- data_set[,c(1,2,index)]



## 3. Uses descriptive activity names to name the activities in the data set
activityLabels <- read.table("UCI HAR Dataset/activity_labels.txt")
activitynames <- as.character(activityLabels[,2])
data_set[,2] <- factor(data_set[,2],levels = activityLabels[,1],labels = activitynames)


## 4. Appropriately labels the data set with descriptive variable names. 
featurenames <- as.character(features[index,2])
colnames(data_set) <- c("Subject","Activity",featurenames)

## 5. Create a second, independent tidy data set with the average of each variable for each activity and each subject.
###tidy_data is created and written to file 'tidy_data.csv'

summary_dataset <- melt(data_set, id = c("Subject","Activity"))
tidy_data <- cast(summary_dataset,Subject+Activity~variable,mean)
write.table(tidy_data,"UCI HAR Dataset/tidy_data.txt",row.names=FALSE)

