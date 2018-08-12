Codebook: 

After filtering out all variables that are calculated on a mean or STD (64 variables in total), all of the values have been calculated on the 
mean and STD on three different axes, XYZ. 

Each data point name has been updated to be in line with the principles of data naming standards. These names now all appear lower case without any white space, dots, or underscores. 

The data points are taken for each pattern with an axis denominator at the end - X,Y or Z. The data points also state whether the data point was derived from a mean or std between the name and the axis. 

BodyAcc
GravityAcc
BodyAccJerk
BodyGyro
BodyGyroJerk
BodyAccMag
GravityAccMag
BodyAccJerkMag
BodyGyroMag
BodyGyroJerkMag

If the data point is prefaced with ‘f’ then the data point indicates frequency of occurrence. For example, here is a complete data point name: 

fbodygyromeanz - This data point will show the mean of all the collected means for the frequency of the gyroscope on the y axis. 

Activities have been updated with character identifiers the new identifiers are as follows:

1 = Walk (Walking)
2 = Walk_Up (Walking Upstairs)
3 = Walk_Down (Walking Downstairs)
4 = Sit (Sitting)
5 = Stand (Standing)
6 = Lay (Laying)


The Final Dataset has been ordered by Subject and Activity for clarity, the all 6 activities of all 30 subjects are grouped together and subjects have been ordered by number. 

There are 180 rows of observations that reflect the mean value for each data point by subject and activity.
