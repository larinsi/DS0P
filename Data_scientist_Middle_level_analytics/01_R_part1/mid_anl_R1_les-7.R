### Lesson 7 ###

# binding a data frame
age <- c(32, 44, 21)
educ <- c("M", "M", "B")
dat <- cbind.data.frame(age, educ)
dat

# matrices
mat <- as.matrix(dat)
mat
class(mat)

educ <- c(2, 2, 1)
mcols <- cbind(age, educ)
mcols

mrows <- rbind(age, educ)
mrows

matrix(1:12, ncol = 3, nrow = 4)
matrix(0, ncol = 5, nrow = 2)
m <- matrix(1:20, nrow = 4, ncol = 5) 
m

# working with elements
m[2, 3]
m[2, 3] <- 0
m

m[2,]
m[,3]

