# Code Book

## Description

This code book describes the variables, data, and transformations performed to clean the UCI HAR dataset.

## Variables

- `subject`: The ID of the subject
- `activity`: The type of activity performed
- `TimeBodyAccelerometerMeanX`, `TimeBodyAccelerometerMeanY`, `TimeBodyAccelerometerMeanZ`, etc.: 
  Mean and standard deviation measurements for each axis (X, Y, Z) and for each type of measurement (accelerometer, gyroscope, etc.)

## Transformations

1. Merged the training and test datasets to create one dataset.
2. Extracted measurements on the mean and standard deviation for each measurement.
3. Applied descriptive activity names to name the activities in the dataset.
4. Appropriately labeled the dataset with descriptive variable names.
5. Created a second, independent tidy dataset with the average of each variable for each activity and each subject.

