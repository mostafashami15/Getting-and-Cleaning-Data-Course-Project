# Install and load necessary packages
if (!require("dplyr")) {
        install.packages("dplyr")
}
if (!require("data.table")) {
        install.packages("data.table")
}

library(dplyr)
library(data.table)

# Download and unzip the dataset
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(url, destfile = "dataset.zip")
unzip("dataset.zip")

# Read data into R
features <- read.table("UCI HAR Dataset/features.txt", col.names = c("n", "functions"))
activities <- read.table("UCI HAR Dataset/activity_labels.txt", col.names = c("code", "activity"))
subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt", col.names = "subject")
x_test <- read.table("UCI HAR Dataset/test/X_test.txt", col.names = features$functions)
y_test <- read.table("UCI HAR Dataset/test/y_test.txt", col.names = "code")
subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt", col.names = "subject")
x_train <- read.table("UCI HAR Dataset/train/X_train.txt", col.names = features$functions)
y_train <- read.table("UCI HAR Dataset/train/y_train.txt", col.names = "code")

# Merge data
X <- rbind(x_train, x_test)
Y <- rbind(y_train, y_test)
Subject <- rbind(subject_train, subject_test)
Merged_Data <- cbind(Subject, Y, X)

# Extract mean and standard deviation
TidyData <- Merged_Data %>% select(subject, code, contains("mean"), contains("std"))

# Use descriptive activity names
TidyData$code <- activities[TidyData$code, 2]

# Label data with descriptive variable names
names(TidyData)[2] = "activity"
names(TidyData) <- gsub("Acc", "Accelerometer", names(TidyData))
names(TidyData) <- gsub("Gyro", "Gyroscope", names(TidyData))
names(TidyData) <- gsub("BodyBody", "Body", names(TidyData))
names(TidyData) <- gsub("Mag", "Magnitude", names(TidyData))
names(TidyData) <- gsub("^t", "Time", names(TidyData))
names(TidyData) <- gsub("^f", "Frequency", names(TidyData))
names(TidyData) <- gsub("tBody", "TimeBody", names(TidyData))
names(TidyData) <- gsub("-mean()", "Mean", names(TidyData), ignore.case = TRUE)
names(TidyData) <- gsub("-std()", "STD", names(TidyData), ignore.case = TRUE)
names(TidyData) <- gsub("-freq()", "Frequency", names(TidyData), ignore.case = TRUE)
names(TidyData) <- gsub("angle", "Angle", names(TidyData))
names(TidyData) <- gsub("gravity", "Gravity", names(TidyData))

# Create a tidy dataset
FinalData <- TidyData %>%
        group_by(subject, activity) %>%
        summarise_all(list(mean))
write.table(FinalData, "FinalData.txt", row.name = FALSE)

# Print completion message
print("Tidy dataset created and saved as 'FinalData.txt'.")
