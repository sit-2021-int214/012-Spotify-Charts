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

## Question

Assuming Spotify reports that the BPM of the their top songs from 2010-2019 is greater than 120. Suppose a sample of 80 Spotify top songs' BPMs from 2010-2019 is taken with a mean of 118.74 and a standard deviation of 24.34. Should the report be rejected at the confidence level of 95%?

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

### Step 4: Finding Critical Value approach

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

The evidence is not sufficient to reject the null hypothesis, thus the Spotify report should not be rejected.
