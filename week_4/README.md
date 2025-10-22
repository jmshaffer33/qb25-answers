# 2.2 
## Maternal DNMs
1. What is the “size” (i.e., slope) of this relationship? Interpret the slope in plain language. Does it match your plot?  
slope = 0.37757  
The number of maternal DNMs increases by 0.37757 for each additional year a mother ages.   
Yes, the slope matched my plot (positive slope). 

2. Is the relationship significant? How do you know? Explain the p-value in plain but precise language.  
p-value < 2e-16  
This relationship is significant because it is below the threshold 0.05.     
The slope relating maternal age and maternally derived DNMs is significantly different from 0, suggesting an association between the two. 

# 2.3
## Paternal DNMs
1. What is the “size” (i.e., slope) of this relationship? Interpret the slope in plain language. Does it match your plot?  
slope = 1.35384   
The number of paternal DNMs increases by 1.35384 for each additional year a father ages.   
Yes, the slope matched my plot (positive slope). 

2. Is the relationship significant? How do you know? Explain the p-value in plain but precise language.  
p-value < 2e-16  
This relationship is significant because it is below the threshold 0.05.   
The slope relating paternal age and paternally derived DNMs is significantly different from 0, suggesting an association between the two. 

# 2.4 
Paternal_DNMs ~ 10.32632 + Paternal_age * 1.3584  
Paternal_DNMs ~ 10.32632 + (50.5 * 1.3584)   
Paternal_DNMs = 78.92552

# 2.6
1. What is the “size” of this relationship (i.e., the average difference in counts of maternal and paternal DNMs)? Interpret the difference in plain language. Does it match your plot?   
mean difference = -39.23485  
On average, there are 39.23485 fewer de novo mutations in mothers vs fathers.   
Yes, this matches the plot; visually, the maternal histogram has a much smaller mean whereas the paternal histogram has a much larger mean. 

2. Is the relationship significant? How do you know? Explain the p-value in plain but precise language.  
p-value < 2.2e-16  
This relationship is significant because it is below the threshold 0.05.  
There is a significant difference between the mean of the maternal DNMs versus the mean of the paternal DNMs. 

3. Compare paired t-test results to linear regression model. How would you interpret the coefficient estimate for the intercept term?  
coefficient estimate for intercept term = -39.2348  
The coefficient estimate for intercept term is equal to the mean difference value (-39.2348 = -39.23485). As such, the interpretations are the same!! On average, there are 39.23485 fewer de novo mutations in mothers vs fathers. 

# 3.1
Selected TidyTuesday dataset American Idol.

# 3.2
The cities that are visited on each American Idol season change each time. As such, there are relatively similar numbers of tickets to Hollywood given at each location. But! There are far more tickets given (ie greater distribution of tickets) in Nashville, Tenassee, where American Idol returns every few seasons. 

# 3.3
Is there a difference in number of tickets to Hollywood across each season?  
p-value = 0.9931 > 0.05  
The relationship is not significant because it is above the threshold 0.05.   
There is not a significant difference in number of tickets to hollywood across each season of American Idol (1-18). 

