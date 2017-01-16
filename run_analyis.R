
## Removes all pre-existing variables. 
rm(list = ls())   

## Switch on different libraries
library("dplyr")
library("plyr")
library("tidyr")
library("reshape2") 

## Set working directory to preferred folder on Desktop

setwd('C:/Users/mhgandhi/Desktop/Data Science Specialization/
       Course 3 - Getting and Cleaning Data/Course Project')
getwd()

## Download file from link provided. Unzip file and put contents in the setwd() folder
file_url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
download.file(file_url,"Dataset.zip")
unz("Dataset.zip", exdir = "~/Course Project")  

## Reading features into a table.
## Variable name is same as the file from where it's read.
features <- read.table("features.txt")
head(features,10)
tail(features,10)

## Reading the 6 activity labels into a table.
activity_label <- read.table("activity_labels.txt")
head(activity_label,10)
tail(activity_label,10)

# head(),tail() and str() to get a preview of data.
X_train <- read.table("X_train.txt")
str(X_train)

Y_train <- read.table("y_train.txt")
head(Y_train,10)
tail(Y_train,10)

X_test <- read.table("X_test.txt")
str(X_test)

Y_test <- read.table("y_test.txt")
head(Y_test,10)
tail(Y_test,10)

sub_train <- read.table("subject_train.txt")
head(sub_train,10)
tail(sub_train,10)

sub_test <- read.table("subject_test.txt")
head(sub_test,10)
tail(sub_test,10)  # Reading complete.

## Question 1 ----- Merge training and test data into one dataset-----

## Combine test and training data using rbind. 
## Result is 3 tables with 10,299 rows each.
sub_data <- rbind(sub_test, sub_train)
x_data <- rbind(X_test, X_train)
y_data <- rbind(Y_test,Y_train)

## Re-name the above 3 tables and activity labels.
names(activity_label) <- c("act_id","activity")
names(sub_data) <- c("sub_id")
names(y_data) <- c("act_id")
## Using data from V2 column of features table as column names from x_data table.
names(x_data) <- features$V2  

## Combining 3 tables to create one data table. 
## Suject ID and Activity ID are first two columns. 
sub_act_data <- cbind(sub_data,y_data)
data <- cbind(sub_act_data, x_data)
str(data)   
#---Completes question 1---

## Question 2 ----- Extract ony mean() and sd() columns-----

## Indexing out columns that have only mean(), std() functions \n
## In addition to the first two columns.
data_mean_std <- data[,grepl("sub_id|act_id|mean\\()|std()", names(data))]
names(data_mean_std)   
#---Completes question 2---

## Question 3 ----- Use names from activity label dataset-----

## Using match to substitute numbers in second column with the values \n
## from the activity_label dataset.
data_mean_std$act_id <- activity_label[match(data_mean_std$act_id,activity_label$act_id),2]  
str(data_mean_std)
#---Completes question 3---


## Question 4 ----- Re-name labels-----
## Using gsub() to rename column header s
names(data_mean_std) <- gsub("^t","time",names(data_mean_std))
names(data_mean_std) <- gsub("^f","frequency",names(data_mean_std))
names(data_mean_std) <- gsub("BodyBody","Body",names(data_mean_std))
names(data_mean_std)   
#---Completes question 4---

## Question 5 ----- Create another tidy set that is mean of each column-----
## First group by subject id then by activity id
## Used summarize_each to calcualte mean on every column but subject and activity id
data_set_2 <- data_mean_std %>% group_by(sub_id,act_id) %>% summarise_each(funs(mean), -(sub_id:act_id))
str(data_set_2)
write.table(data_set_2,"tidy_data_2.txt")
#---Completes question 5---














