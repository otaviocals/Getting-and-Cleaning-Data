run_analysis <- function()
{

	library(dplyr)
	library(xlsx)

##Reading Data

	##Variable Names
	var_names <- read.table(paste0(getwd(),"/UCI HAR Dataset/features.txt"))

	##Train Table
	traintable <- read.table(paste0(getwd(),"/UCI HAR Dataset/train/X_train.txt"),col.names=var_names[,2])
	subtrain <- read.table(paste0(getwd(),"/UCI HAR Dataset/train/subject_train.txt"))
	trainactiv <- read.table(paste0(getwd(),"/UCI HAR Dataset/train/y_train.txt"))

	traintable <-cbind(subtrain,trainactiv,traintable)
	names(traintable)[1:2] <- c("subject","activity")


	##Test Table
	testtable <- read.table(paste0(getwd(),"/UCI HAR Dataset/test/X_test.txt"),col.names=var_names[,2])
	subtest <- read.table(paste0(getwd(),"/UCI HAR Dataset/test/subject_test.txt"))
	testactiv <- read.table(paste0(getwd(),"/UCI HAR Dataset/test/y_test.txt"))

	testtable <- cbind(subtest,testactiv,testtable)
	names(testtable)[1:2] <- c("subject","activity")

##Merging Data


	merged <- rbind(traintable,testtable)


##Subsetting mean() and std() values

	subset_merged <- merged[,c(1:2,3:8,43:48,83:88,123:128,163:168,203:204,216:217,229:230,242:243,255:256,268:273,347:352,426:431,505:506,518:519,531:532,544:545)]

##Naming Activities

	arranged <- arrange(subset_merged,subject,activity)
	arranged$activity=ifelse(arranged$activity==1,"WALKING",ifelse(arranged$activity==2,"WALKING_UPSTAIRS",ifelse(arranged$activity==3,"WALKING_DOWNSTAIRS",ifelse(arranged$activity==4,"SITTING",ifelse(arranged$activity==5,"STANDING","LAYING")))))

##Renaming Variables

	names(arranged)<-c("Subject","Activity","tBodyAccMeanX","tBodyAccMeanY","tBodyAccMeanZ","tBodyAccSdX","tBodyAccSdY","tBodyAccSdZ","tGravAccMeanX","tGravAccMeanY","tGravAccMeanZ","tGravAccSdX","tGravAccSdY","tGravAccSdZ","tBodyAccJerkMeanX","tBodyAccJerkMeanY","tBodyAccJerkMeanZ","tBodyAccJerkSdX","tBodyAccJerkSdY","tBodyAccJerkSdZ","tBodyGyroMeanX","tBodyGyroMeanY","tBodyGyroMeanZ","tBodyGyroSdX","tBodyGyroSdY","tBodyGyroSdZ","tBodyGyroJerkMeanX","tBodyGyroJerkMeanY","tBodyGyroJerkMeanZ","tBodyGyroJerkSdX","tBodyGyroJerkSdY","tBodyGyroJerkSdZ","tBodyAccMagMean","tBodyAccMagSd","tGravAccMagMean","tGravAccMagSd","tBodyAccJerkMagMean","tBodyAccJerkMagSd","tBodyGyroMagMean","tBodyGyroMagSd","tBodyGyroJerkMagMean","tBodyGyroJerkMagSd","fBodyAccMeanX","fBodyAccMeanY","fBodyAccMeanZ","fBodyAccSdX","fBodyAccSdY","fBodyAccSdZ","fBodyAccJerkMeanX","fBodyAccJerkMeanY","fBodyAccJerkMeanZ","fBodyAccJerkSdX","fBodyAccJerkSdY","fBodyAccJerkSdZ","fBodyGyroMeanX","fBodyGyroMeanY","fBodyGyroMeanZ","fBodyGyroSdX","fBodyGyroSdY","fBodyGyroSdZ","fBodyAccMagMean","fBodyAccMagSd","fBodyBodyAccJerkMagMean","fBodyBodyAccJerkMagSd","fBodyBodyGyroMagMean","fBodyBodyGyroMagSd","fBodyBodyGyroJerkMagMean","fBodyBodyGyroJerkMagSd")

##Creating Average Set

	sub_act <- group_by(arranged,Subject,Activity)
	summarizedtable <- summarize(sub_act,tBodyAccMeanX=mean(tBodyAccMeanX),tBodyAccMeanY=mean(tBodyAccMeanY),tBodyAccMeanZ=mean(tBodyAccMeanZ),tBodyAccSdX=mean(tBodyAccSdX),tBodyAccSdY=mean(tBodyAccSdY),tBodyAccSdZ=mean(tBodyAccSdZ),tGravAccMeanX=mean(tGravAccMeanX),tGravAccMeanY=mean(tGravAccMeanX),tGravAccMeanX=mean(tGravAccMeanZ),tGravAccSdX=mean(tGravAccSdX),tGravAccSdX=mean(tGravAccSdY),tGravAccSdX=mean(tGravAccSdZ),tBodyAccJerkMeanX=mean(tBodyAccJerkMeanX),tBodyAccJerkMeanY=mean(tBodyAccJerkMeanY),tBodyAccJerkMeanZ=mean(tBodyAccJerkMeanZ),tBodyAccJerkSdX=mean(tBodyAccJerkSdX),tBodyAccJerkSdY=mean(tBodyAccJerkSdY),tBodyAccJerkSdZ=mean(tBodyAccJerkSdZ),tBodyGyroMeanX=mean(tBodyGyroMeanX),tBodyGyroMeanY=mean(tBodyGyroMeanY),tBodyGyroMeanZ=mean(tBodyGyroMeanZ),tBodyGyroSdX=mean(tBodyGyroSdX),tBodyGyroSdY=mean(tBodyGyroSdY),tBodyGyroSdZ=mean(tBodyGyroSdZ),tBodyGyroJerkMeanX=mean(tBodyGyroJerkMeanX),tBodyGyroJerkMeanY=mean(tBodyGyroJerkMeanY),tBodyGyroJerkMeanZ=mean(tBodyGyroJerkMeanZ),tBodyGyroJerkSdX=mean(tBodyGyroJerkSdX),tBodyGyroJerkSdY=mean(tBodyGyroJerkSdY),tBodyGyroJerkSdZ=mean(tBodyGyroJerkSdZ),tBodyAccMagMean=mean(tBodyAccMagMean),tBodyAccMagSd=mean(tBodyAccMagSd),tGravAccMagMean=mean(tGravAccMagMean),tGravAccMagSd=mean(tGravAccMagSd),tBodyAccJerkMagMean=mean(tBodyAccJerkMagMean),tBodyAccJerkMagSd=mean(tBodyAccJerkMagSd),tBodyGyroMagMean=mean(tBodyGyroMagMean),tBodyGyroMagSd=mean(tBodyGyroMagSd),tBodyGyroJerkMagMean=mean(tBodyGyroJerkMagMean),tBodyGyroJerkMagSd=mean(tBodyGyroJerkMagSd),fBodyAccMeanX=mean(fBodyAccMeanX),fBodyAccMeanY=mean(fBodyAccMeanY),fBodyAccMeanZ=mean(fBodyAccMeanZ),fBodyAccSdX=mean(fBodyAccSdX),fBodyAccSdY=mean(fBodyAccSdY),fBodyAccSdZ=mean(fBodyAccSdZ),fBodyAccJerkMeanX=mean(fBodyAccJerkMeanX),fBodyAccJerkMeanY=mean(fBodyAccJerkMeanY),fBodyAccJerkMeanZ=mean(fBodyAccJerkMeanZ),fBodyAccJerkSdX=mean(fBodyAccJerkSdX),fBodyAccJerkSdY=mean(fBodyAccJerkSdY),fBodyAccJerkSdZ=mean(fBodyAccJerkSdZ),fBodyGyroMeanX=mean(fBodyGyroMeanX),fBodyGyroMeanY=mean(fBodyGyroMeanY),fBodyGyroMeanZ=mean(fBodyGyroMeanZ),fBodyGyroSdX=mean(fBodyGyroSdX),fBodyGyroSdY=mean(fBodyGyroSdY),fBodyGyroSdZ=mean(fBodyGyroSdZ),fBodyAccMagMean=mean(fBodyAccMagMean),fBodyAccMagSd=mean(fBodyAccMagSd),fBodyBodyAccJerkMagMean=mean(fBodyBodyAccJerkMagMean),fBodyBodyAccJerkMagSd=mean(fBodyBodyAccJerkMagSd),fBodyBodyGyroMagMean=mean(fBodyBodyGyroMagMean),fBodyBodyGyroMagSd=mean(fBodyBodyGyroMagSd),fBodyBodyGyroJerkMagMean=mean(fBodyBodyGyroJerkMagMean),fBodyBodyGyroJerkMagSd=mean(fBodyBodyGyroJerkMagSd))



##Writing to File

	write.xlsx(summarizedtable,file="summarized.xlsx")
	write.table(summarizedtable,file="summarized.txt",row.name=FALSE,sep="\t")



}