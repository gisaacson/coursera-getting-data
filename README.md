# Coursera-getting-data

## Assignment: Getting and Cleaning Data Course Project

The project task was to obtain data from the [UCL Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones), whereby experiments on 30 volunteers were carried out, whilst each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. The obtained dataset had been randomly partitioned into two sets, where 70% of the volunteers were selected for generating the training data and 30% the test data. 

The initial phase of the project was to download the raw data [zip file](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip). The data set folder could then be extracted and assigned as the working directory in R, before running the [Run_Analysis](https://github.com/gisaacson/coursera-getting-data/blob/master/Run_Analysis.R) code.

As part of the initial phase of the Run_Analysis script, the following raw data *txt.* files were imported from the working directory and its subfolders:

* **features.txt:** Names of the 561 features.
* **activity_labels.txt:** Names and IDs for each of the 6 activities.
* **X_train.txt:** 7352 observations of the 561 features
* **subject_train.txt:** A vector of 7352 integers, relating the subject of each of the training data volunteers to its respective measurements
* **y_train.txt:** A vector of 7352 integers relating the activity IDs of each of the training data volunteers to its respective measurements
* **X_test.txt:** 2947 observations of the 561 features
* **subject_test.txt:** A vector of 2947 integers, relating the subject of each of the test data volunteers to its respective measurements 
* **y_test.txt:** A vector of 2947 integers, relating the activity IDs of each of the test data volunteers to its respective measurements 

Refer to the [Code Book](https://github.com/gisaacson/coursera-getting-data/blob/master/CodeBook.md) for a detailed description of the input variables and their processing.


