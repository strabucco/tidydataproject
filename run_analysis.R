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
#colnames(combine_data)<-combine_data[1, ]
#combine_data2<- as.data.frame(combine_data[-1,])
#combine_data3<-as.data.frame(sapply(combine_data2, as.numeric))
meanData<-grep("mean", combine_data, ignore.case = TRUE )
stdData<-grep("std", combine_data, ignore.case = TRUE)
index<-c(1, 2, meanData, stdData)
DataOfInterest<-combine_data[,index]
DataOfInterest[2][DataOfInterest[2]==1]<-"Walking"
DataOfInterest[2][DataOfInterest[2]==2]<- "Walking_Upstairs"
DataOfInterest[2][DataOfInterest[2]==3]<- "Walking_Downstairs"
DataOfInterest[2][DataOfInterest[2]==2]<- "Sitting"
DataOfInterest[2][DataOfInterest[2]==5]<-"Standing"
DataOfInterest[2][DataOfInterest[2]==6]<- "Laying"

DataOfInterest[1,3]<-"t.Body.Accelerometer.X.mean"
DataOfInterest[1,4]<-"t.Body.Accelerometer.Y.mean"
DataOfInterest[1,5]<-"t.Body.Accelerometer.Z.mean"
DataOfInterest[1,6]<-"t.Gravity.Accelerometer.X.mean"
DataOfInterest[1,7]<-"t.Gravity.Accelerometer.Y.mean"
DataOfInterest[1,8]<-"t.Gravity.Accelerometer.Z.mean"
DataOfInterest[1,9]<-"t.Body.Accelerometer.Jerk.X.mean"
DataOfInterest[1,10]<-"t.Body.Accelerometer.Jerk.Y.mean"
DataOfInterest[1,11]<-"t.Body.Accelerometer.Jerk.Z.mean"
DataOfInterest[1,12]<-"t.Body.Gyroscope.X.mean"
DataOfInterest[1,13]<-"t.Body.Gyroscope.Y.mean"
DataOfInterest[1,14]<-"t.Body.Gyroscope.Z.mean"
DataOfInterest[1,15]<-"t.Body.Gyroscope.Jerk.X.mean"
DataOfInterest[1,16]<-"t.Body.Gyroscope.Jerk.Y.mean"
DataOfInterest[1,17]<-"t.Body.Gyroscope.Jerk.Z.mean"
DataOfInterest[1,18]<-"t.Body.Accelerometer.Magnitude.mean"
DataOfInterest[1,19]<-"t.Gravity.Accelerometer.Magnitude.mean"
DataOfInterest[1,20]<-"t.Body.Accelerometer.Jerk.Magnitude.mean"
DataOfInterest[1,21]<-"t.Body.Gyroscope.Magnitude.mean"
DataOfInterest[1,22]<-"t.Body.Gyroscope.Jerk.Magnitude.mean"
DataOfInterest[1,23]<-"f.Body.Accelerometer.X.mean"
DataOfInterest[1,24]<-"f.Body.Accelerometer.Y.mean"
DataOfInterest[1,25]<-"f.Body.Accelerometer.Z.mean"
DataOfInterest[1,26]<-"f.Body.Accelerometer.X.Frequency.mean"
DataOfInterest[1,27]<-"f.Body.Accelerometer.Y.Frequency.mean"
DataOfInterest[1,28]<-"f.Body.Accelerometer.Z.Frequency.mean"
DataOfInterest[1,29]<-"f.Body.Accelerometer.Jerk.X.mean"
DataOfInterest[1,30]<-"f.Body.Accelerometer.Jerk.Y.mean"
DataOfInterest[1,31]<-"f.Body.Accelerometer.Jerk.Z.mean"
DataOfInterest[1,32]<-"f.Body.Accelerometer.Jerk.X.Frequency.mean"
DataOfInterest[1,33]<-"f.Body.Accelerometer.Jerk.Y.Frequency.mean"
DataOfInterest[1,34]<-"f.Body.Accelerometer.Jerk.Z.Frequency.mean"
DataOfInterest[1,35]<-"f.Body.Gyroscope.X.mean"
DataOfInterest[1,36]<-"f.Body.Gyroscope.Y.mean"
DataOfInterest[1,37]<-"f.Body.Gyroscope.Z.mean"
DataOfInterest[1,38]<-"f.Body.Gyroscope.X.Frequency.mean"
DataOfInterest[1,39]<-"f.Body.Gyroscope.Y.Frequency.mean"
DataOfInterest[1,40]<-"f.Body.Gyroscope.Z.Frequency.mean"
DataOfInterest[1,41]<-"f.Body.Accelerometer.Magnitude.mean"
DataOfInterest[1,42]<-"f.Body.Accelerometer.Magnitude.Frequency.mean"
DataOfInterest[1,43]<-"f.Body.Accelerometer.Jerk.Magnitude.mean"
DataOfInterest[1,44]<-"f.Body.Accelerometer.Jerk.Magnitude.Frequency.mean"
DataOfInterest[1,45]<-"f.Body.Gyroscope.Magnitude.mean"
DataOfInterest[1,46]<-"f.Body.Gyroscope.Magnitude.Frequency.mean"
DataOfInterest[1,47]<-"f.Body.Gyroscope.Jerk.Magnitude.mean"
DataOfInterest[1,48]<-"f.Body.Gyroscope.Jerk.Magnitude.Frequency.mean"
DataOfInterest[1,49]<-"angle.t.Body.Accelerometer.mean.By.Gravity"
DataOfInterest[1,50]<-"angle.t.Body.Accelerometer.Jerk.mean.By.Gravity.mean"
DataOfInterest[1,51]<-"angle.t.Body.Gyroscope.mean.By.Gravity.mean"
DataOfInterest[1,52]<-"angle.t.Body.Gyroscope.Jerk.mean.By.Gravity.mean"
DataOfInterest[1,53]<-"angle.X.By.Gravity.mean"
DataOfInterest[1,54]<-"angle.Y.By.Gravity.mean"
DataOfInterest[1,55]<-"angle.Z.By.Gravity.mean"
DataOfInterest[1,56]<-"t.Body.Accelerometer.X.std"
DataOfInterest[1,57]<-"t.Body.Accelerometer.Y.std"
DataOfInterest[1,58]<-"t.Body.Accelerometer.Z.std"
DataOfInterest[1,59]<-"t.Gravity.Accelerometer.X.std"
DataOfInterest[1,60]<-"t.Gravity.Accelerometer.Y.std"
DataOfInterest[1,61]<-"t.Gravity.Accelerometer.Z.std"
DataOfInterest[1,62]<-"t.Body.Accelerometer.Jerk.X.std"
DataOfInterest[1,63]<-"t.Body.Accelerometer.Jerk.Y.std"
DataOfInterest[1,64]<-"t.Body.Accelerometer.Jerk.Z.std"
DataOfInterest[1,65]<-"t.Body.Gyroscope.X.std"
DataOfInterest[1,66]<-"t.Body.Gyroscope.Y.std"
DataOfInterest[1,67]<-"t.Body.Gyroscope.Z.std"
DataOfInterest[1,68]<-"t.Body.Gyroscope.Jerk.X.std"
DataOfInterest[1,69]<-"t.Body.Gyroscope.Jerk.Y.std"
DataOfInterest[1,70]<-"t.Body.Gyroscope.Jerk.Z.std"
DataOfInterest[1,71]<-"t.Body.Accelerometer.Magnitude.std"
DataOfInterest[1,72]<-"t.Gravity.Accelerometer.Magnitude.std"
DataOfInterest[1,73]<-"t.Body.Accelerometer.Jerk.Magnitude.std"
DataOfInterest[1,74]<-"t.Body.Gyroscope.Magnitude.std"
DataOfInterest[1,75]<-"t.Body.Gyroscope.Jerk.Magnitude.std"
DataOfInterest[1,76]<-"f.Body.Accelerometer.X.std"
DataOfInterest[1,77]<-"f.Body.Accelerometer.Y.std"
DataOfInterest[1,78]<-"f.Body.Accelerometer.Z.std"
DataOfInterest[1,79]<-"f.Body.Accelerometer.Jerk.X.std"
DataOfInterest[1,80]<-"f.Body.Accelerometer.Jerk.Y.std"
DataOfInterest[1,81]<-"f.Body.Accelerometer.Jerk.Z.std"
DataOfInterest[1,82]<-"f.Body.Gyroscope.X.std"
DataOfInterest[1,83]<-"f.Body.Gyroscope.Y.std"
DataOfInterest[1,84]<-"f.Body.Gyroscope.Z.std"
DataOfInterest[1,85]<-"f.Body.Accelerometer.Magnitude.std"
DataOfInterest[1,86]<-"f.Body.Accelerometer.Jerk.Magnitude.std"
DataOfInterest[1,87]<-"f.Body.Gyroscope.Magnitude.std"
DataOfInterest[1,88]<-"f.Body.Gyroscope.Jerk.Magnitude.std"
Head(DataOfInterest, n=2)
#write.table(new_train, file="new_train_test.txt", row.names=FALSE)
#new<-read.table("new_train_test.txt", header=TRUE)