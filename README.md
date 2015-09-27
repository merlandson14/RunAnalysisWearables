# RunAnalysisWearables
Run_Analysis of Wearables Data for Getting and Cleaning Data class

This README is taken from the full README_run_analysis_wearables.txt, also included in the repo, which was first copied from the original dataset README. The modified parts relevant to this program are included below. See full document for all descriptions of training and testing of wearables.

Repo Files:
=========================================

- 'README_run_analysis_wearables.txt': Updated for program run.

- 'features_run_analysis_wearables.txt': List of features used in program run only.

- 'wearables_mean_std.txt': Output tidy file from program with average of mean and standard deviation for time Gravity Acceleration for each subject performing each activity.

[Other files of raw data were included in the original sets, but have been excluded for this program.]


Program:
========

Zipped files were loaded and unpacked into six datasets in R: single set of 21 subjects for training, single set of 6 activities for training, 561 variables of training data, single set of 9 subjects for testing, single set of same 6 activities for testing, and 561 variables of testing data. 

Of the 561 variables mentioned in the features.txt file, two were selected to use for further analysis. Early time variables (1-200) were separated into X, Y, and Z components, not useful for this analysis. Frequency variables (266-554) were Fast Fourier Transformed (FFT) from the time domain, so they were not as useful in this setting. The angle variables (555-561) did not have what was needed. That left the "Mag" variables (201-265) as optimal for this program. There were several Body values, but only one set of Gravity, so that one (214 and 215 - mean and standard deviation for tGravityAccMag) was chosen for this program.

The 561-variable datasets were combined with the subject and activity datasets and then shortened to the two chosen variables. Column names were made more descriptive(Subject, Activity_Labels, tGravAccMag-mean, and tGravAccMag-std), and activity labels were included (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, and LAYING). Training and testing datasets were then combined, sorted, and regrouped by subject and activity.

A summary was made of the average of the Gravity Acceleration Mag for mean and standard deviation (ave-tGravAccMag-mean and ave-tGravAccMag-std) for all the readings of each subject performing each activity. This table was output as a text file from the program.
