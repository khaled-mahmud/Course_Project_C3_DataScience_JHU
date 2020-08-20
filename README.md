# Course Project: Getting and Cleaning Data
_Author: Khaled Mahmud_ <br/>
_This is a course project for [Getting and Cleaning Data](https://class.coursera.org/getdata-007)_

## Description
On high level, the purpose of this project is to demonstrate the ability to collect and work with raw data and generate a clean dataset. 
It has the instructions on how to run analysis on Human Activity recognition dataset.
The goal is to prepare tidy data that can be used for later analysis.
In more details, the following tasks are implemented in this project:
* Sourcing data.
* Performing data manipulation.
* Generating tidy dataset for later data analysis.

There is a [CodeBook.md](https://github.com/khaled-mahmud/Course_Project_C3_DataScience_JHU/CodeBook.md) file - a code book in the root directory that describes the variables, the data, and any transformations that was performed to clean up the data

## Data Details
The datasets describes Human Activity Recognition Using Smartphones. Specifically these datas are accelerometer and gyroscope readings from Samsung Galaxy S smartphone
* Detail data description is available at the web site 
[UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).
* Dataset can be downloaded from here [Download Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip).

## Project Setup
* Get the project from the repository url: [https://github.com/khaled-mahmud/Course_Project_C3_DataScience_JHU]()
* In __R Studio__ set the working directory:

        setwd("<DIRECTORY PATH>")
* Install __dplyr__ package, if not installed:

        install.packages("dplyr")
* __Source__ the `run_analysis.R` script: 

        source("run_analysis.R")
* `run_analysis.R` performs the data pre-processing and analysis followed by the "Data Analysis" steps described below.

## Data Analysis
`run_analysis.R` performs the following operations:
* Download and read the dataset. (_Pre-processing Step_)
* Merges the training and the test sets to create one data set. (_Requirement 1_)
* Extracts only the measurements on the mean and standard deviation for each measurement. (_Requirement 2_)
* Uses descriptive activity names to name the activities in the data set. (_Requirement 3_)
* Appropriately labels the data set with descriptive variable names. (_Requirement 4_)
* From the data set creates a second, independent tidy data set with the average of each variable for each activity and each subject. (_Requirement 5_)
* A `tidy_data.txt` file (_corresponding to a `180x68` data frame_) is created in __output__ directory after going through all the sequence of steps described above.