#Course project for Getting and Cleaning Data

#Tasks
#Merges the training and the test sets to create one data set.
#Extracts only the measurements on the mean and standard deviation for each measurement.
#Uses descriptive activity names to name the activities in the data set
#Appropriately labels the data set with descriptive variable names.
#From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

#Download the dataset zip to ./data and unzip it

#download the file
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl,destfile="./data/Dataset.zip")

#unzip the file
unzip(zipfile="./data/Dataset.zip",exdir="./data")

#file path reference - store it in path_rf
path_rf <- file.path("./data" , "UCI HAR Dataset")
files<-list.files(path_rf, recursive=TRUE)

#read the activity test Data
activityTestData  <- read.table(file.path(path_rf, "test" , "Y_test.txt" ),header = FALSE)

#read the activity train Data
activityTrainData <- read.table(file.path(path_rf, "train", "Y_train.txt"),header = FALSE)

#read the subject test Data
subjectTestData <- read.table(file.path(path_rf, "test" , "subject_test.txt"),header = FALSE)

#read the subject test Data
subjectTrainData <- read.table(file.path(path_rf, "train", "subject_train.txt"),header = FALSE)

#read the features test Data
featuresTestData  <- read.table(file.path(path_rf, "test" , "X_test.txt" ),header = FALSE)

#read the features train Data
featuresTrainData <- read.table(file.path(path_rf, "train", "X_train.txt"),header = FALSE)

#1. Merges the training and the test sets to create one data set.

#now it's time to bind by rows and create subject data, activity data & features Data
subjectData <- rbind(subjectTrainData, subjectTestData)
activityData<- rbind(activityTrainData, activityTestData)
featuresData<- rbind(featuresTrainData, featuresTestData)

#give proper names for the columns of the 3 data files
names(subjectData)<-c("subject")
names(activityData)<- c("activity")
featuresNamesData <- read.table(file.path(path_rf, "features.txt"), head=FALSE)

#the second column is what we are interested in
names(featuresData)<- featuresNamesData$V2

# bind by column and get the combined data - Data is the file that we can use for further processing
combinedSubjectActivityData <- cbind(subjectData, activityData)
Data <- cbind(featuresData, combinedSubjectActivityData)

#2. Extracts only the measurements on the mean and standard deviation for each measurement.

#from the featuresNamesData - grep just the names with mean and std
featuresNamesSubdata<-featuresNamesData$V2[grep("mean\\(\\)|std\\(\\)", dataFeaturesNames$V2)]

#subset the data and exract only the measurements that we require
selectedNames<-c(as.character(featuresNamesSubdata), "subject", "activity" )
Data<-subset(Data,select=selectedNames)

#3. Use descriptive activity names to name the activities in the data set
activityLabels <- read.table(file.path(path_rf, "activity_labels.txt"),header = FALSE)
Data$activity<-as.factor(Data$activity)
head(Data$activity,30)

#Appropriately labels the data set with descriptive variable names.
names(Data)<-gsub("^t", "time", names(Data))
names(Data)<-gsub("^f", "frequency", names(Data))
names(Data)<-gsub("Acc", "Accelerometer", names(Data))
names(Data)<-gsub("Gyro", "Gyroscope", names(Data))
names(Data)<-gsub("Mag", "Magnitude", names(Data))
names(Data)<-gsub("BodyBody", "Body", names(Data))

#Create an independent tidy data set with the average of each variable for each activity and each subject.

library(plyr);
Data2<-aggregate(. ~subject + activity, Data, mean)
Data2<-Data2[order(Data2$subject,Data2$activity),]
write.table(Data2, file = "tidydata.txt",row.name=FALSE)