Code Book.
----------
The Code book presents information about the data set acquired of
<https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip > qwhich is the result of an experiment carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The data set contains the following files:

- 'README.txt'
- 'features_info.txt': Shows information about the variables used on the feature vector.
- 'features.txt': List of all features.
- 'activity_labels.txt': Links the class labels with their activity name.
- 'train/X_train.txt': Training set.
- 'train/y_train.txt': Training labels.
- 'test/X_test.txt': Test set.
- 'test/y_test.txt': Test labels.

The following files are available for the train and test data. Their descriptions are equivalent. 

- 'train/subject_train.txt': Each row identifies the subject who performed the activity for each window sample. Its range is from 1 to 30. 
- 'train/Inertial Signals/total_acc_x_train.txt': The acceleration signal from the smartphone accelerometer X axis in standard gravity units 'g'. 
- Every row shows a 128 element vector. The same description applies for the 
- 'total_acc_x_train.txt' and 'total_acc_z_train.txt' files for the Y and Z axis. 
- 'train/Inertial Signals/body_acc_x_train.txt': The body acceleration signal obtained by subtracting the gravity from the total acceleration.
- 'train/Inertial Signals/body_gyro_x_train.txt': The angular velocity vector measured by the gyroscope for each window sample. The units are radians/second. 


For each record in the dataset it is provided:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope.
- A 561-feature vector with time and frequency domain variables.
- Its activity label.
- An identifier of the subject who carried out the experiment. 

El Tidy Data contiene las siguientes variables, que fueron recogidas del dataset y procesadas:

1	ID.Subject
2	Activity
3	Time.Body.Acceleration.Mean.X
4	Time.Body.Acceleration.Mean.Y
5	Time.Body.Acceleration.Mean.Z
6	Time.Body.Acceleration.STD.X
7	Time.Body.Acceleration.STD.Y
8	Time.Body.Acceleration.STD.Z
9	Time.Gravity.Acceleration.Mean.X
10	Time.Gravity.Acceleration.Mean.Y
11	Time.Gravity.Acceleration.Mean.Z
12	Time.Gravity.Acceleration.STD.X
13	Time.Gravity.Acceleration.STD.Y
14	Time.Gravity.Acceleration.STD.Z
15	Time.Body.Acceleration.Jerk.Mean.X
16	Time.Body.Acceleration.Jerk.Mean.Y
17	Time.Body.Acceleration.Jerk.Mean.Z
18	Time.Body.Acceleration.Jerk.STD.X
19	Time.Body.Acceleration.Jerk.STD.Y
20	Time.Body.Acceleration.Jerk.STD.Z
21	Time.Body.Gyro.Mean.X
22	Time.Body.Gyro.Mean.Y
23	Time.Body.Gyro.Mean.Z
24	Time.Body.Gyro.STD.X
25	Time.Body.Gyro.STD.Y
26	Time.Body.Gyro.STD.Z
27	Time.Body.Gyro.Jerk.Mean.X
28	Time.Body.Gyro.Jerk.Mean.Y
29	Time.Body.Gyro.Jerk.Mean.Z
30	Time.Body.Gyro.Jerk.STD.X
31	Time.Body.Gyro.Jerk.STD.Y
32	Time.Body.Gyro.Jerk.STD.Z
33	Time.Body.Acceleration.Magnitude.Mean
34	Time.Body.Acceleration.Magnitude.STD
35	Time.Gravity.Acceleration.Magnitude.Mean
36	Time.Gravity.Acceleration.Magnitude.STD
37	Time.Body.Acceleration.Jerk.Magnitude.Mean
38	Time.Body.Acceleration.Jerk.Magnitude.STD
39	Time.Body.Gyro.Magnitude.Mean
40	Time.Body.Gyro.Magnitude.STD
41	Time.Body.Gyro.Jerk.Magnitude.Mean
42	Time.Body.Gyro.Jerk.Magnitude.STD
43	Freq.Body.Acceleration.Mean.X
44	Freq.Body.Acceleration.Mean.Y
45	Freq.Body.Acceleration.Mean.Z
46	Freq.Body.Acceleration.STD.X
47	Freq.Body.Acceleration.STD.Y
48	Freq.Body.Acceleration.STD.Z
49	Freq.Body.Acceleration.Jerk.Mean.X
50	Freq.Body.Acceleration.Jerk.Mean.Y
51	Freq.Body.Acceleration.Jerk.Mean.Z
52	Freq.Body.Acceleration.Jerk.STD.X
53	Freq.Body.Acceleration.Jerk.STD.Y
54	Freq.Body.Acceleration.Jerk.STD.Z
55	Freq.Body.Gyro.Mean.X
56	Freq.Body.Gyro.Mean.Y
57	Freq.Body.Gyro.Mean.Z
58	Freq.Body.Gyro.STD.X
59	Freq.Body.Gyro.STD.Y
60	Freq.Body.Gyro.STD.Z
61	Freq.Body.Acceleration.Magnitude.Mean
62	Freq.Body.Acceleration.Magnitude.STD
63	Freq.Body.Body.Acceleration.Jerk.Magnitude.Mean
64	Freq.Body.Body.Acceleration.Jerk.Magnitude.STD
65	Freq.Body.Body.Gyro.Magnitude.Mean
66	Freq.Body.Body.Gyro.Magnitude.STD
67	Freq.Body.Body.Gyro.Jerk.Magnitude.Mean
68	Freq.Body.Body.Gyro.Jerk.Magnitude.STD

Con una dimension de 10299 x 68

Del dataset se utilizaron los siguientes archivos:
features.txt
activity_labels.txt
subject_train.txt
X_train.txt
y_train.txt
subject_test.txt
X_test.txt
y_test.txt
