
##upload the necessary libraries
library(dplyr)
library(plyr)

##read the training and test datasets
X_train <- read.table("./train/X_train.txt")
X_test <- read.table("./test/X_test.txt")

head(X_train)
head(X_test)

nrow(X_train)
nrow(X_test)

subject_train <- read.table("./train/subject_train.txt")
subject_test <- read.table("./test/subject_test.txt")

head(subject_train)
head(subject_test)

nrow(X_train)
nrow(X_test)

y_train <- read.table("./train/y_train.txt")
y_test <- read.table("./test/y_test.txt")

head(y_train)
head(y_test)

nrow(y_train)
nrow(y_test)

##create a unique row id for the training tables
X_train$id <- rownames(X_train)
head(X_train)

y_train$id <- rownames(y_train)
head(y_train)

subject_train$id <- rownames(subject_train)
head(subject_train)

##join all 3 training tables by id
train_data1 <- left_join(subject_train,y_train, by="id")
head(train_data1)
train_data_all <- left_join(train_data1,X_train, by="id")
head(train_data_all)

##create a variable to define dataset type as train
train_data_all$dataset_type <- c("train")

##create a unique row id for the test tables
X_test$id <- rownames(X_test)
head(X_test)

y_test$id <- rownames(y_test)
head(y_test)

subject_test$id <- rownames(subject_test)
head(subject_test)

##join all 3 test tables by id
test_data1 <- left_join(subject_test,y_test, by="id")
head(test_data1)
test_data_all <- left_join(test_data1,X_test, by="id")
head(test_data_all)

##create a variable to define dataset type as test
test_data_all$dataset_type <- c("test")

##combine training and test datasets
data_all <- rbind(train_data_all, test_data_all)

##get the variables names related with the mean and standard deviation from the features table 
features <- read.table("./features.txt")
table_features <- paste0("V", grep("mean|std", features$V2), ",")

name_features <- grep("mean|std", features$V2, value=TRUE)

table_features2 <- paste(table_features,collapse=" ")
table_features2
table_features3 <- substr(table_features2, 1, nchar(table_features2)-1) 
as.symbol(table_features3)

##Extracts only the measurements on the mean and standard deviation for each measurement
data_all2 <- select(data_all, id, V1.x, V1.y, dataset_type, V1, V2, V3, V4, V5, V6, V41, V42, V43, V44, V45, V46, V81, V82, 
                    V83, V84, V85, V86, V121, V122, V123, V124, V125, V126, V161, V162, V163, V164, V165, V166, V201, 
                    V202, V214, V215, V227, V228, V240, V241, V253, V254, V266, V267, V268, V269, V270, V271, V294, 
                    V295, V296, V345, V346, V347, V348, V349, V350, V373, V374, V375, V424, V425, V426, V427, V428,
                    V429, V452, V453, V454, V503, V504, V513, V516, V517, V526, V529, V530, V539, V542, V543, V552)
 
head(data_all2)  

##Get the descriptive activity names to name the activities in the data set
activity_labels <- read.table("./activity_labels.txt")
names(activity_labels)[1]<-paste("V1.y")
names(activity_labels)[2]<-paste("activity_name")
head(activity_labels)

data_all2b <- left_join(data_all2,activity_labels, by="V1.y")


data_all3 <- select(data_all2b, id, V1.x,activity_name, dataset_type, V1, V2, V3, V4, V5, V6, V41, V42, V43, V44, V45, V46, V81, V82, 
                    V83, V84, V85, V86, V121, V122, V123, V124, V125, V126, V161, V162, V163, V164, V165, V166, V201, 
                    V202, V214, V215, V227, V228, V240, V241, V253, V254, V266, V267, V268, V269, V270, V271, V294, 
                    V295, V296, V345, V346, V347, V348, V349, V350, V373, V374, V375, V424, V425, V426, V427, V428,
                    V429, V452, V453, V454, V503, V504, V513, V516, V517, V526, V529, V530, V539, V542, V543, V552)

head(data_all3)

             
##labels the data set with descriptive variable names
names(data_all3)[1]<-paste("RowID")
names(data_all3)[2]<-paste("SubjectID")

names(data_all3)[5]<-paste("tBodyAcc-mean()-X")
names(data_all3)[6]<-paste("tBodyAcc-mean()-Y")
names(data_all3)[7]<-paste("tBodyAcc-mean()-Z")
names(data_all3)[8]<-paste("tBodyAcc-std()-X")
names(data_all3)[9]<-paste("tBodyAcc-std()-Y")
names(data_all3)[10]<-paste("tBodyAcc-std()-Z")
names(data_all3)[11]<-paste("tGravityAcc-mean()-X")
names(data_all3)[12]<-paste("tGravityAcc-mean()-Y")
names(data_all3)[13]<-paste("tGravityAcc-mean()-Z")
names(data_all3)[14]<-paste("tGravityAcc-std()-X")
names(data_all3)[15]<-paste("tGravityAcc-std()-Y")
names(data_all3)[16]<-paste("tGravityAcc-std()-Z")
names(data_all3)[17]<-paste("tBodyAccJerk-mean()-X")
names(data_all3)[18]<-paste("tBodyAccJerk-mean()-Y")
names(data_all3)[19]<-paste("tBodyAccJerk-mean()-Z")
names(data_all3)[20]<-paste("tBodyAccJerk-std()-X")
names(data_all3)[21]<-paste("tBodyAccJerk-std()-Y")
names(data_all3)[22]<-paste("tBodyAccJerk-std()-Z")
names(data_all3)[23]<-paste("tBodyGyro-mean()-X")
names(data_all3)[24]<-paste("tBodyGyro-mean()-Y")
names(data_all3)[25]<-paste("tBodyGyro-mean()-Z")
names(data_all3)[26]<-paste("tBodyGyro-std()-X")
names(data_all3)[27]<-paste("tBodyGyro-std()-Y")
names(data_all3)[28]<-paste("tBodyGyro-std()-Z")
names(data_all3)[29]<-paste("tBodyGyroJerk-mean()-X")
names(data_all3)[30]<-paste("tBodyGyroJerk-mean()-Y")
names(data_all3)[31]<-paste("tBodyGyroJerk-mean()-Z")
names(data_all3)[32]<-paste("tBodyGyroJerk-std()-X")
names(data_all3)[33]<-paste("tBodyGyroJerk-std()-Y")
names(data_all3)[34]<-paste("tBodyGyroJerk-std()-Z")
names(data_all3)[35]<-paste("tBodyAccMag-mean()")
names(data_all3)[36]<-paste("tBodyAccMag-std()")
names(data_all3)[37]<-paste("tGravityAccMag-mean()")
names(data_all3)[38]<-paste("tGravityAccMag-std()")
names(data_all3)[39]<-paste("tBodyAccJerkMag-mean()")
names(data_all3)[40]<-paste("tBodyAccJerkMag-std()")
names(data_all3)[41]<-paste("tBodyGyroMag-mean()")
names(data_all3)[42]<-paste("tBodyGyroMag-std()")
names(data_all3)[43]<-paste("tBodyGyroJerkMag-mean()")
names(data_all3)[44]<-paste("tBodyGyroJerkMag-std()")
names(data_all3)[45]<-paste("fBodyAcc-mean()-X")
names(data_all3)[46]<-paste("fBodyAcc-mean()-Y")
names(data_all3)[47]<-paste("fBodyAcc-mean()-Z")
names(data_all3)[48]<-paste("fBodyAcc-std()-X")
names(data_all3)[49]<-paste("fBodyAcc-std()-Y")
names(data_all3)[50]<-paste("fBodyAcc-std()-Z")
names(data_all3)[51]<-paste("fBodyAcc-meanFreq()-X")
names(data_all3)[52]<-paste("fBodyAcc-meanFreq()-Y")
names(data_all3)[53]<-paste("fBodyAcc-meanFreq()-Z")
names(data_all3)[54]<-paste("fBodyAccJerk-mean()-X")
names(data_all3)[55]<-paste("fBodyAccJerk-mean()-Y")
names(data_all3)[56]<-paste("fBodyAccJerk-mean()-Z")
names(data_all3)[57]<-paste("fBodyAccJerk-std()-X")
names(data_all3)[58]<-paste("fBodyAccJerk-std()-Y")
names(data_all3)[59]<-paste("fBodyAccJerk-std()-Z")
names(data_all3)[60]<-paste("fBodyAccJerk-meanFreq()-X")
names(data_all3)[61]<-paste("fBodyAccJerk-meanFreq()-Y")
names(data_all3)[62]<-paste("fBodyAccJerk-meanFreq()-Z")
names(data_all3)[63]<-paste("fBodyGyro-mean()-X")
names(data_all3)[64]<-paste("fBodyGyro-mean()-Y")
names(data_all3)[65]<-paste("fBodyGyro-mean()-Z")
names(data_all3)[66]<-paste("fBodyGyro-std()-X")
names(data_all3)[67]<-paste("fBodyGyro-std()-Y")
names(data_all3)[68]<-paste("fBodyGyro-std()-Z")
names(data_all3)[69]<-paste("fBodyGyro-meanFreq()-X")
names(data_all3)[70]<-paste("fBodyGyro-meanFreq()-Y")
names(data_all3)[71]<-paste("fBodyGyro-meanFreq()-Z")
names(data_all3)[72]<-paste("fBodyAccMag-mean()")
names(data_all3)[73]<-paste("fBodyAccMag-std()")
names(data_all3)[74]<-paste("fBodyAccMag-meanFreq()")
names(data_all3)[75]<-paste("fBodyBodyAccJerkMag-mean()")
names(data_all3)[76]<-paste("fBodyBodyAccJerkMag-std()")
names(data_all3)[77]<-paste("fBodyBodyAccJerkMag-meanFreq()")
names(data_all3)[78]<-paste("fBodyBodyGyroMag-mean()")
names(data_all3)[79]<-paste("fBodyBodyGyroMag-std()")
names(data_all3)[80]<-paste("fBodyBodyGyroMag-meanFreq()")
names(data_all3)[81]<-paste("fBodyBodyGyroJerkMag-mean()")
names(data_all3)[82]<-paste("fBodyBodyGyroJerkMag-std()")
names(data_all3)[83]<-paste("fBodyBodyGyroJerkMag-meanFreq()")
      
names(data_all3)
head(data_all3,2)

data_all_final <- data_all3
summary(data_all_final)

##creates a second, independent tidy data set with the average of each variable for each activity and each subject
data_all4 <- select(data_all3,  -(c(RowID,dataset_type)))

summary_data <- ddply(data_all4, .(SubjectID,activity_name), colwise(mean))
head(summary_data)

##exporting output data set as text file
write.table(summary_data,"GCD_Project_step5.txt",row.name=FALSE)  

##to check if the output file is tidy or not
output_table <- read.table("GCD_Project_step5.txt")
View(output_table)
