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

The tidy data set contains 10299 observations with 81 variables divided in:

    an activity label (Activity): WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING
    an identifier of the subject who carried out the experiment (Subject): 1, 3, 5, 6, 7, 8, 11, 14, 15, 
      16, 17, 19, 21, 22, 23, 25, 26, 27, 28, 29, 30
    a 79-feature vector with time and frequency domain signal variables (numeric)

The following list contain the 17 signals to the names used as prefix for the variables names present in the data set.
".XYZ" denotes three variables, one for each axis (Name 	Time domain 	Frequency domain)

Body Acceleration 	
TimeDomain.BodyAcceleration.XYZ 	
FrequencyDomain.BodyAcceleration.XYZ
Gravity Acceleration 	
TimeDomain.GravityAcceleration.XYZ 	
Body Acceleration Jerk 	
TimeDomain.BodyAccelerationJerk.XYZ 	
FrequencyDomain.BodyAccelerationJerk.XYZ
Body Angular Speed 	
TimeDomain.BodyAngularSpeed.XYZ 	
FrequencyDomain.BodyAngularSpeed.XYZ
Body Angular Acceleration 	
TimeDomain.BodyAngularAcceleration.XYZ 	
Body Acceleration Magnitude 	
TimeDomain.BodyAccelerationMagnitude 	
FrequencyDomain.BodyAccelerationMagnitude
Gravity Acceleration Magnitude 	
TimeDomain.GravityAccelerationMagnitude 	
Body Acceleration Jerk Magnitude 	
TimeDomain.BodyAccelerationJerkMagnitude 	
FrequencyDomain.BodyAccelerationJerkMagnitude
Body Angular Speed Magnitude 	
TimeDomain.BodyAngularSpeedMagnitude 	
FrequencyDomain.BodyAngularSpeedMagnitude
Body Angular Acceleration Magnitude 	
TimeDomain.BodyAngularAccelerationMagnitude 	
FrequencyDomain.BodyAngularAccelerationMagnitude

