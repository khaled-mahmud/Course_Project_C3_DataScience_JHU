# Getting and Cleaning Data Project John Hopkins University Coursera
# Author: Md Khaled Mahmud Arif

# Project Requirements:
# - 1. Merging the training and the test sets to create one data set.
# - 2. Extracting only the measurements on the mean and standard deviation for each measurement.
# - 3. Using descriptive activity names to name the activities in the data set
# - 4. Appropriately labeling the data set with descriptive variable names.
# - 5. From the data set in step 4, creating a second, independent tidy data set with the average of each variable for each activity and each subject.



# Loading required packages
# install.packages("dplyr")
library(dplyr)



# Pre-processing Step

# Downloading and unzipping the dataset
if(!file.exists("./data")){dir.create("./data")}
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(fileUrl, destfile = "./data/dataFile.zip") # For windows operating system method="curl" has been eliminated
unzip("./data/dataFile.zip", exdir = "./data")

# Loading activity-labels and feautures
activities <- read.table("./data/UCI HAR Dataset/activity_labels.txt", col.names=c("Id", "Activity_Labels"))
features <- read.table("./data/UCI HAR Dataset/features.txt", col.names=c("Id", "Feature_Names"))

# Loading training dataset
X_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
names(X_train) <- features$Feature_Names
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt", col.names=c("Activity"))
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt", col.names=c("Subject"))

# Loading test dataset
X_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
names(X_test) <- features$Feature_Names
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt", col.names=c("Activity"))
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt", col.names=c("Subject"))



# Requirement 1: Merging the training and the test sets to create one data set.
train <- cbind(subject_train, y_train, X_train) # merging training dataset
test <- cbind(subject_test, y_test, X_test) # merging test dataset
merged <- rbind(train, test)

# Requirement 2: Extracting only the measurements on the mean and standard deviation for each measurement.
clean_data <- merged %>% select(Subject, Activity, contains("mean()"), contains("std()"))

# Requirement 3: Using descriptive activity names to name the activities in the data set
clean_data$Activity <- activities[clean_data$Activity, 2]

# Requirement 4: Appropriately labels the data set with descriptive variable names.
names(clean_data) <- gsub("^t", "Time", names(clean_data))
names(clean_data) <- gsub("mean\\(\\)", "Mean", names(clean_data))
names(clean_data) <- gsub("std\\(\\)", "STD", names(clean_data))
names(clean_data) <- gsub("Acc", "Accelerometer", names(clean_data))
names(clean_data) <- gsub("^f", "Frequency", names(clean_data))
names(clean_data) <- gsub("Gyro", "Gyroscope", names(clean_data))
names(clean_data) <- gsub("Mag", "Magnitude", names(clean_data))
names(clean_data) <- gsub("BodyBody", "Body", names(clean_data))

# Requirement 5. From the data set in step 4, creating a second, independent tidy data set with the average of each variable for each activity and each subject.
tidy_data <- clean_data %>% group_by(Subject, Activity) %>% summarise_all(list(mean))
if(!file.exists("./output")){dir.create("./output")}
write.table(tidy_data, file="output/tidy_data.txt", row.names = FALSE)
