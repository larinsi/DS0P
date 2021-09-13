### Lesson 6 ###

# types
age <- 32
name <- "Ann"
zero <- TRUE
one <- FALSE

zero <- TRUE
one <- FALSE

class(age)
class(name)
class(zero)

# type conversion
nums <- c("2.5", "8", "9.1", "0")
nums <- as.numeric(nums)
nums

nums2 <- c("2,5", "8", "9,1", "0")
nums2 <- as.numeric(nums2)
nums2

nums2 <- c("2,5", "8", "9,1", "0")
nums2 <- as.numeric(gsub(",", ".", nums2))
nums2

ints <- as.integer(c(2.0, 3.7, 3.0))
ints
is.integer(ints)

ids0 <- 10:20
ids0
as.character(ids0)

mixed1 <- c(2, "one", 6, 7)
mixed1
class(mixed1)
is.character(mixed1)

mixed2 <- c(1, 0, TRUE, FALSE)
mixed2
class(mixed2)