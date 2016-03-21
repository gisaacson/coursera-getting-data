# Code Book
The Codebook follows on from the [ReadMe](https://github.com/gisaacson/coursera-getting-data/blob/master/README.md) document, contained in this repo.
This document details the analysis variables - both in raw form and during processing, as well as the processing steps taken to clean the data.

*Note that the initial description of the raw variables has been adapted from the original students’ codebook* 

The features data, represented as X_train.txt and X_test.txt in their raw form, represent the measurements recorded from 30 subjects - each performing 6 activities.

The 561 columns are made up of the initial accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions. 

The acceleration signal from the smartphone accelerometer X axis is in standard gravity units ‘g’.

## After reading the txt. files into R, the following steps were taken in processing the data: 

*Significant newly-introduced variables are included in bold.*

*Note that the bracketed numbers (1-5) below denote the required objectives of the course project.*

* **features_headings** - Add column names to features list and transpose using tidyr-spread to form features headings
* Add rownames column to activity data to be used for sorting
* Convert activity data to data.table to perform a quick merge
* **test_subj_act_feat**  - Formulate and clean test and training data with the following steps:
  * a. Merge descriptive activity names to name the activities in the data set *(3)*
  * b. Bind subject data and activity data
  * c. Allocate subject and activity variable names
  * d. Appropriately label the data set with descriptive variable names
  * e. Bind subject and activity data with measurement data 
* **features_final**  - Merge the training and the test sets to create one data set *(1)* 
* **features_mean_std** -  Extracts only the measurements on the mean and standard deviation for each measurement *(2)* 
* **ave_by_subj_act** - From the data set in step 4, create a second, independent tidy data set with the average of each variable for each activity and each subject *(5)*
