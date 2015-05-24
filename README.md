# GettingCleaningDataCourseProject

Get / Cleaning Data Course part of Data Science Specialization offered in Coursera
Project Description

The objective of the course project is to demonstrate your ability to collect, work with, and clean a data set. 
The goal is to prepare tidy data that can be used for later analysis. 
You will be graded by your peers on a series of yes/no questions related to the project.

You will be required to submit:

    a tidy data set as described below
    a link to a Github repository with your script for performing the analysis, and
    a code book that describes the variables, the data, and any transformations or work that you performed to clean up the data 
    called CodeBook.md. 
    
    You should also include a README.md in the repo with your scripts. This file explains how all of the scripts work and 
    how they are connected.

The input data for the project is: https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

This repo contains the following:

An R script called run_analysis.R that does the following.

    Merges the training and the test sets to create one data set.
    Extracts only the measurements on the mean and standard deviation for each measurement.
    Uses descriptive activity names to name the activities in the data set
    Appropriately labels the data set with descriptive activity names.
    Creates a second, independent tidy data set with the average of each variable for each activity and each subject.

What you find in this repository

    CodeBook.md: information about raw and tidy data set and elaboration made to transform them
    README.md: this file
    run_analysis.R: R script to transform raw data set in a tidy one

How to create the tidy data set

    clone this repository: git clone git@github.com:vsethum/GettingCleaningDataCourseProject.git
    download compressed raw data
    unzip raw data and copy the directory UCI HAR Dataset to the cloned repository root directory
    open a R console and set the working directory to the repository root (use setwd())
    source run_analisys.R script (it requires the plyr package): source('run_analysis.R')
