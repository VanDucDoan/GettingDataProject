Prepapre the data set
---------------------

    # directory for reading the data files
    trainingDataDir <- "./UCI\ HAR\ Dataset/train/"
    testingDataDir <- "./UCI\ HAR\ Dataset/test/"
    dataDir <- "./UCI\ HAR\ Dataset/"
    trainingInertDataDir <- "./UCI\ HAR\ Dataset/train/Inertial\ Signals/"
    testingInertDataDir <- "./UCI\ HAR\ Dataset/test/Inertial\ Signals/"

    # read data files
    # activity labels and features
    act_labs <- read.csv(paste(dataDir, "activity_labels.txt", sep = ""), header = FALSE, sep = "")
    fea_name <- read.csv(paste(dataDir, "features.txt", sep = ""), header = FALSE, sep = "") 

    #################################### read training data ######################################
    X_train <- read.csv(paste(trainingDataDir, "X_train.txt", sep = ""), header = FALSE, sep = "")
    y_train <- read.csv(paste(trainingDataDir, "y_train.txt", sep = ""), header = FALSE, sep = "")

    dim(X_train)

    ## [1] 7352  561

    dim(y_train)

    ## [1] 7352    1

    # subject
    subj_train <- read.csv(paste(trainingDataDir, "subject_train.txt", sep = ""), header = FALSE, sep = "")

    dim(subj_train)

    ## [1] 7352    1

    # other data
    # body acceleration x, y, z
    body_acc_x_train <- read.csv(paste(trainingInertDataDir, "body_acc_x_train.txt", sep = ""), header = FALSE, sep = "")
    body_acc_y_train <- read.csv(paste(trainingInertDataDir, "body_acc_y_train.txt", sep = ""), header = FALSE, sep = "")
    body_acc_z_train <- read.csv(paste(trainingInertDataDir, "body_acc_z_train.txt", sep = ""), header = FALSE, sep = "")

    dim(body_acc_x_train)

    ## [1] 7352  128

    dim(body_acc_y_train)

    ## [1] 7352  128

    dim(body_acc_z_train)

    ## [1] 7352  128

    # body gyro x, y, z
    body_gyro_x_train <- read.csv(paste(trainingInertDataDir, "body_gyro_x_train.txt", sep = ""), header = FALSE, sep = "")
    body_gyro_y_train <- read.csv(paste(trainingInertDataDir, "body_gyro_y_train.txt", sep = ""), header = FALSE, sep = "")
    body_gyro_z_train <- read.csv(paste(trainingInertDataDir, "body_gyro_z_train.txt", sep = ""), header = FALSE, sep = "")

    dim(body_gyro_x_train)

    ## [1] 7352  128

    dim(body_gyro_y_train)

    ## [1] 7352  128

    dim(body_gyro_z_train)

    ## [1] 7352  128

    # total acceleration x, y, z
    total_acc_x_train <- read.csv(paste(trainingInertDataDir, "total_acc_x_train.txt", sep = ""), header = FALSE, sep = "")
    total_acc_y_train <- read.csv(paste(trainingInertDataDir, "total_acc_y_train.txt", sep = ""), header = FALSE, sep = "")
    total_acc_z_train <- read.csv(paste(trainingInertDataDir, "total_acc_z_train.txt", sep = ""), header = FALSE, sep = "")

    dim(total_acc_x_train)

    ## [1] 7352  128

    dim(total_acc_y_train)

    ## [1] 7352  128

    dim(total_acc_z_train)

    ## [1] 7352  128

    #############################################################################################

    #################################### read testing data ######################################
    X_test <- read.csv(paste(testingDataDir, "X_test.txt", sep = ""), header = FALSE, sep = "")
    y_test <- read.csv(paste(testingDataDir, "y_test.txt", sep = ""), header = FALSE, sep = "")

    dim(X_test)

    ## [1] 2947  561

    dim(y_test)

    ## [1] 2947    1

    # subject
    subj_test <- read.csv(paste(testingDataDir, "subject_test.txt", sep = ""), header = FALSE, sep = "")

    dim(subj_test)

    ## [1] 2947    1

    # other data
    # body acceleration x, y, z
    body_acc_x_test <- read.csv(paste(testingInertDataDir, "body_acc_x_test.txt", sep = ""), header = FALSE, sep = "")
    body_acc_y_test <- read.csv(paste(testingInertDataDir, "body_acc_y_test.txt", sep = ""), header = FALSE, sep = "")
    body_acc_z_test <- read.csv(paste(testingInertDataDir, "body_acc_z_test.txt", sep = ""), header = FALSE, sep = "")

    dim(body_acc_x_test)

    ## [1] 2947  128

    dim(body_acc_y_test)

    ## [1] 2947  128

    dim(body_acc_z_test)

    ## [1] 2947  128

    # body gyro x, y, z
    body_gyro_x_test <- read.csv(paste(testingInertDataDir, "body_gyro_x_test.txt", sep = ""), header = FALSE, sep = "")
    body_gyro_y_test <- read.csv(paste(testingInertDataDir, "body_gyro_y_test.txt", sep = ""), header = FALSE, sep = "")
    body_gyro_z_test <- read.csv(paste(testingInertDataDir, "body_gyro_z_test.txt", sep = ""), header = FALSE, sep = "")

    dim(body_gyro_x_test)

    ## [1] 2947  128

    dim(body_gyro_y_test)

    ## [1] 2947  128

    dim(body_gyro_z_test)

    ## [1] 2947  128

    # total acceleration x, y, z
    total_acc_x_test <- read.csv(paste(testingInertDataDir, "total_acc_x_test.txt", sep = ""), header = FALSE, sep = "")
    total_acc_y_test <- read.csv(paste(testingInertDataDir, "total_acc_y_test.txt", sep = ""), header = FALSE, sep = "")
    total_acc_z_test <- read.csv(paste(testingInertDataDir, "total_acc_z_test.txt", sep = ""), header = FALSE, sep = "")

    dim(total_acc_x_test)

    ## [1] 2947  128

    dim(total_acc_y_test)

    ## [1] 2947  128

    dim(total_acc_z_test)

    ## [1] 2947  128

    ############################################################################################

(1) Merge the training and test data sets to create one data set
----------------------------------------------------------------

    ####################################################################
    # the data set for training and testing
    Xy_train <- cbind(X_train, c(subj_train, y_train))
    Xy_test <- cbind(X_test, c(subj_test, y_test))
    Xy_dataset <- rbind(Xy_train, Xy_test)
    dim(Xy_dataset)

    ## [1] 10299   563

    # body acc. x, y, z
    body_acc_x_data <- rbind(body_acc_x_train, body_acc_x_test)
    body_acc_y_data <- rbind(body_acc_y_train, body_acc_y_test)
    body_acc_z_data <- rbind(body_acc_z_train, body_acc_z_test)

    dim(body_acc_x_data)

    ## [1] 10299   128

    dim(body_acc_y_data)

    ## [1] 10299   128

    dim(body_acc_z_data)

    ## [1] 10299   128

    # body gyro. x, y, z
    body_gyro_x_data <- rbind(body_gyro_x_train, body_gyro_x_test)
    body_gyro_y_data <- rbind(body_gyro_y_train, body_gyro_y_test)
    body_gyro_z_data <- rbind(body_gyro_z_train, body_gyro_z_test)

    dim(body_gyro_x_data)

    ## [1] 10299   128

    dim(body_gyro_y_data)

    ## [1] 10299   128

    dim(body_gyro_z_data)

    ## [1] 10299   128

    # total acc. x, y, z
    total_acc_x_data <- rbind(total_acc_x_train, total_acc_x_test)
    total_acc_y_data <- rbind(total_acc_y_train, total_acc_y_test)
    total_acc_z_data <- rbind(total_acc_z_train, total_acc_z_test)

    dim(total_acc_x_data)

    ## [1] 10299   128

    dim(total_acc_y_data)

    ## [1] 10299   128

    dim(total_acc_z_data)

    ## [1] 10299   128

    ####################################################################

(2) (3) (4) Name columns for the data set and extracts only the measurements on the mean and standard deviation for each measurement
------------------------------------------------------------------------------------------------------------------------------------

    ####################################################################
    # names for data set 
    colnames(Xy_dataset) <-  c(as.character.factor(fea_name[, 2]), "subject", "activity")
    colnames(Xy_dataset)

    ##   [1] "tBodyAcc-mean()-X"                   
    ##   [2] "tBodyAcc-mean()-Y"                   
    ##   [3] "tBodyAcc-mean()-Z"                   
    ##   [4] "tBodyAcc-std()-X"                    
    ##   [5] "tBodyAcc-std()-Y"                    
    ##   [6] "tBodyAcc-std()-Z"                    
    ##   [7] "tBodyAcc-mad()-X"                    
    ##   [8] "tBodyAcc-mad()-Y"                    
    ##   [9] "tBodyAcc-mad()-Z"                    
    ##  [10] "tBodyAcc-max()-X"                    
    ##  [11] "tBodyAcc-max()-Y"                    
    ##  [12] "tBodyAcc-max()-Z"                    
    ##  [13] "tBodyAcc-min()-X"                    
    ##  [14] "tBodyAcc-min()-Y"                    
    ##  [15] "tBodyAcc-min()-Z"                    
    ##  [16] "tBodyAcc-sma()"                      
    ##  [17] "tBodyAcc-energy()-X"                 
    ##  [18] "tBodyAcc-energy()-Y"                 
    ##  [19] "tBodyAcc-energy()-Z"                 
    ##  [20] "tBodyAcc-iqr()-X"                    
    ##  [21] "tBodyAcc-iqr()-Y"                    
    ##  [22] "tBodyAcc-iqr()-Z"                    
    ##  [23] "tBodyAcc-entropy()-X"                
    ##  [24] "tBodyAcc-entropy()-Y"                
    ##  [25] "tBodyAcc-entropy()-Z"                
    ##  [26] "tBodyAcc-arCoeff()-X,1"              
    ##  [27] "tBodyAcc-arCoeff()-X,2"              
    ##  [28] "tBodyAcc-arCoeff()-X,3"              
    ##  [29] "tBodyAcc-arCoeff()-X,4"              
    ##  [30] "tBodyAcc-arCoeff()-Y,1"              
    ##  [31] "tBodyAcc-arCoeff()-Y,2"              
    ##  [32] "tBodyAcc-arCoeff()-Y,3"              
    ##  [33] "tBodyAcc-arCoeff()-Y,4"              
    ##  [34] "tBodyAcc-arCoeff()-Z,1"              
    ##  [35] "tBodyAcc-arCoeff()-Z,2"              
    ##  [36] "tBodyAcc-arCoeff()-Z,3"              
    ##  [37] "tBodyAcc-arCoeff()-Z,4"              
    ##  [38] "tBodyAcc-correlation()-X,Y"          
    ##  [39] "tBodyAcc-correlation()-X,Z"          
    ##  [40] "tBodyAcc-correlation()-Y,Z"          
    ##  [41] "tGravityAcc-mean()-X"                
    ##  [42] "tGravityAcc-mean()-Y"                
    ##  [43] "tGravityAcc-mean()-Z"                
    ##  [44] "tGravityAcc-std()-X"                 
    ##  [45] "tGravityAcc-std()-Y"                 
    ##  [46] "tGravityAcc-std()-Z"                 
    ##  [47] "tGravityAcc-mad()-X"                 
    ##  [48] "tGravityAcc-mad()-Y"                 
    ##  [49] "tGravityAcc-mad()-Z"                 
    ##  [50] "tGravityAcc-max()-X"                 
    ##  [51] "tGravityAcc-max()-Y"                 
    ##  [52] "tGravityAcc-max()-Z"                 
    ##  [53] "tGravityAcc-min()-X"                 
    ##  [54] "tGravityAcc-min()-Y"                 
    ##  [55] "tGravityAcc-min()-Z"                 
    ##  [56] "tGravityAcc-sma()"                   
    ##  [57] "tGravityAcc-energy()-X"              
    ##  [58] "tGravityAcc-energy()-Y"              
    ##  [59] "tGravityAcc-energy()-Z"              
    ##  [60] "tGravityAcc-iqr()-X"                 
    ##  [61] "tGravityAcc-iqr()-Y"                 
    ##  [62] "tGravityAcc-iqr()-Z"                 
    ##  [63] "tGravityAcc-entropy()-X"             
    ##  [64] "tGravityAcc-entropy()-Y"             
    ##  [65] "tGravityAcc-entropy()-Z"             
    ##  [66] "tGravityAcc-arCoeff()-X,1"           
    ##  [67] "tGravityAcc-arCoeff()-X,2"           
    ##  [68] "tGravityAcc-arCoeff()-X,3"           
    ##  [69] "tGravityAcc-arCoeff()-X,4"           
    ##  [70] "tGravityAcc-arCoeff()-Y,1"           
    ##  [71] "tGravityAcc-arCoeff()-Y,2"           
    ##  [72] "tGravityAcc-arCoeff()-Y,3"           
    ##  [73] "tGravityAcc-arCoeff()-Y,4"           
    ##  [74] "tGravityAcc-arCoeff()-Z,1"           
    ##  [75] "tGravityAcc-arCoeff()-Z,2"           
    ##  [76] "tGravityAcc-arCoeff()-Z,3"           
    ##  [77] "tGravityAcc-arCoeff()-Z,4"           
    ##  [78] "tGravityAcc-correlation()-X,Y"       
    ##  [79] "tGravityAcc-correlation()-X,Z"       
    ##  [80] "tGravityAcc-correlation()-Y,Z"       
    ##  [81] "tBodyAccJerk-mean()-X"               
    ##  [82] "tBodyAccJerk-mean()-Y"               
    ##  [83] "tBodyAccJerk-mean()-Z"               
    ##  [84] "tBodyAccJerk-std()-X"                
    ##  [85] "tBodyAccJerk-std()-Y"                
    ##  [86] "tBodyAccJerk-std()-Z"                
    ##  [87] "tBodyAccJerk-mad()-X"                
    ##  [88] "tBodyAccJerk-mad()-Y"                
    ##  [89] "tBodyAccJerk-mad()-Z"                
    ##  [90] "tBodyAccJerk-max()-X"                
    ##  [91] "tBodyAccJerk-max()-Y"                
    ##  [92] "tBodyAccJerk-max()-Z"                
    ##  [93] "tBodyAccJerk-min()-X"                
    ##  [94] "tBodyAccJerk-min()-Y"                
    ##  [95] "tBodyAccJerk-min()-Z"                
    ##  [96] "tBodyAccJerk-sma()"                  
    ##  [97] "tBodyAccJerk-energy()-X"             
    ##  [98] "tBodyAccJerk-energy()-Y"             
    ##  [99] "tBodyAccJerk-energy()-Z"             
    ## [100] "tBodyAccJerk-iqr()-X"                
    ## [101] "tBodyAccJerk-iqr()-Y"                
    ## [102] "tBodyAccJerk-iqr()-Z"                
    ## [103] "tBodyAccJerk-entropy()-X"            
    ## [104] "tBodyAccJerk-entropy()-Y"            
    ## [105] "tBodyAccJerk-entropy()-Z"            
    ## [106] "tBodyAccJerk-arCoeff()-X,1"          
    ## [107] "tBodyAccJerk-arCoeff()-X,2"          
    ## [108] "tBodyAccJerk-arCoeff()-X,3"          
    ## [109] "tBodyAccJerk-arCoeff()-X,4"          
    ## [110] "tBodyAccJerk-arCoeff()-Y,1"          
    ## [111] "tBodyAccJerk-arCoeff()-Y,2"          
    ## [112] "tBodyAccJerk-arCoeff()-Y,3"          
    ## [113] "tBodyAccJerk-arCoeff()-Y,4"          
    ## [114] "tBodyAccJerk-arCoeff()-Z,1"          
    ## [115] "tBodyAccJerk-arCoeff()-Z,2"          
    ## [116] "tBodyAccJerk-arCoeff()-Z,3"          
    ## [117] "tBodyAccJerk-arCoeff()-Z,4"          
    ## [118] "tBodyAccJerk-correlation()-X,Y"      
    ## [119] "tBodyAccJerk-correlation()-X,Z"      
    ## [120] "tBodyAccJerk-correlation()-Y,Z"      
    ## [121] "tBodyGyro-mean()-X"                  
    ## [122] "tBodyGyro-mean()-Y"                  
    ## [123] "tBodyGyro-mean()-Z"                  
    ## [124] "tBodyGyro-std()-X"                   
    ## [125] "tBodyGyro-std()-Y"                   
    ## [126] "tBodyGyro-std()-Z"                   
    ## [127] "tBodyGyro-mad()-X"                   
    ## [128] "tBodyGyro-mad()-Y"                   
    ## [129] "tBodyGyro-mad()-Z"                   
    ## [130] "tBodyGyro-max()-X"                   
    ## [131] "tBodyGyro-max()-Y"                   
    ## [132] "tBodyGyro-max()-Z"                   
    ## [133] "tBodyGyro-min()-X"                   
    ## [134] "tBodyGyro-min()-Y"                   
    ## [135] "tBodyGyro-min()-Z"                   
    ## [136] "tBodyGyro-sma()"                     
    ## [137] "tBodyGyro-energy()-X"                
    ## [138] "tBodyGyro-energy()-Y"                
    ## [139] "tBodyGyro-energy()-Z"                
    ## [140] "tBodyGyro-iqr()-X"                   
    ## [141] "tBodyGyro-iqr()-Y"                   
    ## [142] "tBodyGyro-iqr()-Z"                   
    ## [143] "tBodyGyro-entropy()-X"               
    ## [144] "tBodyGyro-entropy()-Y"               
    ## [145] "tBodyGyro-entropy()-Z"               
    ## [146] "tBodyGyro-arCoeff()-X,1"             
    ## [147] "tBodyGyro-arCoeff()-X,2"             
    ## [148] "tBodyGyro-arCoeff()-X,3"             
    ## [149] "tBodyGyro-arCoeff()-X,4"             
    ## [150] "tBodyGyro-arCoeff()-Y,1"             
    ## [151] "tBodyGyro-arCoeff()-Y,2"             
    ## [152] "tBodyGyro-arCoeff()-Y,3"             
    ## [153] "tBodyGyro-arCoeff()-Y,4"             
    ## [154] "tBodyGyro-arCoeff()-Z,1"             
    ## [155] "tBodyGyro-arCoeff()-Z,2"             
    ## [156] "tBodyGyro-arCoeff()-Z,3"             
    ## [157] "tBodyGyro-arCoeff()-Z,4"             
    ## [158] "tBodyGyro-correlation()-X,Y"         
    ## [159] "tBodyGyro-correlation()-X,Z"         
    ## [160] "tBodyGyro-correlation()-Y,Z"         
    ## [161] "tBodyGyroJerk-mean()-X"              
    ## [162] "tBodyGyroJerk-mean()-Y"              
    ## [163] "tBodyGyroJerk-mean()-Z"              
    ## [164] "tBodyGyroJerk-std()-X"               
    ## [165] "tBodyGyroJerk-std()-Y"               
    ## [166] "tBodyGyroJerk-std()-Z"               
    ## [167] "tBodyGyroJerk-mad()-X"               
    ## [168] "tBodyGyroJerk-mad()-Y"               
    ## [169] "tBodyGyroJerk-mad()-Z"               
    ## [170] "tBodyGyroJerk-max()-X"               
    ## [171] "tBodyGyroJerk-max()-Y"               
    ## [172] "tBodyGyroJerk-max()-Z"               
    ## [173] "tBodyGyroJerk-min()-X"               
    ## [174] "tBodyGyroJerk-min()-Y"               
    ## [175] "tBodyGyroJerk-min()-Z"               
    ## [176] "tBodyGyroJerk-sma()"                 
    ## [177] "tBodyGyroJerk-energy()-X"            
    ## [178] "tBodyGyroJerk-energy()-Y"            
    ## [179] "tBodyGyroJerk-energy()-Z"            
    ## [180] "tBodyGyroJerk-iqr()-X"               
    ## [181] "tBodyGyroJerk-iqr()-Y"               
    ## [182] "tBodyGyroJerk-iqr()-Z"               
    ## [183] "tBodyGyroJerk-entropy()-X"           
    ## [184] "tBodyGyroJerk-entropy()-Y"           
    ## [185] "tBodyGyroJerk-entropy()-Z"           
    ## [186] "tBodyGyroJerk-arCoeff()-X,1"         
    ## [187] "tBodyGyroJerk-arCoeff()-X,2"         
    ## [188] "tBodyGyroJerk-arCoeff()-X,3"         
    ## [189] "tBodyGyroJerk-arCoeff()-X,4"         
    ## [190] "tBodyGyroJerk-arCoeff()-Y,1"         
    ## [191] "tBodyGyroJerk-arCoeff()-Y,2"         
    ## [192] "tBodyGyroJerk-arCoeff()-Y,3"         
    ## [193] "tBodyGyroJerk-arCoeff()-Y,4"         
    ## [194] "tBodyGyroJerk-arCoeff()-Z,1"         
    ## [195] "tBodyGyroJerk-arCoeff()-Z,2"         
    ## [196] "tBodyGyroJerk-arCoeff()-Z,3"         
    ## [197] "tBodyGyroJerk-arCoeff()-Z,4"         
    ## [198] "tBodyGyroJerk-correlation()-X,Y"     
    ## [199] "tBodyGyroJerk-correlation()-X,Z"     
    ## [200] "tBodyGyroJerk-correlation()-Y,Z"     
    ## [201] "tBodyAccMag-mean()"                  
    ## [202] "tBodyAccMag-std()"                   
    ## [203] "tBodyAccMag-mad()"                   
    ## [204] "tBodyAccMag-max()"                   
    ## [205] "tBodyAccMag-min()"                   
    ## [206] "tBodyAccMag-sma()"                   
    ## [207] "tBodyAccMag-energy()"                
    ## [208] "tBodyAccMag-iqr()"                   
    ## [209] "tBodyAccMag-entropy()"               
    ## [210] "tBodyAccMag-arCoeff()1"              
    ## [211] "tBodyAccMag-arCoeff()2"              
    ## [212] "tBodyAccMag-arCoeff()3"              
    ## [213] "tBodyAccMag-arCoeff()4"              
    ## [214] "tGravityAccMag-mean()"               
    ## [215] "tGravityAccMag-std()"                
    ## [216] "tGravityAccMag-mad()"                
    ## [217] "tGravityAccMag-max()"                
    ## [218] "tGravityAccMag-min()"                
    ## [219] "tGravityAccMag-sma()"                
    ## [220] "tGravityAccMag-energy()"             
    ## [221] "tGravityAccMag-iqr()"                
    ## [222] "tGravityAccMag-entropy()"            
    ## [223] "tGravityAccMag-arCoeff()1"           
    ## [224] "tGravityAccMag-arCoeff()2"           
    ## [225] "tGravityAccMag-arCoeff()3"           
    ## [226] "tGravityAccMag-arCoeff()4"           
    ## [227] "tBodyAccJerkMag-mean()"              
    ## [228] "tBodyAccJerkMag-std()"               
    ## [229] "tBodyAccJerkMag-mad()"               
    ## [230] "tBodyAccJerkMag-max()"               
    ## [231] "tBodyAccJerkMag-min()"               
    ## [232] "tBodyAccJerkMag-sma()"               
    ## [233] "tBodyAccJerkMag-energy()"            
    ## [234] "tBodyAccJerkMag-iqr()"               
    ## [235] "tBodyAccJerkMag-entropy()"           
    ## [236] "tBodyAccJerkMag-arCoeff()1"          
    ## [237] "tBodyAccJerkMag-arCoeff()2"          
    ## [238] "tBodyAccJerkMag-arCoeff()3"          
    ## [239] "tBodyAccJerkMag-arCoeff()4"          
    ## [240] "tBodyGyroMag-mean()"                 
    ## [241] "tBodyGyroMag-std()"                  
    ## [242] "tBodyGyroMag-mad()"                  
    ## [243] "tBodyGyroMag-max()"                  
    ## [244] "tBodyGyroMag-min()"                  
    ## [245] "tBodyGyroMag-sma()"                  
    ## [246] "tBodyGyroMag-energy()"               
    ## [247] "tBodyGyroMag-iqr()"                  
    ## [248] "tBodyGyroMag-entropy()"              
    ## [249] "tBodyGyroMag-arCoeff()1"             
    ## [250] "tBodyGyroMag-arCoeff()2"             
    ## [251] "tBodyGyroMag-arCoeff()3"             
    ## [252] "tBodyGyroMag-arCoeff()4"             
    ## [253] "tBodyGyroJerkMag-mean()"             
    ## [254] "tBodyGyroJerkMag-std()"              
    ## [255] "tBodyGyroJerkMag-mad()"              
    ## [256] "tBodyGyroJerkMag-max()"              
    ## [257] "tBodyGyroJerkMag-min()"              
    ## [258] "tBodyGyroJerkMag-sma()"              
    ## [259] "tBodyGyroJerkMag-energy()"           
    ## [260] "tBodyGyroJerkMag-iqr()"              
    ## [261] "tBodyGyroJerkMag-entropy()"          
    ## [262] "tBodyGyroJerkMag-arCoeff()1"         
    ## [263] "tBodyGyroJerkMag-arCoeff()2"         
    ## [264] "tBodyGyroJerkMag-arCoeff()3"         
    ## [265] "tBodyGyroJerkMag-arCoeff()4"         
    ## [266] "fBodyAcc-mean()-X"                   
    ## [267] "fBodyAcc-mean()-Y"                   
    ## [268] "fBodyAcc-mean()-Z"                   
    ## [269] "fBodyAcc-std()-X"                    
    ## [270] "fBodyAcc-std()-Y"                    
    ## [271] "fBodyAcc-std()-Z"                    
    ## [272] "fBodyAcc-mad()-X"                    
    ## [273] "fBodyAcc-mad()-Y"                    
    ## [274] "fBodyAcc-mad()-Z"                    
    ## [275] "fBodyAcc-max()-X"                    
    ## [276] "fBodyAcc-max()-Y"                    
    ## [277] "fBodyAcc-max()-Z"                    
    ## [278] "fBodyAcc-min()-X"                    
    ## [279] "fBodyAcc-min()-Y"                    
    ## [280] "fBodyAcc-min()-Z"                    
    ## [281] "fBodyAcc-sma()"                      
    ## [282] "fBodyAcc-energy()-X"                 
    ## [283] "fBodyAcc-energy()-Y"                 
    ## [284] "fBodyAcc-energy()-Z"                 
    ## [285] "fBodyAcc-iqr()-X"                    
    ## [286] "fBodyAcc-iqr()-Y"                    
    ## [287] "fBodyAcc-iqr()-Z"                    
    ## [288] "fBodyAcc-entropy()-X"                
    ## [289] "fBodyAcc-entropy()-Y"                
    ## [290] "fBodyAcc-entropy()-Z"                
    ## [291] "fBodyAcc-maxInds-X"                  
    ## [292] "fBodyAcc-maxInds-Y"                  
    ## [293] "fBodyAcc-maxInds-Z"                  
    ## [294] "fBodyAcc-meanFreq()-X"               
    ## [295] "fBodyAcc-meanFreq()-Y"               
    ## [296] "fBodyAcc-meanFreq()-Z"               
    ## [297] "fBodyAcc-skewness()-X"               
    ## [298] "fBodyAcc-kurtosis()-X"               
    ## [299] "fBodyAcc-skewness()-Y"               
    ## [300] "fBodyAcc-kurtosis()-Y"               
    ## [301] "fBodyAcc-skewness()-Z"               
    ## [302] "fBodyAcc-kurtosis()-Z"               
    ## [303] "fBodyAcc-bandsEnergy()-1,8"          
    ## [304] "fBodyAcc-bandsEnergy()-9,16"         
    ## [305] "fBodyAcc-bandsEnergy()-17,24"        
    ## [306] "fBodyAcc-bandsEnergy()-25,32"        
    ## [307] "fBodyAcc-bandsEnergy()-33,40"        
    ## [308] "fBodyAcc-bandsEnergy()-41,48"        
    ## [309] "fBodyAcc-bandsEnergy()-49,56"        
    ## [310] "fBodyAcc-bandsEnergy()-57,64"        
    ## [311] "fBodyAcc-bandsEnergy()-1,16"         
    ## [312] "fBodyAcc-bandsEnergy()-17,32"        
    ## [313] "fBodyAcc-bandsEnergy()-33,48"        
    ## [314] "fBodyAcc-bandsEnergy()-49,64"        
    ## [315] "fBodyAcc-bandsEnergy()-1,24"         
    ## [316] "fBodyAcc-bandsEnergy()-25,48"        
    ## [317] "fBodyAcc-bandsEnergy()-1,8"          
    ## [318] "fBodyAcc-bandsEnergy()-9,16"         
    ## [319] "fBodyAcc-bandsEnergy()-17,24"        
    ## [320] "fBodyAcc-bandsEnergy()-25,32"        
    ## [321] "fBodyAcc-bandsEnergy()-33,40"        
    ## [322] "fBodyAcc-bandsEnergy()-41,48"        
    ## [323] "fBodyAcc-bandsEnergy()-49,56"        
    ## [324] "fBodyAcc-bandsEnergy()-57,64"        
    ## [325] "fBodyAcc-bandsEnergy()-1,16"         
    ## [326] "fBodyAcc-bandsEnergy()-17,32"        
    ## [327] "fBodyAcc-bandsEnergy()-33,48"        
    ## [328] "fBodyAcc-bandsEnergy()-49,64"        
    ## [329] "fBodyAcc-bandsEnergy()-1,24"         
    ## [330] "fBodyAcc-bandsEnergy()-25,48"        
    ## [331] "fBodyAcc-bandsEnergy()-1,8"          
    ## [332] "fBodyAcc-bandsEnergy()-9,16"         
    ## [333] "fBodyAcc-bandsEnergy()-17,24"        
    ## [334] "fBodyAcc-bandsEnergy()-25,32"        
    ## [335] "fBodyAcc-bandsEnergy()-33,40"        
    ## [336] "fBodyAcc-bandsEnergy()-41,48"        
    ## [337] "fBodyAcc-bandsEnergy()-49,56"        
    ## [338] "fBodyAcc-bandsEnergy()-57,64"        
    ## [339] "fBodyAcc-bandsEnergy()-1,16"         
    ## [340] "fBodyAcc-bandsEnergy()-17,32"        
    ## [341] "fBodyAcc-bandsEnergy()-33,48"        
    ## [342] "fBodyAcc-bandsEnergy()-49,64"        
    ## [343] "fBodyAcc-bandsEnergy()-1,24"         
    ## [344] "fBodyAcc-bandsEnergy()-25,48"        
    ## [345] "fBodyAccJerk-mean()-X"               
    ## [346] "fBodyAccJerk-mean()-Y"               
    ## [347] "fBodyAccJerk-mean()-Z"               
    ## [348] "fBodyAccJerk-std()-X"                
    ## [349] "fBodyAccJerk-std()-Y"                
    ## [350] "fBodyAccJerk-std()-Z"                
    ## [351] "fBodyAccJerk-mad()-X"                
    ## [352] "fBodyAccJerk-mad()-Y"                
    ## [353] "fBodyAccJerk-mad()-Z"                
    ## [354] "fBodyAccJerk-max()-X"                
    ## [355] "fBodyAccJerk-max()-Y"                
    ## [356] "fBodyAccJerk-max()-Z"                
    ## [357] "fBodyAccJerk-min()-X"                
    ## [358] "fBodyAccJerk-min()-Y"                
    ## [359] "fBodyAccJerk-min()-Z"                
    ## [360] "fBodyAccJerk-sma()"                  
    ## [361] "fBodyAccJerk-energy()-X"             
    ## [362] "fBodyAccJerk-energy()-Y"             
    ## [363] "fBodyAccJerk-energy()-Z"             
    ## [364] "fBodyAccJerk-iqr()-X"                
    ## [365] "fBodyAccJerk-iqr()-Y"                
    ## [366] "fBodyAccJerk-iqr()-Z"                
    ## [367] "fBodyAccJerk-entropy()-X"            
    ## [368] "fBodyAccJerk-entropy()-Y"            
    ## [369] "fBodyAccJerk-entropy()-Z"            
    ## [370] "fBodyAccJerk-maxInds-X"              
    ## [371] "fBodyAccJerk-maxInds-Y"              
    ## [372] "fBodyAccJerk-maxInds-Z"              
    ## [373] "fBodyAccJerk-meanFreq()-X"           
    ## [374] "fBodyAccJerk-meanFreq()-Y"           
    ## [375] "fBodyAccJerk-meanFreq()-Z"           
    ## [376] "fBodyAccJerk-skewness()-X"           
    ## [377] "fBodyAccJerk-kurtosis()-X"           
    ## [378] "fBodyAccJerk-skewness()-Y"           
    ## [379] "fBodyAccJerk-kurtosis()-Y"           
    ## [380] "fBodyAccJerk-skewness()-Z"           
    ## [381] "fBodyAccJerk-kurtosis()-Z"           
    ## [382] "fBodyAccJerk-bandsEnergy()-1,8"      
    ## [383] "fBodyAccJerk-bandsEnergy()-9,16"     
    ## [384] "fBodyAccJerk-bandsEnergy()-17,24"    
    ## [385] "fBodyAccJerk-bandsEnergy()-25,32"    
    ## [386] "fBodyAccJerk-bandsEnergy()-33,40"    
    ## [387] "fBodyAccJerk-bandsEnergy()-41,48"    
    ## [388] "fBodyAccJerk-bandsEnergy()-49,56"    
    ## [389] "fBodyAccJerk-bandsEnergy()-57,64"    
    ## [390] "fBodyAccJerk-bandsEnergy()-1,16"     
    ## [391] "fBodyAccJerk-bandsEnergy()-17,32"    
    ## [392] "fBodyAccJerk-bandsEnergy()-33,48"    
    ## [393] "fBodyAccJerk-bandsEnergy()-49,64"    
    ## [394] "fBodyAccJerk-bandsEnergy()-1,24"     
    ## [395] "fBodyAccJerk-bandsEnergy()-25,48"    
    ## [396] "fBodyAccJerk-bandsEnergy()-1,8"      
    ## [397] "fBodyAccJerk-bandsEnergy()-9,16"     
    ## [398] "fBodyAccJerk-bandsEnergy()-17,24"    
    ## [399] "fBodyAccJerk-bandsEnergy()-25,32"    
    ## [400] "fBodyAccJerk-bandsEnergy()-33,40"    
    ## [401] "fBodyAccJerk-bandsEnergy()-41,48"    
    ## [402] "fBodyAccJerk-bandsEnergy()-49,56"    
    ## [403] "fBodyAccJerk-bandsEnergy()-57,64"    
    ## [404] "fBodyAccJerk-bandsEnergy()-1,16"     
    ## [405] "fBodyAccJerk-bandsEnergy()-17,32"    
    ## [406] "fBodyAccJerk-bandsEnergy()-33,48"    
    ## [407] "fBodyAccJerk-bandsEnergy()-49,64"    
    ## [408] "fBodyAccJerk-bandsEnergy()-1,24"     
    ## [409] "fBodyAccJerk-bandsEnergy()-25,48"    
    ## [410] "fBodyAccJerk-bandsEnergy()-1,8"      
    ## [411] "fBodyAccJerk-bandsEnergy()-9,16"     
    ## [412] "fBodyAccJerk-bandsEnergy()-17,24"    
    ## [413] "fBodyAccJerk-bandsEnergy()-25,32"    
    ## [414] "fBodyAccJerk-bandsEnergy()-33,40"    
    ## [415] "fBodyAccJerk-bandsEnergy()-41,48"    
    ## [416] "fBodyAccJerk-bandsEnergy()-49,56"    
    ## [417] "fBodyAccJerk-bandsEnergy()-57,64"    
    ## [418] "fBodyAccJerk-bandsEnergy()-1,16"     
    ## [419] "fBodyAccJerk-bandsEnergy()-17,32"    
    ## [420] "fBodyAccJerk-bandsEnergy()-33,48"    
    ## [421] "fBodyAccJerk-bandsEnergy()-49,64"    
    ## [422] "fBodyAccJerk-bandsEnergy()-1,24"     
    ## [423] "fBodyAccJerk-bandsEnergy()-25,48"    
    ## [424] "fBodyGyro-mean()-X"                  
    ## [425] "fBodyGyro-mean()-Y"                  
    ## [426] "fBodyGyro-mean()-Z"                  
    ## [427] "fBodyGyro-std()-X"                   
    ## [428] "fBodyGyro-std()-Y"                   
    ## [429] "fBodyGyro-std()-Z"                   
    ## [430] "fBodyGyro-mad()-X"                   
    ## [431] "fBodyGyro-mad()-Y"                   
    ## [432] "fBodyGyro-mad()-Z"                   
    ## [433] "fBodyGyro-max()-X"                   
    ## [434] "fBodyGyro-max()-Y"                   
    ## [435] "fBodyGyro-max()-Z"                   
    ## [436] "fBodyGyro-min()-X"                   
    ## [437] "fBodyGyro-min()-Y"                   
    ## [438] "fBodyGyro-min()-Z"                   
    ## [439] "fBodyGyro-sma()"                     
    ## [440] "fBodyGyro-energy()-X"                
    ## [441] "fBodyGyro-energy()-Y"                
    ## [442] "fBodyGyro-energy()-Z"                
    ## [443] "fBodyGyro-iqr()-X"                   
    ## [444] "fBodyGyro-iqr()-Y"                   
    ## [445] "fBodyGyro-iqr()-Z"                   
    ## [446] "fBodyGyro-entropy()-X"               
    ## [447] "fBodyGyro-entropy()-Y"               
    ## [448] "fBodyGyro-entropy()-Z"               
    ## [449] "fBodyGyro-maxInds-X"                 
    ## [450] "fBodyGyro-maxInds-Y"                 
    ## [451] "fBodyGyro-maxInds-Z"                 
    ## [452] "fBodyGyro-meanFreq()-X"              
    ## [453] "fBodyGyro-meanFreq()-Y"              
    ## [454] "fBodyGyro-meanFreq()-Z"              
    ## [455] "fBodyGyro-skewness()-X"              
    ## [456] "fBodyGyro-kurtosis()-X"              
    ## [457] "fBodyGyro-skewness()-Y"              
    ## [458] "fBodyGyro-kurtosis()-Y"              
    ## [459] "fBodyGyro-skewness()-Z"              
    ## [460] "fBodyGyro-kurtosis()-Z"              
    ## [461] "fBodyGyro-bandsEnergy()-1,8"         
    ## [462] "fBodyGyro-bandsEnergy()-9,16"        
    ## [463] "fBodyGyro-bandsEnergy()-17,24"       
    ## [464] "fBodyGyro-bandsEnergy()-25,32"       
    ## [465] "fBodyGyro-bandsEnergy()-33,40"       
    ## [466] "fBodyGyro-bandsEnergy()-41,48"       
    ## [467] "fBodyGyro-bandsEnergy()-49,56"       
    ## [468] "fBodyGyro-bandsEnergy()-57,64"       
    ## [469] "fBodyGyro-bandsEnergy()-1,16"        
    ## [470] "fBodyGyro-bandsEnergy()-17,32"       
    ## [471] "fBodyGyro-bandsEnergy()-33,48"       
    ## [472] "fBodyGyro-bandsEnergy()-49,64"       
    ## [473] "fBodyGyro-bandsEnergy()-1,24"        
    ## [474] "fBodyGyro-bandsEnergy()-25,48"       
    ## [475] "fBodyGyro-bandsEnergy()-1,8"         
    ## [476] "fBodyGyro-bandsEnergy()-9,16"        
    ## [477] "fBodyGyro-bandsEnergy()-17,24"       
    ## [478] "fBodyGyro-bandsEnergy()-25,32"       
    ## [479] "fBodyGyro-bandsEnergy()-33,40"       
    ## [480] "fBodyGyro-bandsEnergy()-41,48"       
    ## [481] "fBodyGyro-bandsEnergy()-49,56"       
    ## [482] "fBodyGyro-bandsEnergy()-57,64"       
    ## [483] "fBodyGyro-bandsEnergy()-1,16"        
    ## [484] "fBodyGyro-bandsEnergy()-17,32"       
    ## [485] "fBodyGyro-bandsEnergy()-33,48"       
    ## [486] "fBodyGyro-bandsEnergy()-49,64"       
    ## [487] "fBodyGyro-bandsEnergy()-1,24"        
    ## [488] "fBodyGyro-bandsEnergy()-25,48"       
    ## [489] "fBodyGyro-bandsEnergy()-1,8"         
    ## [490] "fBodyGyro-bandsEnergy()-9,16"        
    ## [491] "fBodyGyro-bandsEnergy()-17,24"       
    ## [492] "fBodyGyro-bandsEnergy()-25,32"       
    ## [493] "fBodyGyro-bandsEnergy()-33,40"       
    ## [494] "fBodyGyro-bandsEnergy()-41,48"       
    ## [495] "fBodyGyro-bandsEnergy()-49,56"       
    ## [496] "fBodyGyro-bandsEnergy()-57,64"       
    ## [497] "fBodyGyro-bandsEnergy()-1,16"        
    ## [498] "fBodyGyro-bandsEnergy()-17,32"       
    ## [499] "fBodyGyro-bandsEnergy()-33,48"       
    ## [500] "fBodyGyro-bandsEnergy()-49,64"       
    ## [501] "fBodyGyro-bandsEnergy()-1,24"        
    ## [502] "fBodyGyro-bandsEnergy()-25,48"       
    ## [503] "fBodyAccMag-mean()"                  
    ## [504] "fBodyAccMag-std()"                   
    ## [505] "fBodyAccMag-mad()"                   
    ## [506] "fBodyAccMag-max()"                   
    ## [507] "fBodyAccMag-min()"                   
    ## [508] "fBodyAccMag-sma()"                   
    ## [509] "fBodyAccMag-energy()"                
    ## [510] "fBodyAccMag-iqr()"                   
    ## [511] "fBodyAccMag-entropy()"               
    ## [512] "fBodyAccMag-maxInds"                 
    ## [513] "fBodyAccMag-meanFreq()"              
    ## [514] "fBodyAccMag-skewness()"              
    ## [515] "fBodyAccMag-kurtosis()"              
    ## [516] "fBodyBodyAccJerkMag-mean()"          
    ## [517] "fBodyBodyAccJerkMag-std()"           
    ## [518] "fBodyBodyAccJerkMag-mad()"           
    ## [519] "fBodyBodyAccJerkMag-max()"           
    ## [520] "fBodyBodyAccJerkMag-min()"           
    ## [521] "fBodyBodyAccJerkMag-sma()"           
    ## [522] "fBodyBodyAccJerkMag-energy()"        
    ## [523] "fBodyBodyAccJerkMag-iqr()"           
    ## [524] "fBodyBodyAccJerkMag-entropy()"       
    ## [525] "fBodyBodyAccJerkMag-maxInds"         
    ## [526] "fBodyBodyAccJerkMag-meanFreq()"      
    ## [527] "fBodyBodyAccJerkMag-skewness()"      
    ## [528] "fBodyBodyAccJerkMag-kurtosis()"      
    ## [529] "fBodyBodyGyroMag-mean()"             
    ## [530] "fBodyBodyGyroMag-std()"              
    ## [531] "fBodyBodyGyroMag-mad()"              
    ## [532] "fBodyBodyGyroMag-max()"              
    ## [533] "fBodyBodyGyroMag-min()"              
    ## [534] "fBodyBodyGyroMag-sma()"              
    ## [535] "fBodyBodyGyroMag-energy()"           
    ## [536] "fBodyBodyGyroMag-iqr()"              
    ## [537] "fBodyBodyGyroMag-entropy()"          
    ## [538] "fBodyBodyGyroMag-maxInds"            
    ## [539] "fBodyBodyGyroMag-meanFreq()"         
    ## [540] "fBodyBodyGyroMag-skewness()"         
    ## [541] "fBodyBodyGyroMag-kurtosis()"         
    ## [542] "fBodyBodyGyroJerkMag-mean()"         
    ## [543] "fBodyBodyGyroJerkMag-std()"          
    ## [544] "fBodyBodyGyroJerkMag-mad()"          
    ## [545] "fBodyBodyGyroJerkMag-max()"          
    ## [546] "fBodyBodyGyroJerkMag-min()"          
    ## [547] "fBodyBodyGyroJerkMag-sma()"          
    ## [548] "fBodyBodyGyroJerkMag-energy()"       
    ## [549] "fBodyBodyGyroJerkMag-iqr()"          
    ## [550] "fBodyBodyGyroJerkMag-entropy()"      
    ## [551] "fBodyBodyGyroJerkMag-maxInds"        
    ## [552] "fBodyBodyGyroJerkMag-meanFreq()"     
    ## [553] "fBodyBodyGyroJerkMag-skewness()"     
    ## [554] "fBodyBodyGyroJerkMag-kurtosis()"     
    ## [555] "angle(tBodyAccMean,gravity)"         
    ## [556] "angle(tBodyAccJerkMean),gravityMean)"
    ## [557] "angle(tBodyGyroMean,gravityMean)"    
    ## [558] "angle(tBodyGyroJerkMean,gravityMean)"
    ## [559] "angle(X,gravityMean)"                
    ## [560] "angle(Y,gravityMean)"                
    ## [561] "angle(Z,gravityMean)"                
    ## [562] "subject"                             
    ## [563] "activity"

    # transform the column data in 'subject' and 'activity' to factor
    Xy_dataset[, c("subject")] <- factor(Xy_dataset[, c("subject")])
    Xy_dataset[, c("activity")] <- factor(Xy_dataset[, c("activity")])

    # extracts the measurements on the mean and deviation
    mean_std_data <- Xy_dataset[, grepl("mean", tolower(colnames(Xy_dataset))) | 
                                    grepl("std", tolower(colnames(Xy_dataset))) == TRUE]
    colnames(mean_std_data)

    ##  [1] "tBodyAcc-mean()-X"                   
    ##  [2] "tBodyAcc-mean()-Y"                   
    ##  [3] "tBodyAcc-mean()-Z"                   
    ##  [4] "tBodyAcc-std()-X"                    
    ##  [5] "tBodyAcc-std()-Y"                    
    ##  [6] "tBodyAcc-std()-Z"                    
    ##  [7] "tGravityAcc-mean()-X"                
    ##  [8] "tGravityAcc-mean()-Y"                
    ##  [9] "tGravityAcc-mean()-Z"                
    ## [10] "tGravityAcc-std()-X"                 
    ## [11] "tGravityAcc-std()-Y"                 
    ## [12] "tGravityAcc-std()-Z"                 
    ## [13] "tBodyAccJerk-mean()-X"               
    ## [14] "tBodyAccJerk-mean()-Y"               
    ## [15] "tBodyAccJerk-mean()-Z"               
    ## [16] "tBodyAccJerk-std()-X"                
    ## [17] "tBodyAccJerk-std()-Y"                
    ## [18] "tBodyAccJerk-std()-Z"                
    ## [19] "tBodyGyro-mean()-X"                  
    ## [20] "tBodyGyro-mean()-Y"                  
    ## [21] "tBodyGyro-mean()-Z"                  
    ## [22] "tBodyGyro-std()-X"                   
    ## [23] "tBodyGyro-std()-Y"                   
    ## [24] "tBodyGyro-std()-Z"                   
    ## [25] "tBodyGyroJerk-mean()-X"              
    ## [26] "tBodyGyroJerk-mean()-Y"              
    ## [27] "tBodyGyroJerk-mean()-Z"              
    ## [28] "tBodyGyroJerk-std()-X"               
    ## [29] "tBodyGyroJerk-std()-Y"               
    ## [30] "tBodyGyroJerk-std()-Z"               
    ## [31] "tBodyAccMag-mean()"                  
    ## [32] "tBodyAccMag-std()"                   
    ## [33] "tGravityAccMag-mean()"               
    ## [34] "tGravityAccMag-std()"                
    ## [35] "tBodyAccJerkMag-mean()"              
    ## [36] "tBodyAccJerkMag-std()"               
    ## [37] "tBodyGyroMag-mean()"                 
    ## [38] "tBodyGyroMag-std()"                  
    ## [39] "tBodyGyroJerkMag-mean()"             
    ## [40] "tBodyGyroJerkMag-std()"              
    ## [41] "fBodyAcc-mean()-X"                   
    ## [42] "fBodyAcc-mean()-Y"                   
    ## [43] "fBodyAcc-mean()-Z"                   
    ## [44] "fBodyAcc-std()-X"                    
    ## [45] "fBodyAcc-std()-Y"                    
    ## [46] "fBodyAcc-std()-Z"                    
    ## [47] "fBodyAcc-meanFreq()-X"               
    ## [48] "fBodyAcc-meanFreq()-Y"               
    ## [49] "fBodyAcc-meanFreq()-Z"               
    ## [50] "fBodyAccJerk-mean()-X"               
    ## [51] "fBodyAccJerk-mean()-Y"               
    ## [52] "fBodyAccJerk-mean()-Z"               
    ## [53] "fBodyAccJerk-std()-X"                
    ## [54] "fBodyAccJerk-std()-Y"                
    ## [55] "fBodyAccJerk-std()-Z"                
    ## [56] "fBodyAccJerk-meanFreq()-X"           
    ## [57] "fBodyAccJerk-meanFreq()-Y"           
    ## [58] "fBodyAccJerk-meanFreq()-Z"           
    ## [59] "fBodyGyro-mean()-X"                  
    ## [60] "fBodyGyro-mean()-Y"                  
    ## [61] "fBodyGyro-mean()-Z"                  
    ## [62] "fBodyGyro-std()-X"                   
    ## [63] "fBodyGyro-std()-Y"                   
    ## [64] "fBodyGyro-std()-Z"                   
    ## [65] "fBodyGyro-meanFreq()-X"              
    ## [66] "fBodyGyro-meanFreq()-Y"              
    ## [67] "fBodyGyro-meanFreq()-Z"              
    ## [68] "fBodyAccMag-mean()"                  
    ## [69] "fBodyAccMag-std()"                   
    ## [70] "fBodyAccMag-meanFreq()"              
    ## [71] "fBodyBodyAccJerkMag-mean()"          
    ## [72] "fBodyBodyAccJerkMag-std()"           
    ## [73] "fBodyBodyAccJerkMag-meanFreq()"      
    ## [74] "fBodyBodyGyroMag-mean()"             
    ## [75] "fBodyBodyGyroMag-std()"              
    ## [76] "fBodyBodyGyroMag-meanFreq()"         
    ## [77] "fBodyBodyGyroJerkMag-mean()"         
    ## [78] "fBodyBodyGyroJerkMag-std()"          
    ## [79] "fBodyBodyGyroJerkMag-meanFreq()"     
    ## [80] "angle(tBodyAccMean,gravity)"         
    ## [81] "angle(tBodyAccJerkMean),gravityMean)"
    ## [82] "angle(tBodyGyroMean,gravityMean)"    
    ## [83] "angle(tBodyGyroJerkMean,gravityMean)"
    ## [84] "angle(X,gravityMean)"                
    ## [85] "angle(Y,gravityMean)"                
    ## [86] "angle(Z,gravityMean)"

    ####################################################################

(5) Create a second, independent tidy data set with the average of each variable for each activity and each subject
-------------------------------------------------------------------------------------------------------------------

    ####################################################################
    avg_group_data <- list()
    # group by activity
    avg_group_data[[1]] <- sapply(split(subset(Xy_dataset, select = -c(subject, activity)), 
                                              Xy_dataset[, "activity"]), colMeans)

    # group by subject
    avg_group_data[[2]] <- sapply(split(subset(Xy_dataset, select = -c(subject, activity)), 
                                              Xy_dataset[, "subject"]), colMeans)
    head(avg_group_data[[1]])

    ##                             1           2           3           4
    ## tBodyAcc-mean()-X  0.27633688  0.26229465  0.28813723  0.27305961
    ## tBodyAcc-mean()-Y -0.01790683 -0.02592329 -0.01631193 -0.01268957
    ## tBodyAcc-mean()-Z -0.10888169 -0.12053793 -0.10576162 -0.10551700
    ## tBodyAcc-std()-X  -0.31464445 -0.23798975  0.10076633 -0.98344622
    ## tBodyAcc-std()-Y  -0.02358295 -0.01603251  0.05954862 -0.93488056
    ## tBodyAcc-std()-Z  -0.27392080 -0.17544970 -0.19080451 -0.93898158
    ##                             5           6
    ## tBodyAcc-mean()-X  0.27915349  0.26864864
    ## tBodyAcc-mean()-Y -0.01615189 -0.01831773
    ## tBodyAcc-mean()-Z -0.10658691 -0.10743563
    ## tBodyAcc-std()-X  -0.98443471 -0.96093241
    ## tBodyAcc-std()-Y  -0.93250871 -0.94350719
    ## tBodyAcc-std()-Z  -0.93991350 -0.94806930

    head(avg_group_data[[2]])

    ##                             1           2           3           4
    ## tBodyAcc-mean()-X  0.26569692  0.27311312  0.27342872  0.27418311
    ## tBodyAcc-mean()-Y -0.01829817 -0.01913232 -0.01785607 -0.01480815
    ## tBodyAcc-mean()-Z -0.10784573 -0.11564996 -0.10649263 -0.10752143
    ## tBodyAcc-std()-X  -0.54579533 -0.60558650 -0.62341360 -0.60521173
    ## tBodyAcc-std()-Y  -0.36771622 -0.42896299 -0.48001592 -0.50992938
    ## tBodyAcc-std()-Z  -0.50264575 -0.58936006 -0.65362558 -0.70949274
    ##                             5          6           7          8
    ## tBodyAcc-mean()-X  0.27917796  0.2723766  0.27021170  0.2707591
    ## tBodyAcc-mean()-Y -0.01548335 -0.0175697 -0.01879049 -0.0181895
    ## tBodyAcc-mean()-Z -0.10566174 -0.1159945 -0.11249238 -0.1068096
    ## tBodyAcc-std()-X  -0.50769101 -0.5050861 -0.57751832 -0.5829589
    ## tBodyAcc-std()-Y  -0.40272491 -0.3684037 -0.54640337 -0.3493837
    ## tBodyAcc-std()-Z  -0.64644364 -0.6725120 -0.45647364 -0.4994727
    ##                             9          10          11         12
    ## tBodyAcc-mean()-X  0.27031384  0.27684847  0.27658531  0.2736087
    ## tBodyAcc-mean()-Y -0.02094666 -0.01783579 -0.01912725 -0.0183372
    ## tBodyAcc-mean()-Z -0.10123383 -0.11130153 -0.10894176 -0.1066491
    ## tBodyAcc-std()-X  -0.55565654 -0.53780771 -0.58947650 -0.5839622
    ## tBodyAcc-std()-Y  -0.57588790 -0.49740589 -0.49037935 -0.5220400
    ## tBodyAcc-std()-Z  -0.50611178 -0.61477695 -0.66532431 -0.6992935
    ##                            13          14          15          16
    ## tBodyAcc-mean()-X  0.27589588  0.27018460  0.27821341  0.27788744
    ## tBodyAcc-mean()-Y -0.01765048 -0.01625482 -0.01646448 -0.01585679
    ## tBodyAcc-mean()-Z -0.10913529 -0.10098594 -0.11256359 -0.10726392
    ## tBodyAcc-std()-X  -0.62484446 -0.61167112 -0.55654117 -0.66816150
    ## tBodyAcc-std()-Y  -0.44881610 -0.37473077 -0.48167954 -0.64994707
    ## tBodyAcc-std()-Z  -0.58723056 -0.29354271 -0.70570662 -0.60381990
    ##                           17          18          19         20
    ## tBodyAcc-mean()-X  0.2740295  0.27632415  0.26972349  0.2684258
    ## tBodyAcc-mean()-Y -0.0175416 -0.01728315 -0.01820315 -0.0175913
    ## tBodyAcc-mean()-Z -0.1091999 -0.10811225 -0.11827718 -0.1080291
    ## tBodyAcc-std()-X  -0.6084552 -0.69461688 -0.57465892 -0.6048467
    ## tBodyAcc-std()-Y  -0.5670053 -0.62711751 -0.50703508 -0.3693367
    ## tBodyAcc-std()-Z  -0.6605828 -0.70159604 -0.64918473 -0.6347873
    ##                            21          22          23          24
    ## tBodyAcc-mean()-X  0.27746653  0.27476769  0.27349325  0.27676705
    ## tBodyAcc-mean()-Y -0.01766646 -0.01682736 -0.01958926 -0.01768225
    ## tBodyAcc-mean()-Z -0.10877848 -0.10867038 -0.10909398 -0.10791450
    ## tBodyAcc-std()-X  -0.67232387 -0.54608998 -0.62259404 -0.67545918
    ## tBodyAcc-std()-Y  -0.56558519 -0.49118843 -0.53207855 -0.58249066
    ## tBodyAcc-std()-Z  -0.66962181 -0.65508968 -0.45055720 -0.63649746
    ##                            25          26          27          28
    ## tBodyAcc-mean()-X  0.27530147  0.27303658  0.27726457  0.27753255
    ## tBodyAcc-mean()-Y -0.01932218 -0.01616873 -0.01679692 -0.01917214
    ## tBodyAcc-mean()-Z -0.10962903 -0.10763789 -0.11084830 -0.10971087
    ## tBodyAcc-std()-X  -0.71626454 -0.62310103 -0.66097609 -0.64904039
    ## tBodyAcc-std()-Y  -0.53142104 -0.58596714 -0.63046049 -0.57365190
    ## tBodyAcc-std()-Z  -0.64709556 -0.70498063 -0.68321533 -0.68582142
    ##                            29          30
    ## tBodyAcc-mean()-X  0.27911152  0.27630584
    ## tBodyAcc-mean()-Y -0.01847195 -0.01758561
    ## tBodyAcc-mean()-Z -0.10867561 -0.10589356
    ## tBodyAcc-std()-X  -0.57429540 -0.61589079
    ## tBodyAcc-std()-Y  -0.59840028 -0.51904739
    ## tBodyAcc-std()-Z  -0.60646128 -0.52264327

    ####################################################################
