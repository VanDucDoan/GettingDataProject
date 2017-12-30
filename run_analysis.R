# directory for reading the data files
trainingDataDir <- "./UCI\ HAR\ Dataset/train/"
testingDataDir <- "./UCI\ HAR\ Dataset/test/"
dataDir <- "./UCI\ HAR\ Dataset/"
trainingInertDataDir <- "./UCI\ HAR\ Dataset/train/Inertial\ Signals/"
testingInertDataDir <- "./UCI\ HAR\ Dataset/test/Inertial\ Signals/"

# read data files
# activity labels and features
act_labs <- read.csv(paste(dataDir, "activity_labels.txt", sep = ""), header = FALSE, sep = "")
fea_name <- read.csv(paste(dataDir, "features.txt", sep = ""), header = FALSE, sep = "") 

#################################### read training data ######################################
X_train <- read.csv(paste(trainingDataDir, "X_train.txt", sep = ""), header = FALSE, sep = "")
y_train <- read.csv(paste(trainingDataDir, "y_train.txt", sep = ""), header = FALSE, sep = "")

# subject
subj_train <- read.csv(paste(trainingDataDir, "subject_train.txt", sep = ""), header = FALSE, sep = "")

# other data
# body acceleration x, y, z
body_acc_x_train <- read.csv(paste(trainingInertDataDir, "body_acc_x_train.txt", sep = ""), header = FALSE, sep = "")
body_acc_y_train <- read.csv(paste(trainingInertDataDir, "body_acc_y_train.txt", sep = ""), header = FALSE, sep = "")
body_acc_z_train <- read.csv(paste(trainingInertDataDir, "body_acc_z_train.txt", sep = ""), header = FALSE, sep = "")

# body gyro x, y, z
body_gyro_x_train <- read.csv(paste(trainingInertDataDir, "body_gyro_x_train.txt", sep = ""), header = FALSE, sep = "")
body_gyro_y_train <- read.csv(paste(trainingInertDataDir, "body_gyro_y_train.txt", sep = ""), header = FALSE, sep = "")
body_gyro_z_train <- read.csv(paste(trainingInertDataDir, "body_gyro_z_train.txt", sep = ""), header = FALSE, sep = "")

# total acceleration x, y, z
total_acc_x_train <- read.csv(paste(trainingInertDataDir, "total_acc_x_train.txt", sep = ""), header = FALSE, sep = "")
total_acc_y_train <- read.csv(paste(trainingInertDataDir, "total_acc_y_train.txt", sep = ""), header = FALSE, sep = "")
total_acc_z_train <- read.csv(paste(trainingInertDataDir, "total_acc_z_train.txt", sep = ""), header = FALSE, sep = "")
#############################################################################################

#################################### read testing data ######################################
X_test <- read.csv(paste(testingDataDir, "X_test.txt", sep = ""), header = FALSE, sep = "")
y_test <- read.csv(paste(testingDataDir, "y_test.txt", sep = ""), header = FALSE, sep = "")

# subject
subj_test <- read.csv(paste(testingDataDir, "subject_test.txt", sep = ""), header = FALSE, sep = "")

# other data
# body acceleration x, y, z
body_acc_x_test <- read.csv(paste(testingInertDataDir, "body_acc_x_test.txt", sep = ""), header = FALSE, sep = "")
body_acc_y_test <- read.csv(paste(testingInertDataDir, "body_acc_y_test.txt", sep = ""), header = FALSE, sep = "")
body_acc_z_test <- read.csv(paste(testingInertDataDir, "body_acc_z_test.txt", sep = ""), header = FALSE, sep = "")

# body gyro x, y, z
body_gyro_x_test <- read.csv(paste(testingInertDataDir, "body_gyro_x_test.txt", sep = ""), header = FALSE, sep = "")
body_gyro_y_test <- read.csv(paste(testingInertDataDir, "body_gyro_y_test.txt", sep = ""), header = FALSE, sep = "")
body_gyro_z_test <- read.csv(paste(testingInertDataDir, "body_gyro_z_test.txt", sep = ""), header = FALSE, sep = "")

# total acceleration x, y, z
total_acc_x_test <- read.csv(paste(testingInertDataDir, "total_acc_x_test.txt", sep = ""), header = FALSE, sep = "")
total_acc_y_test <- read.csv(paste(testingInertDataDir, "total_acc_y_test.txt", sep = ""), header = FALSE, sep = "")
total_acc_z_test <- read.csv(paste(testingInertDataDir, "total_acc_z_test.txt", sep = ""), header = FALSE, sep = "")
############################################################################################

####################################################################
# (1) merges the training and test data sets to create one data set
####################################################################
Xy_train <- cbind(X_train, c(subj_train, y_train))
Xy_test <- cbind(X_test, c(subj_test, y_test))
Xy_dataset <- rbind(Xy_train, Xy_test)
####################################################################

####################################################################
# (2) (3) (4) names columns for the data set
# and extracts only the measurements on the mean and standard deviation 
# for each measurement
####################################################################
# names for data set 
colnames(Xy_dataset) <-  c(as.character.factor(fea_name[, 2]), "subject", "activity")

# transform the column data in 'subject' and 'activity' to factor
Xy_dataset[, c("subject")] <- factor(Xy_dataset[, c("subject")])
Xy_dataset[, c("activity")] <- factor(Xy_dataset[, c("activity")])

# extracts the measurements on the mean and deviation
mean_std_data <- Xy_dataset[, grepl("mean", tolower(colnames(Xy_dataset))) | 
                                grepl("std", tolower(colnames(Xy_dataset))) == TRUE]
####################################################################

####################################################################
# (5) creates a second, independent tidy data set with the average of 
# each variable for each activity and each subject.
####################################################################
avg_group_data$byActivity <- sapply(split(subset(Xy_dataset, select = -c(subject, activity)), 
                                          Xy_dataset[, "activity"]), colMeans)
avg_group_data$bySubject <- sapply(split(subset(Xy_dataset, select = -c(subject, activity)), 
                                          Xy_dataset[, "subject"]), colMeans)
####################################################################
