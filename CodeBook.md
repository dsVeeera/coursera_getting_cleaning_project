About source data

As course data for work was used Human Activity Recognition Using Wearable Computing Data Set. A full description is available at the site where the data was obtained: 

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

Here are the data for the project: 

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

About R script

File with R code "run_analysis.R" perform 13 Main steps with 4 Chapter steps in between:

Merging the training and the test sets to create one data set.

#1. Install Plyr package and call library

#2. Download dataset

#3. Unzip Dataset
# I. Merging the training and the test sets to create one data set

#4. Reading trainings tables

#5. Reading testing tables

#6. Reading feature vector

#7. Reading activity labels

#8. Assigning column names

#9. Merging all datasets to one as per Requirement

# II. Extracting only the measurements on the mean and standard deviation for each measurement

#10. Reading column names from previous the above step

#11 Create vector for defining ID, mean and standard deviation

#12 Making nessesary subset from mergeTrainTest

# III. Using descriptive activity names to name the activities in the data set

# IV. Creating a second, independent tidy data set with the average of each variable for each activity and each subject

#13 Making second data set

#14 Writing second data set in txt file called TidySet.txt

About variables:

`x_train`, `y_train`, `x_test`, `y_test`, `subject_train` and `subject_test` contain the data from the downloaded files.
`x_data`, `y_data` and `subject_data` merge the previous datasets to further analysis.
features contains the correct names for the `x_data` dataset, which are applied to the column names stored in.
`activityWithLabel` reads all the activity Labels data and was used in future analysis.
`mergeTrainTest` contains data with both test and train.
`setMeanAndStd` has all the mean and Standard Deviation measurement.
`secondDataSet` is created from activitylabels, meand&std measurements.
