##library loads & WD
library(dplyr)
library(plyr)
library(data.table)
setwd("~/Desktop/Coursera/Cleaningdata/Run_analysis")
## Reading in txt files for test
X_test<-read.table("./UCI HAR Dataset/test/X_test.txt",sep="",stringsAsFactors=F,header=F)
Test_Subject <- scan("./UCI HAR Dataset/test/subject_test.txt", what = "integer", sep = " ")
Test_Y <- scan("./UCI HAR Dataset/test/Y_test.txt", what = "integer", sep = " ")
TestNames <- read.table("./UCI HAR Dataset/features.txt")
## Build Test_Y and Test_Subject data frame
Testset <- data.table(Y = Test_Y, Subject = Test_Subject)
##Create X_test data frame
Xandnames <- data.frame(X_test)
##Update colnames in X_test data frame
TestNameChar <- as.character(TestNames$V2)
colnames(Xandnames) <- c(TestNameChar)
##Remove variables with duplicate names
Xandnames <- Xandnames[!duplicated(names(Xandnames))]
##Filter mean and std columns
MeanSTD <- c("mean()", "std()")
MeanSTDNames <- grep(paste(MeanSTD,collapse="|"), TestNameChar, value = T)
#Take pool of all STD and MEAN columns and remove MeanFreq
MeanSTDNames <- grep("meanFreq()", MeanSTDNames, value = T, invert = T)
FilterXandNames <- select(Xandnames, c(MeanSTDNames))
## Bind two test data frames
TestCombo <- cbind(Testset, FilterXandNames)
## Training Set
## Reading in txt files for training
X_train<-read.table("./UCI HAR Dataset/train/X_train.txt",sep="",stringsAsFactors=F,header=F)
Y_train <- read.table("./UCI HAR Dataset/train/Y_train.txt",sep="",stringsAsFactors=F,header=F)
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt",sep="",stringsAsFactors=F,header=F)
## Build Test_Y and Test_Subject data frame
TrainSet <- data.table(Y = Y_train, Subject = subject_train)
##Create X_train data frame
TrainXandnames <- data.frame(X_train)
##Update colnames in X_train data frame
colnames(TrainXandnames) <- c(TestNameChar)
##Remove variables with duplicate names
TrainXandnames <- TrainXandnames[!duplicated(names(TrainXandnames))]
##Filter mean and std columns
FTXandNames <- select(TrainXandnames, c(MeanSTDNames))
## Bind two train data frames
TrainCombo <- cbind(TrainSet, FTXandNames)
##Rename first two variables to match TestCombo
TrainCombo <- dplyr:: rename(TrainCombo, Y = Y.V1)
TrainCombo <- dplyr:: rename(TrainCombo, Subject = Subject.V1)
## RBind Test and Train
FinalSet <- rbind(TrainCombo, TestCombo)
##Clean variable names
FinalSet <- dplyr::rename(FinalSet, Activity = Y)
FinalSet$Activity <-gsub("1", "Walk", FinalSet$Activity)
FinalSet$Activity <- gsub("2", "Walk_Up", FinalSet$Activity)
FinalSet$Activity <- gsub("3", "Walk_Down", FinalSet$Activity)
FinalSet$Activity <- gsub("4", "Sit", FinalSet$Activity)
FinalSet$Activity <- gsub("5", "Stand", FinalSet$Activity)
FinalSet$Activity <- gsub("6", "Lay", FinalSet$Activity)
#Aggregate data frame into a final set that is clean and shows the means of each variable
Final <- aggregate(. ~ Subject + Activity, FinalSet, mean)
#Arrange by subject & activity
Final$Subject <- as.numeric(Final$Subject)
arrange(Final, Subject, Activity)
#clean up column names 
LastNames <- colnames(Final)
LastNames <- gsub("-", " ", LastNames)
LastNames <- gsub("\\()", "", LastNames)
LastNames <- gsub(" ", "", LastNames)
LastNames <- tolower(LastNames)
#Re-setting colnames
names(Final) <- LastNames
head(Final)
