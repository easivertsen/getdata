CodeBook for dataset tidy.txt
=============================

Data source
-----------
This dataset is derived from the "Human Activity Recognition Using Smartphones Data Set" which was originally made avaiable here: http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

First two variables
-------------------
* subject : Integer variable denoting each of the 30 subjects
* activity_lables: Factor fariable with 6 levels describing the activity

Feature Selection 
-----------------
The README and features.txt files in the original dataset describes the feature selection for this dataset. There is the following description:

>The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and >tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they >were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to >remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals >(tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

>Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAcc>Jerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the >Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

>Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, >fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 

The assignment explicitly states "Extracts only the measurements on the mean and standard deviation for each measurement."
Thus only the variables with mean or standard deviation were extracted

In short, for this derived dataset, these signals were used to estimate variables of the feature vector for each pattern:  
'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* tBodyAcc-XYZ
* tGravityAcc-XYZ
* tBodyAccJerk-XYZ
* tBodyGyro-XYZ
* tBodyGyroJerk-XYZ
* tBodyAccMag
* tGravityAccMag
* tBodyAccJerkMag
* tBodyGyroMag
* tBodyGyroJerkMag
* fBodyAcc-XYZ
* fBodyAccJerk-XYZ
* fBodyGyro-XYZ
* fBodyAccMag
* fBodyAccJerkMag
* fBodyGyroMag
* fBodyGyroJerkMag

The set of variables that were estimated (and kept for this assignment) from these signals are: 

* mean(): Mean value
* std(): Standard deviation

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

* gravityMean
* tBodyAccMean
* tBodyAccJerkMean
* tBodyGyroMean
* tBodyGyroJerkMean

The other estimates have been removed from the original dataset

Note: features are normalized and bounded within [-1,1].

The resulting variable names are of the following form: tBodyAcc_mean_X, which means the mean value of tBodyAcc-XYZ.