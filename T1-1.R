# Tutorial 1: Basics of R"
# Submission Deadline: 4 Feb 2022 9am

## Instructions
## In this tutorial, we will review and apply concepts related to the Basics of R. 

# - Part 1 will be done during the lab session in Week 3. You may save your answers as "T1-1[matric no].R". You will need to show your TA your answers to part 1 to earn your lab credits. 
# - Type your answers for questions in Part 2 using R script and save your file as “T1-2[matric no].R” (eg if your matric number is A12345J then save your file as T1-2A12345.R). Remember to delete the questions and answers to Part 1 before submitting your answers to Part 2. Submit your file to the “Tutorial 1 Submission” folder in LUMINUS (can be found under Week 4 in Module Overview). 
# - You will discuss the answers to questions in Part 2 during Tutorial session in week 4.

# Note that we use the back ticks (` `) to denote an R object eg `Orange` means Orange is an R object. When you are asked to assign an output to `df2`, the R object is simply df2 and not `df2`. 
# We also use the hex sign (#) to denote a comment. Anything that appears after a # on a line will not be executed by R. You can use it to provide comments of your answers. You should also use it to label the question numbers for your answers and to provide any textual answers that are required by the questions.

# Part 1: To be completed in Week 3 Lab

#### 1)	We will start by exploring the built-in dataset called `ToothGrowth`. To find out more about this dataset, type ?ToothGrowth in the R command line. 

# - What do each of the following functions do? (Hint: You may use the Help menu or ?<function> where <function> is the function name e.g. ?summary, to find out) 

# i)	summary()
# ii)	head()
# iii) tail()
# iv)	str()

# Type your answers below. 

# i) summary() - basic statistical analysis; to produce result summaries of the results of various model fitting functions
# ii) head() - to return the first parts of a vector, matrix, table, data frame or function
# iii) tail() - to return the last parts of a vector, matrix, table, data frame or function
# iv) str() - some of entries, gives more information of the data itself - data type and first few sets of data; to display the internal structure of an R object, a diagnostic function and an alternative to summary; structure, rapid overview of the data



#### 2)	Selecting data
# - There are several variables in `ToothGrowth`. Using Base R and dplyr functions, can you perform (i), (ii) and (iii)? 
  
#   i)	Extract the column `supp`
# ii)	Extract rows where `supp` is equal to “VC”
# iii)	Extract the values of `len` where `supp` is equal to “VC”
# iv)	Try to perform the above operations (i, ii, iii) again but this time, assign the output to df3.1, df3.2 and df3.3 respectively. 
# v)	Use the class function to check the class attribute for each of the outputs. Use is.data.frame function to check whether the output is a dataframe or a vector. 

# Type your answers below. 

#i  ToothGrowth["supp"]
#   ToothGrowth$supp
#   ToothGrowth[, 2]
#   ToothGrowth[, "supp"]
#   ToothGrowth %>% select(supp)  #using dplyr

#ii  filter(ToothGrowth, supp == "VC")
#    ToothGrowth[ToothGrowth$supp == "VC", ]  #extracting rows
#    ToothGrowth[c(1:30)]  # if df is sorted by supp and VC is the first 30 rows
#    subset(ToothGrowth, supp == "VC")
#    ToothGrowth %>% filter(supp == "VC")  #using dplyr

#iii  filter(ToothGrowth, supp == "VC")["len"]
#     ToothGrowth$len[ToothGrowth$supp == "VC"] -- "numeric"
#     subset(ToothGrowth, select = "len", supp == "VC") -- "data.frame"
#     ToothGrowth %>% filter(supp == "VC") %>% select(len) -- "data.frame"  #using dplyr

#iv   df3.1 <- ToothGrowth$len[ToothGrowth$supp == "VC"]
#     df3.2 <- subset(ToothGrowth, select = "len", supp == "VC")
#     df3.3 <- ToothGrowth %>% filter(supp == "VC") %>% select(len)

#v  class(df3.1) - "numeric"
#   class(df3.2) - "data.frame"
#   class(df3.3) - "data.frame"


#### 3) Changing variable name or values
# - i)	Change the variable name from `len` to `length`
# - ii)	Increase the value of len by 0.5 if supp is equal to OJ.


# Type your answers below. 

# i  ToothGrowth %>% rename(length = len)
#    colnames(ToothGrowth)[colnames(ToothGrowth) == "len"] <- "length"
#    ToothGrowth

# ii  ToothGrowth %>% filter(supp == "OJ") %>% mutate(len = len + 0.5)
#     df <- subset(ToothGrowth, supp == "OJ")
#     df$len <- df$len + 0.5

#     df <- ToothGrowth
#     df <- df %>% filter(supp == "OJ") %>% mutate(len = len + 0.5)
#     df

# however, this method only retains observations where supp == "OJ"

# possible method to retain all rows while still increasing the value of len by 0.5 if supp == "OJ":

# base R implementation:
#     df <- ToothGrowth
#     df$len[df[, "supp"] == "OJ"] <- df$len[df[, "supp"] == "OJ"] + 0.5
#     df

# dplyr implementation:
#     df <- ToothGrowth
#     df <- df %>% mutate(len = ifelse(supp == "OJ", len+0.5, len))
#     df

#### 4) Sorting
# - i)	There are two functions in Base R “sort” and “order” to perform sorting. How do these two functions differ? Try to do a sort with each function on ToothGrowth$len.
# - ii)	Using a base R function (e.g. order), how can you sort the dataframe `ToothGrowth` in decreasing order of `len`? 
# - iii)	What dplyr functions can you use to sort `ToothGrowth` in increasing order of `len`? Can you also sort the dataframe in decreasing order of `len`? 
  
# Type your answers below. 

# i
# sort(ToothGrowth$len) - answers in decimals, in terms of the actual number
# -> original object, ascending order by default
#  [1]  4.2  5.2  5.8  6.4  7.0  7.3  8.2  9.4  9.7  9.7 10.0 10.0 11.2 11.2 11.5 13.6 14.5 14.5 14.5 15.2 15.2 15.5 16.5 16.5 16.5 17.3 17.3
#  [28] 17.6 18.5 18.8 19.7 20.0 21.2 21.5 21.5 22.4 22.5 23.0 23.3 23.3 23.6 23.6 24.5 24.8 25.2 25.5 25.5 25.8 26.4 26.4 26.4 26.4 26.7 27.3
#  [55] 27.3 29.4 29.5 30.9 32.5 33.9
# order(ToothGrowth$len) - answers in integers, in terms of number of the row the data belongs to
# -> indices of sorted object, acending order by default
#  [1]  1  9  4  5 10  3 37 38 34 40  6 36  7  8  2 17 18 35 49 13 31 20 11 12 39 14 16 33 22 19 41 45 48 28 32 53 15 60 29 42 21 43 54 55 46 24
#  [47] 51 47 25 44 52 57 27 50 58 59 30 56 26 23

# ii  ToothGrowth[order(ToothGrowth$len, decreasing = TRUE), ]

# iii  sort(); order(); arrange()
#      yes, can sort in decreasing order
#      ToothGrowth %>% arrange(desc(len))
#      ascending order -- ToothGrowth %>% arrange(len)



#### 5) Factors
# - i)	Check if `supp` is a factor vector. First type "ToothGrowth$supp". What do you observe about the output? 
# - ii)	Next use is.factor() and is.ordered() to check if supp is a factor and if so whether it is an ordered factor. 
# - iii)	Now supposed we find that vitamin C (VC) is a superior supplement compared to orange juice (OJ), and we want to order `supp` such that VC is a higher level than OJ, how could we do this? 
  
# Type your answers below. 

# i  is.factor(ToothGrowth$supp) - TRUE
#    "supp" is a factor vector
#     ToothGrowth$supp
#[1] VC VC VC VC VC VC VC VC VC VC VC VC VC VC VC VC VC VC VC VC VC VC VC VC VC VC VC VC VC VC OJ OJ OJ OJ OJ OJ OJ OJ OJ OJ OJ OJ OJ OJ OJ OJ
#[47] OJ OJ OJ OJ OJ OJ OJ OJ OJ OJ OJ OJ OJ OJ
#Levels: OJ VC
  
# ii  is.factor(ToothGrowth$supp) - TRUE
#    "supp" is a factor vector
#     is.ordered(ToothGrowth$supp) - FALSE
#     "supp" is not an ordered factor

# iii  factor(ToothGrowth$supp, levels = c("OJ", "VC"), ordered = TRUE)

#      factor_supp <- factor(ToothGrowth$supp, levels = c("OJ", "VC"), ordered = TRUE)


