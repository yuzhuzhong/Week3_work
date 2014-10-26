activity_labels: storage the data from activity_labels.txt

features: storage the data from features.txt

subject_train: storage the data from subject_train.txt

X_train: storage the data from X_train.txt

y_train: storage the data from y_train.txt

training: data.frame by X_train,y_train$V1,subject_train$V1

subject_test: storage the data from subject_test.txt

X_test: storage the data from X_test.txt

y_test: storage the data from y_test.txt

test: dtat.frame by X_test,y_test$V1,subject_test$V1

mergedata: rbind by training,test

extractsdata: extractsdata

newnames: names

extractsdata$activity_labels: extractsdata$activity_labels

second: the result 

