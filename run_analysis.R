#--- start with reading in the test and train text file as tables
#    without factor coercing or whitespaces

#testtb <- read.table("./data/UCI HAR Dataset/test/X_test.txt", sep='',stringsAsFactors=FALSE,strip.white=TRUE)
#traintb <- read.table("./data/UCI HAR Dataset/train/X_train.txt", sep='',stringsAsFactors=FALSE,strip.white=TRUE)
#sublist <- scan("./data/UCI HAR Dataset/train/subject_train.txt",what=numeric())
#heads <- read.table("./data/UCI HAR Dataset/features.txt", sep='')
#hlist = heads$v2
#hlist = as.character(heads[,2])
#colnames(ttb)<-hlist