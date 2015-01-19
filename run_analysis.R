#!/usr/bin/env Rscript
#--- start with reading in the test and train text file as tables
#    without factor coercing or whitespaces
## =============  CHECK FOR FILES (working dir)  ==============================
run_analysis <-function(){
library(dplyr)  
  
file_list <- c("features.txt","activity_labels.txt",
               "train/X_train.txt","train/y_train.txt","train/subject_train.txt",             
               "test/X_test.txt","test/y_test.txt","test/subject_test.txt")
#ok is true unless a file isn't located
ok=TRUE

for( i in file_list){
  if(file.exists(i)){
    cat("Found ",i,"\n")
    
  }
  else{
    cat("Can't find: ",i,"\n")
    ok = FALSE
  }
}  
  if(ok==F){
    cat("\nThis script must be run in a working directory containing the above file list.\n",
        "If you downloaded the 'UCI HAR Dataset' use >setwd('[path to UCI HAR Dataset]')")
    stop()
  }
  else{
    cat(" good to go PLEASE WAIT!")
  }
  
 


testtb <- read.table("./test/X_test.txt",stringsAsFactors=FALSE)
traintb <- read.table("./train/X_train.txt",stringsAsFactors=FALSE)
heads <- read.table("./features.txt",stringsAsFactors=FALSE)



setnames(testtb,heads[,2])
setnames(traintb,heads[,2])

test_sublist <- scan("./test/subject_test.txt",what=numeric())
train_sublist <- scan("./train/subject_train.txt",what=numeric())

testtb$subject<-test_sublist
traintb$subject<-train_sublist

test_actlist <- scan("./test/y_test.txt",what=numeric())
train_actlist <- scan("./train/y_train.txt",what=numeric())

testtb$activity=test_actlist
traintb$activity=train_actlist

fulltb <- rbind(testtb,traintb)
print(nrow(fulltb))

usable_cols<- c("tBodyAcc-mean()-X",
               "tBodyAcc-mean()-Y",
               "tBodyAcc-mean()-Z",
               "tBodyAcc-std()-X",
               "tBodyAcc-std()-Y",
               "tBodyAcc-std()-Z",
               "tGravityAcc-mean()-X",
               "tGravityAcc-mean()-Y",
               "tGravityAcc-mean()-Z",
               "tGravityAcc-std()-X",
               "tGravityAcc-std()-Y",
               "tGravityAcc-std()-Z",
               "tBodyAccJerk-mean()-X",
               "tBodyAccJerk-mean()-Y",
               "tBodyAccJerk-mean()-Z",
               "tBodyAccJerk-std()-X",
               "tBodyAccJerk-std()-Y",
               "tBodyAccJerk-std()-Z",
               "tBodyGyro-mean()-X",
               "tBodyGyro-mean()-Y",
               "tBodyGyro-mean()-Z",
               "tBodyGyro-std()-X",
               "tBodyGyro-std()-Y",
               "tBodyGyro-std()-Z",
               "tBodyGyroJerk-mean()-X",
               "tBodyGyroJerk-mean()-Y",
               "tBodyGyroJerk-mean()-Z",
               "tBodyGyroJerk-std()-X",
               "tBodyGyroJerk-std()-Y",
               "tBodyGyroJerk-std()-Z",
               "tBodyAccMag-mean()",
               "tBodyAccMag-std()",
               "tGravityAccMag-mean()",
               "tGravityAccMag-std()",
               "tBodyAccJerkMag-mean()",
               "tBodyAccJerkMag-std()",
               "tBodyGyroMag-mean()",
               "tBodyGyroMag-std()",
               "tBodyGyroJerkMag-mean()",
               "tBodyGyroJerkMag-std()",
               "fBodyAcc-mean()-X",
               "fBodyAcc-mean()-Y",
               "fBodyAcc-mean()-Z",
               "fBodyAcc-std()-X",
               "fBodyAcc-std()-Y",
               "fBodyAcc-std()-Z",
               "fBodyAcc-meanFreq()-X",
               "fBodyAcc-meanFreq()-Y",
               "fBodyAcc-meanFreq()-Z",
               "fBodyAccJerk-mean()-X",
               "fBodyAccJerk-mean()-Y",
               "fBodyAccJerk-mean()-Z",
               "fBodyAccJerk-std()-X",
               "fBodyAccJerk-std()-Y",
               "fBodyAccJerk-std()-Z",
               "fBodyAccJerk-meanFreq()-X",
               "fBodyAccJerk-meanFreq()-Y",
               "fBodyAccJerk-meanFreq()-Z",
               "fBodyGyro-mean()-X",
               "fBodyGyro-mean()-Y",
               "fBodyGyro-mean()-Z",
               "fBodyGyro-std()-X",
               "fBodyGyro-std()-Y",
               "fBodyGyro-std()-Z",
               "fBodyGyro-meanFreq()-X",
               "fBodyGyro-meanFreq()-Y",
               "fBodyGyro-meanFreq()-Z",
               "fBodyAccMag-mean()",
               "fBodyAccMag-std()",
               "fBodyAccMag-meanFreq()",
               "fBodyBodyAccJerkMag-mean()",
               "fBodyBodyAccJerkMag-std()",
               "fBodyBodyAccJerkMag-meanFreq()",
               "fBodyBodyGyroMag-mean()",
               "fBodyBodyGyroMag-std()",
               "fBodyBodyGyroMag-meanFreq()",
               "fBodyBodyGyroJerkMag-mean()",
               "fBodyBodyGyroJerkMag-std()",
               "fBodyBodyGyroJerkMag-meanFreq()",
               "angle(tBodyAccMean,gravity)",
               "angle(tBodyAccJerkMean),gravityMean)",
               "angle(tBodyGyroMean,gravityMean)",
               "angle(tBodyGyroJerkMean,gravityMean)",
               "angle(X,gravityMean)",
               "angle(Y,gravityMean)",
               "angle(Z,gravityMean)"
)

shorttb <- select(fulltb,useable_cols)
summarize(shorttb)
}