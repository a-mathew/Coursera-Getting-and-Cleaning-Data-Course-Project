## Peer-graded Assignment: Getting and Cleaning Data Course Project
### The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. 
### The goal is to prepare tidy data that can be used for later analysis.

### Dataset Used : UCI HAR Dataset.zip
#### Source URL : https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip
#### Dataset Abstract: Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

### Dataset Created : data_set, tidy_data
#### data_set : Merged Train and Test datas with descriptive variable names and columns
#### tidy_data :Contains independent tidy data set with the average of each variable for each activity and each subject.


### Following files are included :
#### 1. README.md
#### 2. run_analyis.R : R Script for getting and cleaning data
#####                  -> Reads test and train datas and merges it into one dataset
#####                  -> Assign descriptive names for variables and column names
#####                  -> Creates a tidy data set with mean of measurement variables w.r.t each subject and each activity
#####                  -> Stores tidy data set in tidy_data.txt file.
#### 3. CodeBook.md : File describing all the variables and steps involved in run_analysis.R

#### Notes:
