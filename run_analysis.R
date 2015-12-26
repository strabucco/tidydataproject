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
#row_names
new_train<- cbind(trainsub, movement_train, values_train)
#str(new_train)
