#This will be to tidy and merge my data

trainsub<-read.table("~/Documents/DataScienceCoursera/CleaningAndGettingData/Week_3_Project/forTidyData/UCI_HAR_Dataset/train/subject_train.txt")
movement_train<-read.table("~/Documents/DataScienceCoursera/CleaningAndGettingData/Week_3_Project/forTidyData/UCI_HAR_Dataset/train/y_train.txt")
values_train<-read.table("~/Documents/DataScienceCoursera/CleaningAndGettingData/Week_3_Project/forTidyData/UCI_HAR_Dataset/train/X_train.txt")
feature_names<-read.table("~/Documents/DataScienceCoursera/CleaningAndGettingData/Week_3_Project/forTidyData/UCI_HAR_Dataset/features.txt")
#names(trainsub)
#names(movement_train)
#names(values_train)
#names(feature_names)
#str(feature_names)
row_names<-t(feature_names)
#row 2 of row_names will become the new column names
just_names<-row_names[-1,]
column_names<-make.names(just_names)
values_withNames<-rbind(column_names,values_train)
trainSubjectTitle<-rbind("Subject_ID", trainsub)
movementTrainTitle<-rbind("Movement_name", movement_train)
new_train<- cbind(trainSubjectTitle, movementTrainTitle, values_withNames)
write.table(new_train, file="new_train_test.txt", row.names=FALSE)
new<-read.table("new_train_test.txt", header=TRUE)
new