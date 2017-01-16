# Code book for Getting and Cleaning Data project
 - This is the code book for course project submission tidy data.

## Identifiers 

- features 
- activity_label  - Data frame to hold values from activity_labels.txt
- X_train - Data frame to hold values from X_train.txt
- Y_train - Data frame to hold values from y_train.txt
- X_test - Data frame to hold values from X_test.txt
- Y_test - Data frame to hold values from y_test.txt
- sub_train - Data frame to hold values from subject_train.txt
- sub_test - Data frame to hold values from subject_test.txt
- sub_data -  Data frame to hold values from sub_test & sub_train
- x_data - Data frame to hold values from X_test and X_train
- y_data - Data frame to hold values from Y_test and Y_train
- sub_act_data <- Data frame to hold values from sub_data and y_data
- data <- Data frame to hold values from sub_act_data and x_data
- data_mean_std - Data frame to hold mean and std function column values from data
- data_set_2 - Data frame to hold values from data_mean_std. Final dataset.

## Measurements

(A) Activity Labels
- act_id - Activity ID (1 to 6 for 6 activities)
- WALKING
- WALKING_UPSTAIRS
- WALKING_DOWNSTAIRS
- SITTING
- STANDING
- LAYING

(B) sub_id - Subject ID (1 to 30 for 30 participants / subjects)
       
