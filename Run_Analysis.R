
##Load data cleaning packages

library(dplyr)
library(tidyr)
library(data.table)


## Read .txt files into environment from working directory

X_train <- read.table("./train/X_train.txt", header = F)
y_train <- read.table("./train/y_train.txt", header = F)
X_test <- read.table("./test/X_test.txt", header = F)
y_test <- read.table("./test/y_test.txt", header = F)
subject_test <- read.table("./test/subject_test.txt", header = F)
subject_train <- read.table("./train/subject_train.txt", header = F) 
act_labels <- read.table("activity_labels.txt", sep = " ")
features <- read.table("./features.txt", header = F)



## Initial modification on raw data:

# Add column names to features list and transpose using tidyr-spread to form features headings

names(features) <- c("col1","col2")    
features_headings <- spread(features, col1, col2)

# Add rownames column to activity data to be used for sorting

y_test$row_id = rownames(y_test)
y_train$row_id = rownames(y_train)

# Convert activity data to data.table to perform a quick merge

act_labels <- data.table(act_labels, key = 'V1')
test_act <- data.table(y_test, key = 'V1')
train_act <- data.table(y_train, key = 'V1')



## Formulate and clean test and traing data with the following steps:

#a. Merge descriptive activity names to name the activities in the data set (3)
#b. Bind subject data and activity data
#c. Allocate subject and activity variable names
#d. Appropriately label the data set with descriptive variable names
#e. Bind subject and activty data with measurement data 

# Test data:

#a.
test_act <- test_act[act_labels] %>% mutate(row_id = as.numeric(as.character((row_id)))) %>% arrange(row_id)
#b.
test_subj_act <- cbind(subject_test, test_act$V2)
#c.
names(test_subj_act)[1] <- "Subject"
names(test_subj_act)[2] <- "Activity"
#d.
test_features_headings <- as.vector(unlist(features_headings[1,]))
names(X_test) <- test_features_headings
#e.
test_subj_act_feat <- cbind(test_subj_act, X_test)

# Training data:

#a.
train_act  <- train_act[act_labels] %>% mutate(row_id = as.numeric(as.character((row_id)))) %>% arrange(row_id)
#b.
train_subj_act <- cbind(subject_train,train_act$V2)
#c.
names(train_subj_act)[1] <- "Subject"
names(train_subj_act)[2] <- "Activity"
#d.
train_features_headings <- as.vector(unlist(features_headings[1,]))
names(X_train) <- train_features_headings
#e.
train_subj_act_feat <- cbind(train_subj_act, X_train)



## Merge the training and the test sets to create one data set (1) 

features_final <- rbind(test_subj_act_feat, train_subj_act_feat)



## Extracts only the measurements on the mean and standard deviation for each measurement (2) 

df<- features_final[,1:2]

mean_sub <- grep("mean",test_features_headings, perl = T, value = T)
df1 <- features_final[,c(mean_sub)]

std_sub <- grep("std",test_features_headings, perl = T, value = T)
df2 <- features_final[,c(std_sub)]

features_mean_std <- cbind(df, df1, df2)



## From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject.

ave_by_subj_act <- features_mean_std %>% group_by(Subject, Activity) %>% summarise_each(funs(mean))


