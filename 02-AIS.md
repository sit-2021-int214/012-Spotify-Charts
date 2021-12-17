# 012-Top-Spotify-Songs

Original Dataset from: [Top Spotify songs from 2010-2019 - BY YEAR](https://www.kaggle.com/leonardopena/top-spotify-songs-from-20102019-by-year)

# Analytical Inferential Statistics

## Steps

0. Assign variables:
   - u0 or p0
   - xbar or pbar
   - n
   - sd (or sigma)
   - alpha (default is 0.05)
1. State the hypothesis
2. Select Level of significance (alpha)
3. Select Test statistic (This formula for one population)
   - z/t <- (xbar - u0) / (sd / sqrt(n))
   - z <- (pbar - p0) / sqrt((p0 \* (1 - p0)) / n)
4. Find p-value or critical Value
   - P-value for Z: `pvalue <- pnorm(z)`
   - Critical Value for Z: `zalpha <- qnorm(alpha)`
   - P-value for T: `pvalue <- pt(q, df,lower.tail = TRUE)`
   - talpha for T: `talpha <- qt(p, df, lower.tail = TRUE)`
5. Compare p-value with alpha or z/t with zalpha/talpha
6. Conclusion

## Question 1

Assuming Spotify reports that the BPM of the their top songs from 2010-2019 is greater than or equal to 120. Suppose a sample of 80 Spotify top songs' BPMs from 2010-2019 is taken with a mean of 118.74 and a standard deviation of 24.34. Should the report be rejected at the confidence level of 95%?

### Step 0: Assign variables

```r
n <- 80
sd <- 24.34
xbar <- 118.74
u0 <- 120
```

### Step 1: State the hypothesis

```r
# h0: u0 >= 120
# ha: u0 < 120
```

### Step 2: Level of significance

```r
# confidence level = 95%, thus alpha = 5%
alpha <- 0.05
```

### Step 3: Test statistic

```r
t <- (xbar - u0) / (sd / sqrt(n))
# t = -0.4630149
```

### Step 4: Find p-value or critical Value

```r
# P-value approach
pvalue <- pt(t, n - 1)
# pvalue = 0.3223133

# Or

# Critical value approach
talpha <- qt(alpha, n - 1)
# talpha = -1.664371
```

### Step 5: Compare

```r
# Using p-value approach
if(pvalue<=alpha){
  print("Reject H0")
}else{
  print("Accept H0")
}

# Or

# When using critical value
if(t<=talpha){
  print("Reject H0")
}else{
  print("Accept H0")
}

# p-value approach result: Accept H0
# Critical value approach result: Accept H0
```

### Step 6: Conclusion

The evidence is not sufficient to reject the null hypothesis, thus the BPM of the Spotify top songs from 2010-2019 is greater than or equal to 120.



## Question 2
A researcher wants to see if there is any difference in the durations of Katy Perry's top songs' from 2010-2019 and Lady Gaga's top songs' from 2010-2019. Suppose two independent samples are taken and show in the table below.

|                               | Katy Perry | Lady Gaga |
|-------------------------------|------------|-----------|
| Sample Size                   | 8          | 10        |
| Sample Mean                   | 223.25     | 244.9     |
| Population Standard Deviation | 10.84      | 41.96     |

At the 95% confidence level, are the durations of Katy Perry's top songs from 2010-2019 and Lady Gaga's top songs from 2010-2019 significantly different?

### Step 0: Assign variables

```r
n1 <- 8
n2 <- 10
xbar1 <- 223.25
xbar2 <- 244.9
sd1 <- 10.84
sd2 <- 41.96
```

### Step 1: State the hypothesis

```r
# h0: xbar1 - xbar2 = 0
# ha: xbar1 - xbar2 != 0
```

### Step 2: Level of significance

```r
# confidence level = 95%, thus alpha = 5%
alpha <- 0.05
```

### Step 3: Test statistic

```r
# Standard error
se <- sqrt(((sd1 ^ 2) / n1) + ((sd2 ^ 2) / n2))
# se = 13.81131

z <- (xbar1 - xbar2) / se
# z = -1.567556
```

### Step 4: Find p-value or critical Value

```r
# P-value approach
pvalue <- pnorm(z)
# pvalue = 0.05849245

# Or

# Critical value approach
zalpha <- qnorm(alpha / 2) # a two-tailed test
# zalpha = -1.959964
```

### Step 5: Compare

```r
# Using p-value approach
if(pvalue<=alpha){
  print("Reject H0")
}else{
  print("Accept H0")
}

# Or

# When using critical value
if(z<=zalpha){
  print("Reject H0")
}else{
  print("Accept H0")
}

# p-value approach result: Accept H0
# Critical value approach result: Accept H0
```

### Step 6: Conclusion

The evidence is not sufficient to reject the null hypothesis, thus the durations of Katy Perry's top songs' from 2010-2019 and Lady Gaga's top songs' from 2010-2019 are not significantly different.