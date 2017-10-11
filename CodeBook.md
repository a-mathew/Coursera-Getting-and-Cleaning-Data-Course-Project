# Code Book for run_analysis.R

## Initial Setting Up
### The script first checks for an exisiting instance of UCI HAR Dataset.zip in the working directory, and if unavailable the file is downloaded from URL
### The dataset is unzipped
### Loading required packages : reshape

## 1. Read and Merge train and test data sets to data_set
 
   ### subject_test : Subject id for test {Range 1:30} (Read from subject_test.txt)
   ### x_test : Values of measurements for test (Read from x_test.txt)
   ### y_test : Activity id and activity labels (Read from y_test.txt)
   ### test : Combined test data (Combined from subject_test,x_test,y_test) 
 
   ### subject_train : Subject id for train {Range 1:30} (Read from subject_train.txt)
   ### x_train : Values of measurements for train (Read from x_train.txt)
   ### y_train : Activity id and activity labels (Read from y_train.txt)
   ### train : Combined test data (Combined from subject_test,x_test,y_test)
   
   ### data_set : Merged Test and Train dataset (Bind test and train)
   
## 2. Extracts Mean and Standard Deviation Measurements
   
   ### features : Names of Measurement Variables and ID (Read from features.txt)
   ### index : Index of mean and standard deviation measurements in features (Using grep function in features)
   ### data_set : Updated version of data_set with a subset of original data set with index
   
## 3. Assign Activity Names to Activity Column

  ### activityLabels : Activity ID and Names of Activities  (Read from activity_labels.txt)
  ### activitynames : Names of Activities (From activityLabels)
  ### data_set : Updated version of data_set with Activity Column as a factor of 6 Levels and Labels from activitynames
  
## 4. Assign Features Name to Measurement Variable Columns

  ### featurenames : Names of Measurement Variables
  ### data_set : Updated version of data_set with Measurement Variable Columns given descriptive names using featurenames

## 5. Create Tidy Data Set with Average values for each Activity and each Subject

   ### summary_dataset : Melted data_set with Subject and Activity as ID
   ### tidy_data : Casted Data Set with mean of measurements w.r.t Subject and Activity
  ### The tidy_data dataset is written into tidy_data.txt for future evaluvation

   
