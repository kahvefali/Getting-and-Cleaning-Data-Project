==================================================================
Getting and Cleaning Data Course Project
Version 1.0
==================================================================

This document was prepared to summarise the project, how to run the run_analysis.R script and summary of the output. To get more information about the output variables, please check the CodeBook.md, the input files, please read the README document.

==================================================================

 The purpose of this project is to collect, merge and clean a data set in order to prepare tidy data that can be used for later analysis.

 An R script called run_analysis.R was created that does the following:

1. Merges the training and the test sets to create one data set.
2. Extracts only the measurements on the mean and standard deviation for each measurement. 
3. Uses descriptive activity names to name the activities in the data set
4. Appropriately labels the data set with descriptive variable names. 
5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

==================================================================

 Following steps are followed in the script:

A. Calls dplyr and plyr libraries first.
B. Reads the training and test datasets.
	
There are 3 text files under train folder and 3 text files under test folder:

- 'X_train.txt': Training set.

- 'y_train.txt': Contains training labels that shows the type of activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING). 	

- 'subject_train.txt': Contains the subject labes for training data set (the experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years)

- 'X_test.txt': Test set.

- 'y_test.txt':Contains test labels that shows the type of activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING).

- 'subject_test.txt':Contains the subject labes for test data set (the experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years)

C. Creates a unique row id for the training and test tables 
D  Merges X_train, y_train and subject_train data tables, merges X_test, y_test and subject_test and label the tables as train and test.
E. Appends train and test data tables in order to create one master table
F. Reads features table to get the variables names related with the mean and standard deviation and chooses only related fields from master table

Data files used:
- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

G. Gets the descriptive activity names to name the activities in the data set

Data files used:
- 'activity_labels.txt': Links the class labels with their activity name.

H. Labels the data set with descriptive variable names by using features table
I. Creates a second, independent tidy data set with the average of each variable for each activity and each subject
J. Exports output data set as text file, called 'GCD_Project_step5.txt'






