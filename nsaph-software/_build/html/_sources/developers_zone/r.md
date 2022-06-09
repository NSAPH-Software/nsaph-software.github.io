# R Styling Guide

For the R packages, we follow [The tidyverse style guide](https://style.tidyverse.org/). Here are some examples:

## Spaces and Indentation

- Indentations are two spaces (do not use a tab key)
- Place space around binary operators (e.g., x + y)

```r
# Acceptable
z <- x + y 

# Not recommended
z<-x+y # (no space)
x<- x+y
z<-x +y
```

- Place a space after comma

```r
# Acceptable
a <- matrix(c(1:100), nrow = 5)

# Not recommended
a <- matrix(c(1:100),nrow = 5) # (no space after comma)
a <- matrix( c(1:100), nrow = 5 ) # (extra space after and before parentheses)
a<-matrix(c(1:100), nrow = 5) # (no space around unary operator <- )
```

- Place a space after # and before comments and avoid multiple ###.

```r
# Acceptable
# This is a comment.

# Not recommended
#This is a comment
#    This is a comment (more than one space after #)
## This is a comment (multiple #)
```

- Do not put space at the opening and closing parenthesis

```r
# Acceptable
x <- (z + y)

# Not recommended 
x <- ( z + y )
x <- (z + y )
x <- ( z + y)
```

- Place a space before and after `()` when used with `if`, `for`, or `while`.

```r
# Acceptable

if (x > 2) {
  print(x)
}

# Not recommended

if(x > 2){
  print(x)
}
```


## Other notes

- Maximum line length is 80 character
- Use explicit returns 
- Use explicit tags in documentation (e.g., @title, @description, ... )
- All assignments are done using `<-` not `=`.
- Do not use `.` in the variable names and function names. `.` is reserved for S3 methods. Use `_` instead. `sim.data` --> `sim_data`.

