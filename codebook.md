# Getting and Cleaning Data Project

The code book illustrates the variables, the data, and the process to tidy the data, as well as the corresponding information. The roughly steps are clarified in the README.md.

## 1. Introductions for appearred datasets
The data set is downloaded and unzipped as UCI HAR Dataset.
- activities: corresponding to the initial file, activity_labels.txt
- features: corresponding to the initial file, features.txt
- test: including all the information in the test file. (X_test for X_test.txt, Y_test for y_test.txt, Subject_test for subject.txt)
- train: including all the information in the train file. (X_train for X_train.txt, Y_train for y_train.txt, Subject_train for subject.train)
- fulldata: corresbonding to the merged data set following the step 1, the dataset merging the train and test data sets.
- Q2: the resulted data set after step 2.
- Q3: the resulted data set after step 3.
- Q4: the resulted data set after step 4.
- Q5: the resulted data set after step 5, and output as the 'FinalResult.txt'.

## 2. Introduction for the Key point code
- Step 1: Use the function cbind(), rbind() to merge the train and test data set.
- Step 2: Library the package dplyr and then use the function select() to get the correct columns.
- Step 3: Use the function factor() to name the columns with the descriptive names.(Transformation between labels and levels.)
- Step 4: Use the function names() and gsub() to replace some abbreviations into descriptive names, including t... to Time..., f... to Frequency..., ...mean() to Mean, ...std() to STD.
- Step 5: Library the package dplyr and then use the function group_by() and summarise all() to get the average of each variable for each activity and each subject. And then save the results into a new data set and use the function write.table() to output the data set as "FinalResult.txt".