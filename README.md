GettingCleaningData-CourseProject
=================================

Course project of the course Getting and Cleaning Data 

This repository contains the following files 

- A tidy data set called "tidy_data.txt"
- A second tidy data called "reshaping_tidy_data.txt" with the average of each variable for each para dos variables. 
- A script called "run_analysis.R", that prepare tidy data that can be used for later analysis.
- A code book called "CodeBook.md", that describes the variables, the data, and the transformations to clean up the data. 
- A "README.md", with the description and instructions.

About script:
-------------
The script "run_analysis.R" get and clean the Human Activity Recognition (HAR) database, built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smartphone with embedded inertial sensors.

How Work:
---------
The script requires installing the libraries "downloader", "reshape2" and "plyr".
The script contains a function called gcData.HAR() responsible for carrying out the process of obtaining and cleaning the raw data. The raw data is obtained from <https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip> published by [1]
<http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones>
On these data, the script performs the following process: 

    -Merges the training and the test sets to create one data set.
    -Extracts only the measurements on the mean and standard deviation for each measurement. 
    -Uses descriptive activity names to name the activities in the data set
    -Appropriately labels the data set with descriptive variable names. 
    -Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

The results of the script are two files, "tidy_data.txt" with the tidy data resulting and the "reshaping_tidy_data.txt" with the reshaping of tidy data.

To start the script you must load the script.

    -source("run_analysis.R")
    
Running the function.

    -gcData.HAR()

The function will download the raw data with pack.zip name, which will be unzipped into the folder ./data inside your working directory. 
Note: The extracted files should be kept with their original names. 

The script will use the files in the folder "./data/UCI HAR Dataset/", "./data/UCI HAR Dataset/train/" and "./data/UCI HAR Dataset/test/".

Upon completion, the function created in the folder "./data" of your working directory: The tidy data file an the reshaping of the tidy data called
"tidy_data.txt" and "reshaping_tidy_data.txt".

About the raw data:
-------------------
The raw data is the result of a experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 


[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
