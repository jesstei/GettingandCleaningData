# Code Book

## Features 

I recommend to read the README and features.txt files in the original dataset to learn more about the feature selection of this dataset.

The final data set consists of the following features:

"activity"  
"subject"  
"tBodyAcc-mean()-X"  
"tBodyAcc-mean()-Y"  
"tBodyAcc-mean()-Z"  
"tGravityAcc-mean()-X"  
"tGravityAcc-mean()-Y"  
"tGravityAcc-mean()-Z"  
"tBodyAccJerk-mean()-X"  
"tBodyAccJerk-mean()-Y"  
"tBodyAccJerk-mean()-Z"  
"tBodyGyro-mean()-X"  
"tBodyGyro-mean()-Y"  
"tBodyGyro-mean()-Z"  
"tBodyGyroJerk-mean()-X"  
"tBodyGyroJerk-mean()-Y"  
"tBodyGyroJerk-mean()-Z"  
"tBodyAccMag-mean()"  
"tGravityAccMag-mean()"  
"tBodyAccJerkMag-mean()"  
"tBodyGyroMag-mean()"  
"tBodyGyroJerkMag-mean()"  
"fBodyAcc-mean()-X"  
"fBodyAcc-mean()-Y"  
"fBodyAcc-mean()-Z"  
"fBodyAcc-meanFreq()-X"  
"fBodyAcc-meanFreq()-Y"  
"fBodyAcc-meanFreq()-Z"  
"fBodyAccJerk-mean()-X"  
"fBodyAccJerk-mean()-Y"  
"fBodyAccJerk-mean()-Z"  
"fBodyAccJerk-meanFreq()-X"  
"fBodyAccJerk-meanFreq()-Y"  
"fBodyAccJerk-meanFreq()-Z"  
"fBodyGyro-mean()-X"  
"fBodyGyro-mean()-Y"  
"fBodyGyro-mean()-Z"  
"fBodyGyro-meanFreq()-X"  
"fBodyGyro-meanFreq()-Y"  
"fBodyGyro-meanFreq()-Z"  
"fBodyAccMag-mean()"  
"fBodyAccMag-meanFreq()"  
"fBodyBodyAccJerkMag-mean()"  
"fBodyBodyAccJerkMag-meanFreq()"  
"fBodyBodyGyroMag-mean()"  
"fBodyBodyGyroMag-meanFreq()"  
"fBodyBodyGyroJerkMag-mean()"  
"fBodyBodyGyroJerkMag-meanFreq()"  
"angle(tBodyAccMean,gravity)"  
"angle(tBodyAccJerkMean),gravityMean)"  
"angle(tBodyGyroMean,gravityMean)"  
"angle(tBodyGyroJerkMean,gravityMean)"  
"angle(X,gravityMean)"  
"angle(Y,gravityMean)"  
"angle(Z,gravityMean)"  
"tBodyAcc-std()-X"  
"tBodyAcc-std()-Y"  
"tBodyAcc-std()-Z"  
"tGravityAcc-std()-X"  
"tGravityAcc-std()-Y"  
"tGravityAcc-std()-Z"  
"tBodyAccJerk-std()-X"  
"tBodyAccJerk-std()-Y"  
"tBodyAccJerk-std()-Z"  
"tBodyGyro-std()-X"  
"tBodyGyro-std()-Y"  
"tBodyGyro-std()-Z"  
"tBodyGyroJerk-std()-X"  
"tBodyGyroJerk-std()-Y"  
"tBodyGyroJerk-std()-Z"  
"tBodyAccMag-std()"  
"tGravityAccMag-std()"  
"tBodyAccJerkMag-std()"  
"tBodyGyroMag-std()"  
"tBodyGyroJerkMag-std()"  
"fBodyAcc-std()-X"  
"fBodyAcc-std()-Y"  
"fBodyAcc-std()-Z"  
"fBodyAccJerk-std()-X"  
"fBodyAccJerk-std()-Y"  
"fBodyAccJerk-std()-Z"  
"fBodyGyro-std()-X"  
"fBodyGyro-std()-Y"  
"fBodyGyro-std()-Z"  
"fBodyAccMag-std()"  
"fBodyBodyAccJerkMag-std()"  
"fBodyBodyGyroMag-std()"  
"fBodyBodyGyroJerkMag-std()" 




###Activities

The feature Activities describes which activity is performed by the subjects. The feature activity consists of six string values (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist.. 

### Subject
The data set consists of 30 volunteers. The feature subject describes a single person as an integer value.

## Required libraries within run_analysis.R

The following libraries are loaded by the run_analysis.R script: plyr, dplyr, data.table and tidyr.


## Variables within run_analysis.R
The variables activities, features, trainX,  trainY, trainSub, testSub, testY, testX are used to read in the data set. 

columnNames provides the column names as string and are used to rename the labels from the columns of trainX and testX to descriptive variable names.

observations consists of all data sets within testX and trainX. ActivitiesID is used to merge testY and trainY. Finally, subjects describes all participating persons and thus are used to merge testSub and trainSub.

The variable subset only consists of columns with column name including mean and std and thus reduces the data set to 10299 observations and 86 variables.

The variable firstdataset merges the variables subset, subjects and activitiesID to retrieve a complete dataset in a single variable. 

firstdatasetActivity and firstdatasetSubject provide the activity and subject data as factor. This transformation is necessary to perform the next command. 

The groupedDataSet consists of data grouped by eas of activity and subject. The dataset of groupedDataSet consists of 180 observations and 88 variables, because activity and subject is now duplicated. 
These two columns are dropped using groupedDataSet[,90] = NULL and groupedDataSet[,89] = NULL.





