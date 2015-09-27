================================================================
Human Activity Recognition Using Smartphones Dataset
Version 1.0
================================================================
Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
================================================================
Run Analysis of Wearables
================================================================
Margaret Erlandson
Getting and Cleaning Data, Coursera
================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For each record it is provided:
======================================

- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

The dataset includes the following files:
=========================================

- 'README.txt'

- 'README_run_analysis_wearables.txt': Updated for program run.

- 'features_info.txt': Shows information about the variables used on the feature vector.

- 'features.txt': List of all features.

- 'features_run_analysis_wearables.txt': List of features used in program run only.

- 'activity_labels.txt': Links the class labels with their activity name.

- 'train/X_train.txt': Training set.

- 'train/y_train.txt': Training labels.

- 'test/X_test.txt': Test set.

- 'test/y_test.txt': Test labels.

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30, with 70 % of the voluneteers in this group. 

- 'test/subject_test.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30, with 30 % of the voluneteers in this group. 

- 'run_analysis.R': executable R program that combines raw data from training and testing datasets and takes the average of mean and standard deviation for tGravityAccMag for each subject at each activity and outputs a summary text file.

- 'wearables_mean_std.txt': Output tidy file from program with average of mean and standard deviation for time Gravity Acceleration for each subject performing each activity.

[Other files of raw data were included in the original sets, but have been excluded in this program.]

Notes: 
======
- Features are normalized and bounded within [-1,1].
- Each feature vector is a row on the text file.

For more information about this dataset contact: activityrecognition@smartlab.ws

Program:
========

Zipped files were loaded and unpacked into six datasets in R: single set of 21 subjects for training, single set of 6 activities for training, 561 variables of training data, single set of 9 subjects for testing, single set of same 6 activities for testing, and 561 variables of testing data. 

Of the 561 variables mentioned in the features.txt file, two were selected to use for further analysis. Early time variables (1-200) were separated into X, Y, and Z components, not useful for this analysis. Frequency variables (266-554) were Fast Fourier Transformed (FFT) from the time domain, so they were not as useful in this setting. The angle variables (555-561) did not have what was needed. That left the "Mag" variables (201-265) as optimal for this program. There were several Body values, but only one set of Gravity, so that one (214 and 215 - mean and standard deviation for tGravityAccMag) was chosen for this program.

The 561-variable datasets were combined with the subject and activity datasets and then shortened to the two chosen variables. Column names were made more descriptive(Subject, Activity_Labels, tGravAccMag-mean, and tGravAccMag-std), and activity labels were included (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING). Training and testing datasets were then combined, sorted, and regrouped by subject and activity.

A summary was made of the average of the Gravity Acceleration Mag for mean and standard deviation (ave-tGravAccMag-mean and ave-tGravAccMag-std) for all the readings of each subject performing each activity. This table was output as a text file from the program.

License:
========
Use of this dataset in publications must be acknowledged by referencing the following publication [1] 

[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012

This dataset is distributed AS-IS and no responsibility implied or explicit can be addressed to the authors or their institutions for its use or misuse. Any commercial use is prohibited.

Jorge L. Reyes-Ortiz, Alessandro Ghio, Luca Oneto, Davide Anguita. November 2012.
