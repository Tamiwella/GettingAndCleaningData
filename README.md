# GettingAndCleaningData
README: 

The UCI HAR Dataset contained two sets of data. The first taken from test data and the second from training data. Each set contained a set of Inertial signals that were excluded from the final dataset, Final, as they are irrelevant to the final data outcomes. Their inclusion would only serve to skew the required data. Besides, these files, each set contained the following: 

Test data: 

X_Test data was measurements without variable names. 
Y_Test was activity labels. 
subject_test was subject labels. 
Features contained the names of the variables

Train data: 

X_Train was measurements without variables.
Y_Train was activity labels. 
subject_train was subject labels. 
Features contained the names of the variables. 

All data sets were imported in R. With as many rows of data as there were subject labels and activity labels, a new dataset was built with the first columns populated by the Test file Y_Test and subject_test. This set is called Testset. 

A new data frame was populated with the data points from the X_Test set. Names for the variables were extracted from the Features file, coerced into a vector and set as the names for the dataset called Xandnames. 
 
Duplicate columns were removed from Xandnames and the mean and std columns were filtered out. Because of the columns with the measurement meanFreq an additional filter had to be constructed to create a pool of column names that did not contain the term ‘meanFreq’. 
 
The two datasets, Testset and Xandnames were bound together to create the final dataset called TestCombo to be used once the training set had been constructed and filtered accordingly. 

The training data was then imported and sorted in the same manner: Y_Train and subject_train populated a new data frame TrainSet to provide the activity and subject information. Xandnames2 was created to contain the variable names and the X_train set. Xandnames2 was filtered to only include the columns that reflected means and stds - then the two sets were fused to create TrainCombo.

The first two column names in TrainCombo were changed to match those in TestCombo and the two datasets were r-bound to create the FinalSet.

In FinalSet variable names were updated and activity names were updated to be more accessible. 

FinalSet was aggregated to reflect the mean of each data point by subject and activity in the set Final. Final contains 180 observations of 64 variables. 

Column names were updated to be more in line with conventional naming standards and the final set was complete. 

For more information on how the data was collected see the original data’s README file and for more information on the variables involved see Features_info.  
