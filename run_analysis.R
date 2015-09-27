## Run_analysis Program
# This program is used to take several text datasets associated with training and testing
# of wearables information, combine them into one dataset, grab a mean and standard deviation
# from the 561 recorded variables, and then summarize the data according to each subject (1-30) 
# and each of six activities.
#
## Set-up and Read-in
library(dplyr)                                                                 # if dplyr package active, comment out this line.
zipfileUrl = "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip" #location of the zip files
temp <- tempfile()                                                             # set up of temp to store the zip files
download.file(zipfileUrl, temp)                                                # download zip files and save to temp
subjectData <- read.table(unz(temp, "UCI HAR Dataset/train/subject_train.txt"))# unzip and read in each file
xtrainData <- read.table(unz(temp, "UCI HAR Dataset/train/X_train.txt"))
ytrainData <- read.table(unz(temp, "UCI HAR Dataset/train/y_train.txt"))
subjectTest <- read.table(unz(temp, "UCI HAR Dataset/test/subject_test.txt"))
xtestData <- read.table(unz(temp, "UCI HAR Dataset/test/X_test.txt"))
ytestData <- read.table(unz(temp, "UCI HAR Dataset/test/y_test.txt"))
#
## Reset Names and Columns for each dataset
subjectData <- rename(subjectData, Subject = V1)                               # rename of single column subject
ytrainData <- rename(ytrainData, Activity_Labels = V1)                         # rename of single column activity
trainDF <- cbind(subjectData, ytrainData, xtrainData[,214:215])                # combine training data and grab two variables
trainDF <- rename(trainDF, tGravAccMag_mean = V214, tGravAccMag_std = V215)    # rename mean and stddev variables
subjectTest <- rename(subjectTest, Subject = V1)                               # rename of single column subject
ytestData <- rename(ytestData, Activity_Labels = V1)                           # rename of single column activity
testDF <- cbind(subjectTest, ytestData, xtestData[,214:215])                   # combine testing data and grab same two var
testDF <- rename(testDF, tGravAccMag_mean = V214, tGravAccMag_std = V215)      # rename mean and stddev variables
#
## Merge Datasets and Create Summary Information
mergedData <- rbind(trainDF, testDF)                                           # append test data to training data
mergedDataSorted <- arrange(mergedData, Subject)                               # sort subjects back into order 1-30
mergedDataSorted$Activity_Labels <- ordered(mergedDataSorted$Activity_Labels, levels = c(1,2,3,4,5,6), 
                                        labels = c("WALKING","WALKING_UPSTAIRS","WALKING_DOWNSTAIRS","SITTING","STANDING","LAYING")) 
                                        # sets factor activity labels and puts them in dataset
mergedDataActivity <- group_by(mergedDataSorted, Subject, Activity_Labels)     # make a grouped dataset on subject and activity
sumMergedData <- summarise(mergedDataActivity, ave_tGravAccMag_mean = mean(tGravAccMag_mean), ave_tGravAccMag_std = mean(tGravAccMag_std))
                                        # summarize data by groups and calculate average of each mean and stddev for each grouping
write.table(sumMergedData, file = "wearables_mean_std.txt", row.names = FALSE) # output summary table as text file
# End.