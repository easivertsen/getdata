
#### loading data from  files using read.table
features <- read.table("./UCI HAR Dataset/features.txt")
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")

subject_test<- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")

subject_train<- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")

### combining test and train measurementdata, labels, and subjects
X <- rbind(X_test,X_train)
y <- rbind(y_test,y_train)
subject <- rbind(subject_test,subject_train)





### name the variables in the dataset
names(X) <- features$V2

###extract variables with mean and sd and create new dataframe with these variables
Xmeans <- X[,grep("mean", colnames(X))]
Xstds <- X[,grep("std", colnames(X))]
X <- cbind(Xmeans,Xstds)

### combine the subject, activity label and measurementdata dfs
total <- cbind(subject,y,X)


### Fixing the activity variable: Change to text labels

### recode the label variable to text, using the activity_lables
names <- activity_labels$V2
### reorder the factor so that each level correspond to the right number
names  <-  factor(names,levels(names)[c(4,6,5,2,3,1)])

total[,2] <- factor(total[,2], labels=levels(names))
### Fixing the subject variable: Make it a factor
total[,1] <- factor(total[,1])
### Fixing the activity and the subject variable: Give new names
names(total)[2] <- "activity_labels"
names(total)[1] <- "subject"


### create tidy dataset
tidy <- aggregate(.~ subject+ activity_labels, data=total, mean)

### remove and change invalid characters in variable names
names(tidy) <- gsub("\\()", "", names(tidy)) 
names(tidy) <- gsub("\\-","_", names(tidy))

write.table(tidy, file="tidy.txt", row.names=F)



