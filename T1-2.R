# Tutorial 1: Basics of R"
# Submission Deadline: 4 Feb 2022 9am

## Instructions
## In this tutorial, we will review and apply concepts related to the Basics of R. 

# - Part 1 will be done during the lab session in Week 3. You may save your answers as "T1-1[matric no].R". You will need to show your TA your answers to part 1 to earn your lab credits. 
# - Type your answers for questions in Part 2 using R script and save your file as “T1-2[matric no].R” (eg if your matric number is A12345J then save your file as T1-2A12345.R). Remember to delete the questions and answers to Part 1 before submitting your answers to Part 2. Submit your file to the “Tutorial 1 Submission” folder in LUMINUS (can be found under Week 4 in Module Overview). 
# - You will discuss the answers to questions in Part 2 during Tutorial session in week 4.

# Note that we use the back ticks (` `) to denote an R object eg `Orange` means Orange is an R object. When you are asked to assign an output to `df2`, the R object is simply df2 and not `df2`. 
# We also use the hex sign (#) to denote a comment. Anything that appears after a # on a line will not be executed by R. You can use it to provide comments of your answers. You should also use it to label the question numbers for your answers and to provide any textual answers that are required by the questions.


### PART 2 (10 marks)
# For this part of the tutorial, you will be using the built-in dataset `Orange`. 

#### 1) Inspect the dataset (2 marks)
# - Use the functions you have learnt in Part 1 of this tutorial to inspect the dataset. Describe this dataset in terms of the number of observations, number of variables, and type of variables. 
# str(Orange)
# summary(Orange)
# From results from str(Orange), there are 35 observations and 3 variables, which are the ordered factor variable "Tree" (with 5 levels), the numeric variable "age", and the numeric variable "circumference".

#### 2) Data Extraction (3 marks)
# - i) Assign the dataset `Orange` to `dfO` (Note: O is the capital letter of o and not the number zero) 
#      dfO <- Orange
# - ii)	Extract the column `age` from `dfO` and assign it to `df2ii`. 
#       df2ii <- dfO$age

#       df2ii <- dfO[, "age"]

# - iii)	Using Base R functions, extract the rows of data from `dfO` where `Tree` is equal to “3”. How many rows of data are extracted? 
#         subset(dfO, Tree == "3")
#         7 rows are extracted

#         dfO[dfO$Tree == 3, ]
#         subset(dfO, Tree == 3)
#         nrow(dfO[dfO$Tree == 3, ])

# - iv) Using dplyr functions, extract the columns `Tree` and `age` where `circumference` is less than 100 and assign this output to `df2iv`. How many observations are there in `df2iv`? 
#       df2iv <- dfO %>% filter(circumference < 100) %>% select(Tree, age)
#       13 observations

#       nrow(df2iv)


#### 3) Variables (2 marks)
# - i)	Create a new variable in `dfO` called `age.mth` which is the age of each tree in months (instead of days since 31 Dec 1968). Compute this variable using the formula age/30. You may use dplyr or base R functions for this. Inspect the values of this new variable and tell us what is the maximum and minimum values. 
#       dfO <- dfO %>% mutate(age.mth = age /30)
#       summary(dfO)
#       As for age.mth, from results obtained from summary(dfO), the maximum value is 52.733, and the minimum value is 3.933.

#       dfO$age.mth <- dfO$age / 30
#       summary(dfO)

#       max(dfO$age.mth)
#       min(dfO$age.mth)

#### 4) Factors (1 mark)
# - i)	The values of the `Tree` variable range from 1-5. Is this an ordered factor? If so, can you list the levels in increasing order? 
#       is.ordered(dfO$Tree)
#       is.ordered(dfO$Tree) returns True.
#       Yes, this is an ordered factor.
#       levels in increasing order: "3"<"1"<"5"<"2"<"4"

#       str(Orange)
#       dfO$Tree -- can just directly print the variable, where R will indicate the ordered levels
#       [1] 1 1 1 1 1 1 1 2 2 2 2 2 2 2 3 3 3 3 3 3 3 4 4 4 4 4 4 4
#       [29] 5 5 5 5 5 5 5
#       Levels: 3 < 1 < 5 < 2 < 4

#       levels(dfO$Tree)
  

#### 5) Sorting (2 marks)
# - i)	Using base R, please sort `dfO` in decreasing order of age.
#       dfO[order(dfO$age, decreasing = TRUE), ]
# - ii)	Using dplyr, sort `dfO` in decreasing order of `Tree` then by increasing order of circumference. The output should have the observations arranged in decreasing order of Tree first and within the same level of Tree, the observations should be arranged in increasing order of circumference. 
#       dfO %>% arrange(circumference) %>% arrange(desc(Tree))





