
# Step 1 downloading, reading the data and merging training and test data into one data frame

# checking whether directory exists otherwise create the directory
if (!file.exists("Data")) { dir.create("Data")}

# checking whether the file has already been downloaded 
# otherwise download the same

if (!file.exists("data/UCI HAR Dataset")) {
  fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
  zfile <- "./data/UCI_HAR_data.zip"
  
  message("***** downloading file, this can take up to a few minutes *****")
  download.file(fileURL, destfile=zfile, method="curl")
  unzip(zfile, exdir="./data")}

# reading data
message("***** Reading the data now - this can also take a few minutes *****")

train_x <- read.table("./Data/UCI HAR Dataset/train/X_train.txt")
train_y <- read.table("./Data/UCI HAR Dataset/train/y_train.txt")
train_subject <- read.table("./Data/UCI HAR Dataset/train/subject_train.txt")
test_x <- read.table("./Data/UCI HAR Dataset/test/X_test.txt")
test_y <- read.table("./Data/UCI HAR Dataset/test/y_test.txt")
test_subject <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")

# column labels for the features
f <- read.table("./Data/UCI HAR Dataset/features.txt")

# changing columns names to the single sets
names(test_subject) <- "Subjectid"
names(train_subject) <- "Subjectid"

names(test_y) <- "Activity"
names(train_y) <- "Activity"

names(test_x) <- f$V2
names(train_x) <- f$V2

# merging the test and train data 
# cbind for train and test data to have volunteers, activities and data
train <- cbind(train_subject, train_y, train_x)
test <- cbind(test_subject, test_y, test_x)

# rbind both to have one full data set
merged_data <- rbind(train, test)




# 2. extracting only mean and std columns names with mean(), std(), 66 columns

mean_std_col <- grepl("mean\\(\\)", names(merged_data)) |   grepl("std\\(\\)", names(merged_data))

# add Subjectid and Activity column to have it included
mean_std_col[1:2] <- TRUE

# create dataframe with only mean and std columns + subjectid and activity
merged_data <- merged_data[, mean_std_col]




# 3. Give descritptive activity names for the numbers 1-6 in this order
merged_data$Activity <- factor(merged_data$Activity, 
labels=c( "WALKING", "WALKING_UPSTAIRS", "WALKING_DOWNSTAIRS", "SITTING", "STANDING", "LAYING"))




# 4. Appropriately labels the data set with descriptive variable names 
# remove () and - from the variable name 
names(merged_data)<-gsub("\\()", "" , names(merged_data))
names(merged_data)<-gsub("\\-", "" , names(merged_data))

message("***** The merged data set is called merged_data *****")




# 5. create tidy data set with average of each variable for each activity and each subject.

# load plyr package 
library(plyr)

# column 1 and 2 are the subject id and activity we need to group on
tidy_data <-ddply(merged_data,.(Subjectid, Activity), function(y) colMeans(y[,3:68]))

# saving tidy set to disc in file tidy_data.csv
write.csv(tidy_data, "./Data/tidy_data.csv", row.names=FALSE)

message("***** The tidy dataset is called tidy_data and is now saved in ./Data/tidy_data.csv on your PC *****") 
message("***** The tidy data set has 180 observations for 68 variables *****")
