# Preparation

## step 1: Download the data set
#download.file(fileurl,destfile="/Users/jiayiniu/Coursera/gas.xlsx",method="curl")
if(!file.exists("./Coursera")) dir.create("./Coursera")
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile="/Users/jiayiniu/Coursera/project4.zip", method="curl")

## step 2: Unzip the data set
listZip <- unzip("/Users/jiayiniu/Coursera/project4.zip", exdir = "./Coursera")

## step 3: Import the data set 
features <- read.table("/Users/jiayiniu/Coursera/Coursera/UCI HAR Dataset/features.txt", col.names = c("num","features"))
activities <- read.table("/Users/jiayiniu/Coursera/Coursera/UCI HAR Dataset/activity_labels.txt", col.names = c("label", "activity"))
X_train <- read.table("/Users/jiayiniu/Coursera/Coursera/UCI HAR Dataset/train/X_train.txt",col.names=features$features)
Y_train <- read.table("/Users/jiayiniu/Coursera/Coursera/UCI HAR Dataset/train/y_train.txt",col.names = "label")
Subject_train<- read.table("/Users/jiayiniu/Coursera/Coursera/UCI HAR Dataset/train/subject_train.txt",col.names = "subject")
X_test <- read.table("/Users/jiayiniu/Coursera/Coursera/UCI HAR Dataset/test/X_test.txt",col.names=features$features)
Y_test <- read.table("/Users/jiayiniu/Coursera/Coursera/UCI HAR Dataset/test/y_test.txt",col.names = "label")
Subject_test <- read.table("/Users/jiayiniu/Coursera/Coursera/UCI HAR Dataset/test/subject_test.txt",col.names = "subject")


# Q1. Merge the training and the test sets to create one data set.

## Merge the Train data set
train <- cbind(Subject_train,Y_train,X_train)
## Merge the Test data set
test <- cbind(Subject_test,Y_test,X_test)
## Mering the train and test sets
fulldata <- rbind(train,test)

# Q2. Extracts only the measurements on the mean and standard deviation for each measurement. 

library(dplyr)
## Extract the mean and sd for each measurement
Q2<-fulldata %>%
  select(subject,label,contains("mean"), contains("std"))

# Q3. Uses descriptive activity names to name the activities in the data set.

Q3<-Q2
#Q3$label <- activities[Q2$label, 2]
Q3$label <- factor(Q3$label, levels = activities[,1], labels = activities[,2])

# Q4. Appropriately labels the data set with descriptive variable names. 

Q4<-Q3

## Replace some abbreviations into descriptive names
names(Q4)[2]<-"activity"
names(Q4)<-gsub("^t", "Time", names(Q4))
names(Q4)<-gsub("^f","Frequency", names(Q4))
names(Q4)<-gsub("-mean()", "Mean", names(Q4))
names(Q4)<-gsub("-std()", "STD", names(Q4))
names(Q4)<-gsub("-freq()", "Frequency", names(Q4), ignore.case = TRUE)

# Q5. From the data set in step 4, creates a second, independent tidy data set 
# with the average of each variable for each activity and each subject.

Q5 <- Q4%>%
  group_by(subject, activity) %>%
  summarise_all(funs(mean))

## Output the final results
write.table(Q5, "FinalResult.txt", row.name=FALSE)

