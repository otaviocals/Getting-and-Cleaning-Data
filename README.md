# Getting and Cleaning Data Programming Assignment
###Written by Otavio Cals
####October/2015


###Introduction

We present here a R program (run_analysis.R) for reading and cleaning the Samsung Human Activity Dataset.

###Preparing to Read the Data

Before running the program, make sure that the UCI HAR Dataset folder is in the working directory.

###Running the Program

The program execute the following steps:

1. ####Read Data
	1. Reads the features.txt file to obtain the list of variable names.
	2. Reads the Train Tables.
		* Reads the X_train.txt file and assign the files.txt variable names to it's columns.
		* Reads the subject_train.txt file.
		* Reads the y_train.txt file.
		* Column bind the data in the following order: subject_train data, y_train data, X_train data.
		* Renames the first two columns of the new data to "subject" and "activity"
	3. Reads the Test Tables.
		* Reads the X_test.txt file and assign the files.txt variable names to it's columns.
		* Reads the subject_test.txt file.
		* Reads the y_test.txt file.
		* Column bind the data in the following order: subject_test data, y_test data, X_test data.
		* Renames the first two columns of the new data to "subject" and "activity".
2. ####Merge Data
	* Column bind the Train Table and Test Table obtained in the first steps.
3. ####Subsetting Data
	* Subsets the values subject, activity and values ending in "mean()" and "std()", to create a new dataset.
4. ####Rename Activities
	* Apply arrange() on the dataset so its arranged in the order of subjects and then in activities.
	* Rename the activities following the information provided in activity_labels.txt.
5. ####Rename Variables
	* Rename the variables in the dataset for easier reading.
6. ####Create Tidy Dataset
	* Apply group_by() in the dataset to group it by subjects and then by activities.
	* Apply summarize() in the grouped dataset, getting the mean value for each variable in each subgroup.
7. ####Saving the Data
	* Outputs data as a .xlsx file named summarized.xlsx and as a tab-delimited .txt file named summarized.txt.
