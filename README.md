## Getting and Cleaning Data Course Project

### Project purpose
The purpose of this project is to demonstrate the ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis. 


### Data source

The data collected from the accelerometers from the Samsung Galaxy S smartphone. Human Activity Recognition database built from the recordings of 30 subjects performing activities of daily living (ADL) while carrying a waist-mounted smart phone with embedded inertial sensors.

[Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

### Files
- CodeBook.md: A code book that illustrates the variables, the data, and the process to tidy the data.

- run_analysis.R: The R script firt do some preparations to dowmload the data set and then tidy the data set up carefully following the instructions. To be detailed:
Step1: Merges the training and the test sets to create one data set.
Step2: Extracts only the measurements on the mean and standard deviation for each measurement.
Step3: Uses descriptive activity names to name the activities in the data set
Step4: Appropriately labels the data set with descriptive variable names.
Step5: From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.

- FinalResult.txt: This is the final data set which carefully following the instructions, and output as a .txt file.