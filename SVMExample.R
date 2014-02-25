## SVM Example

library(e1071)
library(rpart)


data(Glass, package="mlbench")

index <- 1:nrow(Glass)
testindex <- sample(index, trunc(length(index)/3))
testset <- Glass[testindex,]
trainset <- Glass[-testindex,]


svm.model <- svm(Type ~., data=trainset, cost=100, gamma=1)
svm.pred <- predict(svm.model, testset[,-10], type = "class")

svm.pred
trainset[,10]

table(pred = svm.pred, true = testset[,10])
