#This will be to tidy and merge my data

trainsub<-read.table("~/Documents/DataScienceCoursera/CleaningAndGettingData/Week_3_Project/forTidyData/UCI_HAR_Dataset/train/subject_train.txt")
movement_train<-read.table("~/Documents/DataScienceCoursera/CleaningAndGettingData/Week_3_Project/forTidyData/UCI_HAR_Dataset/train/y_train.txt")
values_train<-read.table("~/Documents/DataScienceCoursera/CleaningAndGettingData/Week_3_Project/forTidyData/UCI_HAR_Dataset/train/X_train.txt")
feature_names<-read.table("~/Documents/DataScienceCoursera/CleaningAndGettingData/Week_3_Project/forTidyData/UCI_HAR_Dataset/features.txt")
row_names<-t(feature_names)
#row 2 of row_names will become the new column names
just_names<-row_names[-1,] #removing the extra row
column_names<-make.names(just_names) #making the names valid
values_withNames<-rbind(column_names,values_train) #adding column names as header
trainSubjectTitle<-rbind("Subject_ID", trainsub) #adding column header
movementTrainTitle<-rbind("Movement_name", movement_train) #adding column header
new_train<- cbind(trainSubjectTitle, movementTrainTitle, values_withNames)
# combining subject, movment ID and values into single table

sub_test<-read.table("~/Documents/DataScienceCoursera/CleaningAndGettingData/Week_3_Project/forTidyData/UCI_HAR_Dataset/test/subject_test.txt")
movement_test<-read.table("~/Documents/DataScienceCoursera/CleaningAndGettingData/Week_3_Project/forTidyData/UCI_HAR_Dataset/test/y_test.txt")
values_test<-read.table("~/Documents/DataScienceCoursera/CleaningAndGettingData/Week_3_Project/forTidyData/UCI_HAR_Dataset/test/X_test.txt")

new_test<-cbind(sub_test, movement_test, values_test)
#combing subject, movment ID and values for test data

combine_data<-rbind(new_train, new_test)
#adding the test data to the end of the training set

str(combine_data)

#write.table(new_train, file="new_train_test.txt", row.names=FALSE)
#new<-read.table("new_train_test.txt", header=TRUE)