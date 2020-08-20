# Code Book
_Author: Khaled Mahmud_

## Description
This code book describes the data to indicate all the variables calculated and other relevant information to clean up the datasets.

## Data Source
* Original data description can be found here [UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)
* Dataset can be found here [Download Dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Dataset Details

(*adapted from the `README.txt` file in the Dataset package*)

### Human Activity Recognition Using Smartphones Dataset

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. 
Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) 
wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 
we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz.

The experiments have been video-recorded to label the data manually. 

The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for 
generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled 
in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, 
which has gravitational and body motion components, was separated using a 
[Butterworth low-pass filter](http://en.wikipedia.org/wiki/Butterworth_filter) into 
body acceleration and gravity. 
The gravitational force is assumed to have only low frequency components, 
therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained 
by calculating variables from the time and frequency domain. 

### Attribute Description
For each record in the dataset it is provided: 
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration. 
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

### The Data Package
The dataset includes the following files:
- `README.txt`
- `features_info.txt`: Shows information about the variables used on the feature vector.
- `features.txt`: List of all features.
- `activity_labels.txt`: Links the class labels with their activity name.
- `train/X_train.txt`: Training set.
- `train/y_train.txt`: Training labels.
- `test/X_test.txt`: Test set.
- `test/y_test.txt`: Test labels.

In particular, files contained in the `train` and in the `test` (sub)folders contains data that have been made available for 
training and testing respectively. However, since their description is the same, only training data will be described in the 
following:

- `train/subject_train.txt`: Each row refers to one (out of thirty) subject who performed the activity for each window sample. 
                             Therefore, values range from 1 to 30.      

- `train/Inertial Signals/total_acc_x_train.txt`: The acceleration signal from the smartphone accelerometer X axis in standard 
                                                    gravity units 'g'. Each row shows a `128` element vector. 
                                                    The same description applies for the `total_acc_x_train.txt` and for the
                                                    `total_acc_z_train.txt` files for the Y and Z axis.

- `train/Inertial Signals/body_acc_x_train.txt`: The body acceleration signal obtained by subtracting the gravity from the total acceleration.

- `train/Inertial Signals/body_gyro_x_train.txt`: The angular velocity vector measured by the gyroscope for each window sample. 
                                                  These values are expressed in `radians-per-second`. 

## Data Manipulation
The `run_analysis.R` script performs the data pre-processing and analysis by the following steps as described in the course project’s definition.

### 1. Download Dataset
* Dataset downloaded and extracted under the "data" subdirectory called "UCI HAR Dataset"

### 2. Loading Data
* `features` <- `features.txt` : `561 x 2` data frame <br/>
The features selected for this datasets come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. <br/>
* `activities` <- `activity_labels.txt` : `6 x 2` data frame <br/>
List of activities performed when the corresponding measurements were taken and its labels <br/>
* `X_train` <- `train/X_train.txt` : `7352 x 561` data frame <br/>
contains recorded features train data <br/>
* `y_train` <- `train/y_train.txt` : `7352 x 1` data frame <br/>
contains train data of activities labels <br/>
* `subject_train` <- `train/subject_train.txt` : `7352 x 1` data frame <br/>
contains train data of 21/30 volunteer subjects being observed <br/>
* `X_test` <- `test/X_test.txt` : `2947 x 561` data frame <br/>
contains recorded features test data <br/>
* `y_test` <- `test/y_test.txt` : `2947 x 1` data frame<br/>
contains test data of activities labels <br/>
* `subject_test` <- `test/subject_test.txt` : `2947 x 1` data frame <br/>
contains test data of 9/30 volunteer test subjects being observed <br/>

### 3. Merging Data
* `train` <- (`7352 x 563`) data frame is created by merging `subject_train`, `y_train` and `X_train` using __cbind()__ function <br/>
* `test` <- (`2947 x 563`) data frame is created by merging `subject_test`, `y_test` and `X_test` using __cbind()__ function <br/>
* `merged` <- (`10299 x 563`) data frame is created by merging `train` and `test` using __rbind()__ function <br/>

### 4. Extracts Measurements on the Mean and Standard deviation
* `clean_data` <- (`10299 x 68`) data frame is created by subsetting `merged`, selecting columns: `Subject`, `Activity` and the measurements on the `mean` and _standard deviation_ `(std)` for each measurement.

### 5. Replacing Activity Variable on Dataset with Descriptive Name
* Replacing `Activity` variable of `clean_data` with corresponding activity from `activities` data frame namely:
    * WALKING
    * WALKING_UPSTAIRS
    * WALKING_DOWNSTAIRS
    * SITTING
    * STANDING
    * LAYING

### 6. Appropriately labels the Dataset with Descriptive Variable Names
* All the column's name starts with `t` replaced by `Time`
* All `mean()` in column's name replaced by `Mean`
* All `std()` in column's name replaced by `STD`
* All `Acc` in column's name replaced by `Accelerometer`
* All the column's name starts with `f` replaced by `Frequency`
* All `Gyro` in column's name replaced by `Gyroscope`
* All `Mag` in column's name replaced by `Magnitude`
* All `BodyBody` in column's name replaced by `Body`

### Creating Tidy Dataset
* `tidy_data` <- (`180 x 68`) data frame is created by sumarizing `clean_data` taking the means of each variable for each activity and each subject, after groupped by subject and activity , resulting from `30` __subjects__ and `6` __activities__.
* Export `tidy_data` into `tidy_data.txt` file.

## See the [README.md](https://github.com/khaled-mahmud/Course_Project_C3_DataScience_JHU/README.md) for implementation details.
