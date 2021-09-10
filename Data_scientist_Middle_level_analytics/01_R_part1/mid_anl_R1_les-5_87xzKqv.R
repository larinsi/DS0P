### Lesson 5 ###

v <- c(2, 5, 8)
sales <- c(30, 80, 24, 67, 90, 32, 24)
sales
length(sales)

# working with elements
sales[1]
sales[0] # strange
sales[length(sales)]

sales[1] <- 44
sales

sales[1:3]
sales[2:]

# filtering
sales[sales == 24]
sales[sales <= 30]

which(sales == 24)
which(sales > 30)

# vectorized operations
sales ** 2
v1 <- c(0, 1, 4)
v2 <- c(8, 9, 2)
v1 + v2
v1 - v2
round(c(3.4, 5.7, 0.1))

# sum and product
v2
sum(v2)
prod(v2)

# sorting
sort(v2)
sort(v2, decreasing = TRUE)

