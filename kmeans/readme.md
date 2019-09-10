# K-Means

## Intro

This is a very basic implementation of k-means. 

*Warning:* first time playing around with R, so there is plenty to improve on that sense.

## Usage

First run the script to load the function then `k_means(data, k, iterations)`

Sample execution
```
> ys = c(8,5,2,8,3,4,4,7)
> xs = c(2,2,1,5,7,6,8,4)
> data <- cbind(xs,ys)
> k_means(data,3,10)

     d_center_tag xs ys
[1,]            3  2  8
[2,]            2  2  5
[3,]            2  1  2
[4,]            3  5  8
[5,]            1  7  3
[6,]            1  6  4
[7,]            1  8  4
[8,]            3  4  7
           xs       ys
[1,] 7.000000 3.666667
[2,] 1.500000 3.500000
[3,] 3.666667 7.666667
```
