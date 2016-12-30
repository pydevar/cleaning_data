# The dataset is in a folder called: "dataset"
# And it is unzipped
# The current working directory should be set to the base Repo path.

# Read the dataset
training_set <- read.table("./dataset/train/X_train.txt")
training_labels <- read.table("./dataset/train/y_train.txt")

test_set <- read.table("./dataset/test/X_test.txt")
test_labels <- read.table("./dataset/test/y_test.txt")

training_subject <- read.table("./dataset/train/subject_train.txt")
test_subject <- read.table("./dataset/test/subject_test.txt")

# Create temporary dataframes and join all data
tmp_train <- cbind(training_set, training_labels, training_subject)
tmp_test <- cbind(test_set, test_labels, test_subject)

# Merge the training and the test sets to create one data set.
dataset <- rbind(tmp_train, tmp_test)

# Obtain the names for the columns
features_names <- read.table("./dataset/features.txt")[,2]

# Add labels and subject
all_names <- c(as.character(features_names), c("activities", "subject"))

# Aplly all the names to the dataset
names(dataset) <- all_names


# Extract mean and std measurements
indexes <- grep("mean\\(\\)|std\\(\\)", features_names[, 2])
extracted_measurements <- dataset[, indexes]

# Obtain activity names
activity_names <- read.table("./dataset/activity_labels.txt")
dataset$activities <- activity_names[dataset$activities, 2]

# Leave only the mean and std measurements from the dataset
clean_dataset <- dataset[, c(indexes, 562, 563)]
write.table(clean_dataset, "clean_dataset.txt")

# Create a new dataset with the averages of each column grouped by activities and subject
average_dataset <- aggregate(clean_dataset[,1:66], list(clean_dataset$activities, clean_dataset$subject), mean )
names(average_dataset)[1:2] <- c("activities", "subject")
write.table(average_dataset, "average_dataset.txt")
