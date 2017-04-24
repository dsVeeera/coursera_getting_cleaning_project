#1. Install Plyr package and call library
library(plyr)

#2. Download dataset
fileUrl <-
  "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./project_data.zip")

#3. Unzip Dataset
unzip(zipfile = "./project_data.zip")


# I. Merging the training and the test sets to create one data set:

#4. Reading trainings tables:
x_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <-
  read.table("./UCI HAR Dataset/train/subject_train.txt")

#5. Reading testing tables:
x_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <-
  read.table("./UCI HAR Dataset/test/subject_test.txt")

#6. Reading feature vector:
features <- read.table('./UCI HAR Dataset/features.txt')

#7. Reading activity labels:
activityWithLabels = read.table('./UCI HAR Dataset/activity_labels.txt')

#8. Assigning column names:
colnames(x_train) <- features[, 2]
colnames(y_train) <- "activityId"
colnames(subject_train) <- "subjectId"

colnames(x_test) <- features[, 2]
colnames(y_test) <- "activityId"
colnames(subject_test) <- "subjectId"

colnames(activityWithLabels) <- c('activityId', 'activityType')

#9. Merging all datasets to one as per Requirement:
merge_train <- cbind(y_train, subject_train, x_train)
merge_test <- cbind(y_test, subject_test, x_test)
mergeTrainTest <- rbind(merge_train, merge_test)

# II. Extracting only the measurements on the mean and standard deviation for each measurement

#10. Reading column names from previous the above step:
colNames <- colnames(mergeTrainTest)

#11 Create vector for defining ID, mean and standard deviation:
mean_and_std <- (
  grepl("activityId" , colNames) |
    grepl("subjectId" , colNames) |
    grepl("mean.." , colNames) |
    grepl("std.." , colNames)
)

#12 Making nessesary subset from mergeTrainTest:
setMeanAndStd <- mergeTrainTest[, mean_and_std == TRUE]

# III. Using descriptive activity names to name the activities in the data set:

setWithActivityNames <- merge(setMeanAndStd,
                              activityWithLabels,
                              by = 'activityId',
                              all.x = TRUE)

# IV. Creating a second, independent tidy data set with the average of each variable for each activity and each subject:

#13 Making second data set
secondDataSet <-
  aggregate(. ~ subjectId + activityId, setWithActivityNames, mean)
secondDataSet <-
  secondDataSet[order(secondDataSet$subjectId, secondDataSet$activityId), ]

#14 Writing second data set in txt file
write.table(secondDataSet, "TidySet.txt", row.name = FALSE)
