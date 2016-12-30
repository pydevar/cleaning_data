# Code Book

## Obtain the Wearable Computing Data
A full description is available at the site where the data was obtained:
[link](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

Here are the data for the project:[download link](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Instructions to perform the analysis
1. Download the data from the link above
2. Unzip the folder
3. Rename the folder to: "dataset"
4. Set the working directory to the base of the repository
5. Execute `run_analysis.R`

## How the script works
1. Reads all the dataset
2. Joins the training set together: set + labels + subject
3. Joins the test set together: set + labels + subject
4. Merge both together creating the dataset
5. Apply the correct names for each column
6. Extract Mean and Std measurements
7. Saves this dataset as: `clean_dataset.txt`. The dimensions are: 10299x68. Which are 66 features of Mean or Std, the Activity and the Subject.
8. Create a new dataset with the averages of each column grouped by activities and subject
9. Saves the latter dataset as: `average_dataset.txt`. The dimensions are: 180x68. Which are 66 features of Mean or Std, the Activity and the Subject. And there are 180 rows = 6 activities x 30 subjects.
