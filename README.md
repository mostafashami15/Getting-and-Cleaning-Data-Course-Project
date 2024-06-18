# Getting and Cleaning Data Course Project

## Overview

This project demonstrates the ability to collect, work with, and clean a dataset. The goal is to prepare tidy data that can be used for later analysis.

## Files

- `run_analysis.R`: The script that performs the analysis and creates a tidy dataset.
- `CodeBook.md`: A code book that describes the variables, data, and transformations performed.
- `FinalData.txt`: The output tidy dataset with the average of each variable for each activity and each subject.

## Instructions

1. Place the `run_analysis.R` script in your R working directory.
2. Run the script using `source("run_analysis.R")`.
3. The script will download the dataset, perform the necessary transformations, and save the tidy dataset as `FinalData.txt`.

## Steps Performed by the Script

1. Download and unzip the dataset.
2. Read the data into R.
3. Merge the training and test datasets to create one dataset.
4. Extract only the measurements on the mean and standard deviation.
5. Use descriptive activity names to name the activities in the dataset.
6. Appropriately label the dataset with descriptive variable names.
7. Create a second, independent tidy dataset with the average of each variable for each activity and each subject.
