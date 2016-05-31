## Codebook


The data has been collected through smartphones weared by 30 volunteers. 
They performed 6 different Activities: 
1 WALKING
2 WALKING_UPSTAIRS
3 WALKING_DOWNSTAIRS
4 SITTING
5 STANDING
6 LAYING

The available data has been devided into test and training data.

Complete information on be found in the `readme.txt` and `features_info.txt`available in UCI_HAR_data.zip.


#### The following files from UCI_HAR_data.zip have been used:

- X_train.txt: 
7352 observations of the 561 features for the training part
- subject_train.txt: 
Includes the IDs of the volunteer (subject) belonging to the observations in X_train.txt.
- y_train.txt: 
Includes the IDs of the activity belonging the observations in X_train.txt.

- X_test.txt: 
2947 observations of the 561 features for the test part
- subject_test.txt: 
Includes the IDs of the volunteer (subject) belonging to the observations in X_test.txt.
- y_test.txt: 
Includes the IDs of the activity belonging the observations in X_test.txt.

features.txt: Includes the Names of the 561 features.
activity_labels.txt: Includes Names and IDs for each of the 6 activities performed.

Note: The data from the included "Inertial Signals" folders have not been used in this analysis.



####Steps done:

#####A) Merging and giving descriptive variable names and activities

1. above files have been read into data frames.

2. columns for volunteer ids and activity ids have been added to both test and training feature observations.

3. training and test data frames have been merged together.

4. this results in a combined data frame merged_data with 10299 observations of 563 variables (features)

5. variable Names have been changed to Subjectid and Activity 

6. only variables have been extracted for std() and mean() including the Subjectid and Activity Variable. 
   This results in a dataframe with 68 variables.

7. Activities have been labeled with 

1 = WALKING
2 = WALKING_UPSTAIRS
3 = WALKING_DOWNSTAIRS
4 = SITTING
5 = STANDING
6 = LAYING

8. Variables names like 'tBodyAcc-mean()-X' have been changed to tBodyAccmeanX to make them R usable (no(), - etc

The values and Units are kept as provided in the original data.

##### B) New tidy data set is generated with the average of each variable for each activity and each subject.

Based on the 10299 observations of the 68 variables a new tidy data set is created.
Per Subjectid and Activity the column mean is calculated for each of the 66 features and stored.

Units have not been changed.

The resulting data set has 180 observations of 68 variables where 66 are the features.

- Subjectid: integer 1:30 for the volunteer identifier
- Activity: factor with levels WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

- tBodyAccmeanY to fBodyBodyGyroMagstd (66 features) are numbers giving the mean per Subjectid/Activity combination.
   For more details please refer to readme.txt and features_info.txt available in UCI_HAR_data.zip.





 
   
