#load libs
library(plyr)
library(dplyr)
library(data.table)
library(tidyr)

#Read in Data
activities <- read.table("activity_labels.txt")
features <- read.table("features.txt")
trainX <- read.table("train/X_train.txt")
trainY <- read.table("train/Y_train.txt")
trainSub <- read.table("train/subject_train.txt")
testSub <- read.table("test/subject_test.txt")
testY <- read.table("test/Y_test.txt")
testX <- read.table("test/X_test.txt")

# Extract Column names
columnNames = features[,2]

#Rename columns 
names(testX) <- columnNames
names(trainX) <- columnNames
names(activities)[2] <- "activity"

# Merge data sets
observations <- rbind(testX, trainX)
activitiesID <- rbind(testY, trainY)
subjects <- rbind(testSub, trainSub)

#select columns with column name including mean and std
subset <- select(observations, contains("mean"), contains("std"))

names(activitiesID)[1] <- "activity"
names(subjects)[1] <- "subjects"

# change int values to string 
activitiesID[activitiesID==1] <- "WALKING"
activitiesID[activitiesID==2] <- "WALKING_UPSTAIRS"
activitiesID[activitiesID==3] <- "WALKING_DOWNSTAIRS"
activitiesID[activitiesID==4] <- "SITTING"
activitiesID[activitiesID==5] <- "STANDING"
activitiesID[activitiesID==6] <- "LAYING"

#merge to single data set
firstdataset<- cbind(subset, subjects, activitiesID)
firstdatasetActivity <- as.factor(firstdataset$activity)
firstdatasetSubject <- as.factor(firstdataset$subject)

# group dataset by mean of actvitiy and subject
groupedDataSet = aggregate(firstdataset, by=list(activity = firstdatasetActivity, subject=firstdatasetSubject), mean)

# drop activity and subject in the data set as not needed
groupedDataSet[,90] = NULL
groupedDataSet[,89] = NULL
write.table(groupedDataSet, file="final_dataset.txt", row.name=FALSE)