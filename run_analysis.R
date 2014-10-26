activity_labels <- read.table("./data/UCI HAR Dataset/activity_labels.txt")
features <- read.table("./data/UCI HAR Dataset/features.txt")
datacolnames <- c(as.character(features$V2),"activity_labels","subject")
subject_train <- read.table("./data/UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./data/UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./data/UCI HAR Dataset/train/y_train.txt")
training <- data.frame(X_train,y_train$V1,subject_train$V1)
colnames(training) <- datacolnames 
subject_test <- read.table("./data/UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("./data/UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./data/UCI HAR Dataset/test/y_test.txt")
test <- data.frame(X_test,y_test$V1,subject_test$V1)
colnames(test) <- datacolnames 
mergedata <- rbind(training,test)
colnames(mergedata) <- datacolnames
extractsdata <- cbind(mergedata[,grepl("mean()",datacolnames) | grepl("std()",datacolnames)],mergedata[,"activity_labels"],mergedata[,"subject"])
newnames <- c(datacolnames[grepl("mean()",datacolnames) | grepl("std()",datacolnames)],"activity_labels","subject")
colnames(extractsdata) <- newnames
extractsdata$activity_labels <- activity_labels$V2[extractsdata$activity_labels]
colnames(extractsdata) <- newnames
second <- aggregate(extractsdata[,1:(ncol(extractsdata)-2)],by=list(extractsdata$activity_labels,extractsdata$subject),FUN = mean)
colnames(second)[1:2] <- c("activity_labels","subject")
write.table(second,"average.txt",row.name=FALSE)
