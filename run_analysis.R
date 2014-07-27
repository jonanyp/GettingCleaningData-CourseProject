
## This function get and clean the Human Activity Recognition (HAR) database, 
## built from the recordings of 30 subjects performing activities of daily 
## living (ADL) while carrying a waist-mounted smartphone with embedded
## inertial sensors <http://archive.ics.uci.edu/ml/datasets/
## Human+Activity+Recognition+Using+Smartphones>.
## The function  creates two files in the directory "./data". 
## The files created are: "tidy_data.txt" with the tidy data and 
## "reshaping_tidy_data.txt" with the reshaping of tidy data with the average of
## each variable for each activity and each subject.

gcData.HAR <- function() {
        require("downloader")
        require("plyr")
        require("reshape2")
        ##
        ## Download the raw data package
        ##
        
        ## Verification of the directory to datas
        if(!file.exist("data")) dir.create("./data")
        
        fileURL <- "https://d396qusza40orc.cloudfront.net/
        getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
        
        download(fileURL, "./data/pack.zip", mode = "wb")
        
        ## Unzip the zip file
        unzip("./data/pack.zip", files = NULL, list = FALSE, overwrite = TRUE,
              exdir = "./data/", unzip = "internal") 
        
        ##
        ## Loading the package files raw datas.
        ##
        
        ## The constants DIR_PACK, DIR_TRAIN and DIR_TEST containing the
        ## path to the directory the unzipped files.        
        DIR_PACK <- "./data/UCI HAR Dataset/"
        DIR_TRAIN <- "./data/UCI HAR Dataset/train/"
        DIR_TEST <- "./data/UCI HAR Dataset/test/"
        
        ## The Data frames "trainXData", "trainActivityData" and "trainSubjectData",
        ## store datas of the processed measures, activity undertaken and
        ## subject volunteers to the set training respectively.
        ## The data frames "testXData", "testActivityData" and "testSubjectData" 
        ## contain test datas equivalent to the set training.
        ## The data frame "featuresData" contain descriptive datas of 
        ## activities and the data frame "ActivityLabels" the descriptive datas for activities.
        trainXData <- read.table(paste0(DIR_TRAIN, "X_train.txt"),
                                 colClasses = "double")
        trainActivityData <- read.table(paste0(DIR_TRAIN, "y_train.txt"),
                                        colClasses = "integer")
        trainSubjectData <- read.table(paste0(DIR_TRAIN, "subject_train.txt"),
                                       colClasses = "integer")
        
        testXData <- read.table(paste0(DIR_TEST, "X_test.txt"), 
                                sep = "", skip = 0, colClasses = "double")
        testActivityData <- read.table(paste0(DIR_TEST, "y_test.txt"), 
                                       colClasses = "integer")
        testSubjectData <- read.table(paste0(DIR_TEST, "subject_test.txt"),
                                      colClasses = "integer")
        
        featuresData <- read.table(paste0(DIR_PACK, "features.txt"))
        ActivityLabels <- read.table(paste0(DIR_PACK, "activity_labels.txt"))
        
        ##
        ## Merges the training and the test sets to create one data set.
        ##
        
        ## Las variables "dataSet1" y "dataSet2" shape the training and the
        ## test sets respectively, that together create the data set.
        dataSet1 <- cbind(trainSubjectData, trainActivityData, trainXData)
        dataSet2 <- cbind(testSubjectData, testActivityData, testXData)
        dataSet <- rbind(dataSet1, dataSet2)
        
        ## Adding column names for data set.
        colnames(featuresData) <- c("Id", "Feature")
        colnames(dataSet) <- c("ID.Subject", "Activity", 
                               as.character(featuresData$Feature))
        
        ##
        ## Extracting only the measurements on the mean and standard deviation 
        ## for each measurement
        ##
        
        ## The variable "cIndex" is an integer vector that store the index of
        ## the column whose column name includes the word "mean" or "std".
        ## The "dataSet.sub" is the subsetting of dataset with the variables
        ## "Subject", "Activity" and corresponding to "cIndex".
        cIndex <- grep("mean\\(\\)|std\\(\\)", names(dataSet))
        dataSet.sub <- dataSet[, c(1, 2, cIndex)]
        
        
        ##
        ## Adding labels to the data set with descriptive variable names
        ##
        
        ## Replacing characters in column names
        names(dataSet.sub) <- gsub("\\-","",names(dataSet.sub),)
        names(dataSet.sub) <- gsub('^t','Time.',names(dataSet.sub),)
        names(dataSet.sub) <- gsub('^f','Freq.',names(dataSet.sub),)
        names(dataSet.sub) <- gsub("Body","Body.",names(dataSet.sub),)
        names(dataSet.sub) <- gsub("Gyro","Gyro.",names(dataSet.sub),)
        names(dataSet.sub) <- gsub("Jerk","Jerk.",names(dataSet.sub),)
        names(dataSet.sub) <- gsub("Gravity","Gravity.",names(dataSet.sub),)
        names(dataSet.sub) <- gsub("Mag","Magnitude.",names(dataSet.sub),)
        names(dataSet.sub) <- gsub("Acc","Acceleration.",names(dataSet.sub),)
        names(dataSet.sub) <- gsub("mean","Mean",names(dataSet.sub),)
        names(dataSet.sub) <- gsub("std","STD",names(dataSet.sub),)
        names(dataSet.sub) <- sub("\\(\\)$","",names(dataSet.sub),)
        names(dataSet.sub) <- sub("\\(\\)",".",names(dataSet.sub),)
        
        ##
        ## Establishing descriptive activity names to name the activities in
        ## the data set
        ##
        dataSet.sub$Activity <- factor(dataSet.sub$Activity,labels=ActivityLabels$V2)

        ##
        ## Establishing format to the subject id.
        ##
        dataSet.sub$ID.Subject <- sprintf("%02d", dataSet.sub$ID.Subject)
        
        ## Tidy data
        ##
        tidyData <- dataSet.sub
        
        ## Writing tidy data in the folder ./data of the working directory.
        write.table(tidyData,"./data/tidy_data.txt", row.names = FALSE)
        
        ##
        ## Reshaping data, independent tidy data set with the average of each variable
        ## for each activity and each subject. 
        ##
        meltingData <- melt(tidyData, id.vars = c("ID.Subject", "Activity"))
        castingData <- dcast(meltingData, ID.Subject + Activity ~ variable, fun.aggregate=mean)
        
        ## Witing the reshaping of tidy data in the folder ./data of the working directory.
        write.table(castingData,"./data/reshaping_tidy_data.txt", row.names = FALSE)
        
}
