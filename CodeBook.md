Description:

Information about the variables, data and transformations used in the course project for the Johns Hopkins Getting and Cleaning Data course.

Source Data
A full description of the data used in this project can be found at The UCI Machine Learning Repository


Data Set Information

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

Data Collection:

Raw data are obtained from UCI Machine Learning repository. In particular we used the Human Activity Recognition Using Smartphones Data Set [1], that was used by the original collectors to conduct experiments exploiting Support Vector Machine (SVM) [2].
Activity Recognition (AR) aims to recognize the actions and goals of one or more agents from a series of observations on the agents' actions and the environmental conditions [3]. The collectors used a sensor based approach employing smartphones as sensing tools. Smartphones are an effective solution for AR, because they come with embedded built-in sensors such as microphones, dual cameras, accelerometers, gyroscopes, etc.

The data set was built from experiments carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (walking, walking upstairs, walking downstairs, sitting, standing, laying) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, 3-axial linear acceleration and 3-axial angular velocity were captured at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually [4].
The obtained data set has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data.
Signals

The 3-axial time domain [5] signals from accelerometer and gyroscope were captured at a constant rate of 50 Hz [6]. Then they were filtered to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals using another filter. Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals [7]. Also the magnitude [8] of these three-dimensional signals were calculated using the Euclidean norm [9]. Finally a Fast Fourier Transform (FFT) [10] was applied to some of these time domain signals to obtain frequency domain [11] signals.
The signals were sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window at 50 Hz). From each window, a vector of features was obtained by calculating variables from the time and frequency domain.


The set of variables that were estimated from these signals are:

    mean(): Mean value
    std(): Standard deviation
    mad(): Median absolute deviation
    max(): Largest value in array
    min(): Smallest value in array
    sma(): Signal magnitude area
    energy(): Energy measure. Sum of the squares divided by the number of values.
    iqr(): Interquartile range
    entropy(): Signal entropy
    arCoeff(): Autoregression coefficients with Burg order equal to 4
    correlation(): Correlation coefficient between two signals
    maxInds(): Index of the frequency component with largest magnitude
    meanFreq(): Weighted average of the frequency components to obtain a mean frequency
    skewness(): Skewness of the frequency domain signal
    kurtosis(): Kurtosis of the frequency domain signal
    bandsEnergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
    angle(): Angle between some vectors.

Data transformation

The raw data sets are processed with run_analisys.R script to create a tidy data set.

Section 1. Merge the training and the test sets to create one data set.

a. The data in the following files are read into a data table.
    features.txt
    activity_labels.txt
    subject_train.txt
    x_train.txt
    y_train.txt
    subject_test.txt
    x_test.txt
    y_test.txt

b. Test and training data (X_train.txt, X_test.txt), subject ids (subject_train.txt, subject_test.txt) and activity ids 
(y_train.txt, y_test.txt) are merged to obtain a single data set. Variables are labelled with the names assigned by original collectors (features.txt). This is accomplished by doing rbind to create subject data, activity data & features Data and by giving proper column names. Again a cbind is used to combine the 3 files.


Section 2. Extracts only the measurements on the mean and standard deviation for each measurement.

a. Use grep to extract mean and standard deviation variables. Subset the data and exract only the measurements that we require.


Section3: Use descriptive activity names to name the activities in the data set

a. Use the labels in activity_labels.txt to create factors. 

Section4: Create an independent tidy data set with the average of each variable for each activity and each subject.


| Colmun |                         Variable                        |        source variable        |
| ------ | :------------------------------------------------------ | :---------------------------- |
|      1 | subjectid                                               | subject id from subjects file |
|      2 | activityname                                            | activity id from labels file  |
|      3 | timeBodyAccelerometer-mean()-X                          | tBodyAcc-mean()-X             |
|      4 | timeBodyAccelerometer-mean()-Y                          | tBodyAcc-mean()-Y             |
|      5 | timeBodyAccelerometer-mean()-Z                          | tBodyAcc-mean()-Z             |
|      6 | timeBodyAccelerometer-std()-X                           | tBodyAcc-std()-X              |
|      7 | timeBodyAccelerometer-std()-Y                           | tBodyAcc-std()-Y              |
|      8 | timeBodyAccelerometer-std()-Z                           | tBodyAcc-std()-Z              |
|      9 | timeGravityAccelerometer-mean()-X                       | tGravityAcc-mean()-X          |
|     10 | timeGravityAccelerometer-mean()-Y                       | tGravityAcc-mean()-Y          |
|     11 | timeGravityAccelerometer-mean()-Z                       | tGravityAcc-mean()-Z          |
|     12 | timeGravityAccelerometer-std()-X                        | tGravityAcc-std()-X           |
|     13 | timeGravityAccelerometer-std()-Y                        | tGravityAcc-std()-Y           |
|     14 | timeGravityAccelerometer-std()-Z                        | tGravityAcc-std()-Z           |
|     15 | timeBodyAccelerometerJerk-mean()-X                      | tBodyAccJerk-mean()-X         |
|     16 | timeBodyAccelerometerJerk-mean()-Y                      | tBodyAccJerk-mean()-Y         |
|     17 | timeBodyAccelerometerJerk-mean()-Z                      | tBodyAccJerk-mean()-Z         |
|     18 | timeBodyAccelerometerJerk-std()-X                       | tBodyAccJerk-std()-X          |
|     19 | timeBodyAccelerometerJerk-std()-Y                       | tBodyAccJerk-std()-Y          |
|     20 | timeBodyAccelerometerJerk-std()-Z                       | tBodyAccJerk-std()-Z          |
|     21 | timeBodyGyroscope-mean()-X                              | tBodyGyro-mean()-X            |
|     22 | timeBodyGyroscope-mean()-Y                              | tBodyGyro-mean()-Y            |
|     23 | timeBodyGyroscope-mean()-Z                              | tBodyGyro-mean()-Z            |
|     24 | timeBodyGyroscope-std()-X                               | tBodyGyro-std()-X             |
|     25 | timeBodyGyroscope-std()-Y                               | tBodyGyro-std()-Y             |
|     26 | timeBodyGyroscope-std()-Z                               | tBodyGyro-std()-Z             |
|     27 | timeBodyGyroscopeJerk-mean()-X                          | tBodyGyroJerk-mean()-X        |
|     28 | timeBodyGyroscopeJerk-mean()-Y                          | tBodyGyroJerk-mean()-Y        |
|     29 | timeBodyGyroscopeJerk-mean()-Z                          | tBodyGyroJerk-mean()-Z        |
|     30 | timeBodyGyroscopeJerk-std()-X                           | tBodyGyroJerk-std()-X         |
|     31 | timeBodyGyroscopeJerk-std()-Y                           | tBodyGyroJerk-std()-Y         |
|     32 | timeBodyGyroscopeJerk-std()-Z                           | tBodyGyroJerk-std()-Z         |
|     33 | timeBodyAccelerometerMagnitude-mean                     | tBodyAccMag-mean()            |
|     34 | timeBodyAccelerometerMagnitude-std()                    | tBodyAccMag-std()             |
|     35 | timeGravityAccelerometerMagnitude-mean()                | tGravityAccMag-mean()         |
|     36 | timeGravityAccelerometerMagnitude-std()                 | tGravityAccMag-std()          |
|     37 | timeBodyAccelerometerJerkMagnitude-mean                 | tBodyAccJerkMag-mean()        |
|     38 | timeBodyAccelerometerJerkMagnitude-std()                | tBodyAccJerkMag-std()         |
|     39 | timeBodyGyroscopeMagnitude-mean()                       | tBodyGyroMag-mean()           |
|     40 | timeBodyGyroscopeMagnitude-std()                        | tBodyGyroMag-std()            |
|     41 | timeBodyGyroscopeJerkMagnitude-mean()                   | tBodyGyroJerkMag-mean()       |
|     42 | timeBodyGyroscopeJerkMagnitude-std()                    | tBodyGyroJerkMag-std()        |
|     43 | frequencyBodyAccelerometer-mean()-X                     | fBodyAcc-mean()-X             |
|     44 | frequencyBodyAccelerometer-mean()-Y                     | fBodyAcc-mean()-Y             |
|     45 | frequencyBodyAccelerometer-mean()-Z                     | fBodyAcc-mean()-Z             |
|     46 | frequencyBodyAccelerometer-std()-X                      | fBodyAcc-std()-X              |
|     47 | frequencyBodyAccelerometer-std()-Y                      | fBodyAcc-std()-Y              |
|     48 | frequencyBodyAccelerometer-std()-Z                      | fBodyAcc-std()-Z              |
|     49 | frequencyBodyAccelerometerJerk-mean-X                   | fBodyAccJerk-mean()-X         |
|     50 | frequencyBodyAccelerometerJerk-mean-Y                   | fBodyAccJerk-mean()-Y         |
|     51 | frequencyBodyAccelerometerJerk-mean-Z                   | fBodyAccJerk-mean()-Z         |
|     52 | frequencyBodyAccelerometerJerk-std()-X                  | fBodyAccJerk-std()-X          |
|     53 | frequencyBodyAccelerometerJerk-std()-Y                  | fBodyAccJerk-std()-Y          |
|     54 | frequencyBodyAccelerometerJerk-std()-Z                  | fBodyAccJerk-std()-Z          |
|     55 | frequencyBodyGyroscopemean()-X                          | fBodyGyro-mean()-X            |
|     56 | frequencyBodyGyroscopemean()-Y                          | fBodyGyro-mean()-Y            |
|     57 | frequencyBodyGyroscopemean()-Z                          | fBodyGyro-mean()-Z            |
|     58 | frequencyBodyGyroscope-std()-X                          | fBodyGyro-std()-X             |
|     59 | frequencyBodyGyroscope-std()-Y                          | fBodyGyro-std()-Y             |
|     60 | frequencyBodyGyroscope-std()-Z                          | fBodyGyro-std()-Z             |
|     61 | frequencyBodyAccelerometerMagnitudeMean                 | fBodyAccMag-mean()            |
|     62 | frequencyBodyAccelerometerMagnitude-std()               | fBodyAccMag-std()             |
|     63 | frequencyBodyAccelerometerJerkMagnitude-mean()          | fBodyBodyAccJerkMag-mean()    |
|     64 | frequencyBodyAccelerometerJerkMagnitude-std()           | fBodyBodyAccJerkMag-std()     |
|     65 | frequencyBodyGyroscopeMagnitude-mean()                  | fBodyBodyGyroMag-mean()       |
|     66 | frequencyBodyGyroscopeMagnitude-std()                   | fBodyBodyGyroMag-std()        |
|     67 | frequencyBodyGyroscopeJerkMagnitude-mean()              | fBodyBodyGyroJerkMag-mean()   |
|     68 | frequencyBodyGyroscopeJerkMagnitude-std()               | fBodyBodyGyroJerkMag-std()    |

