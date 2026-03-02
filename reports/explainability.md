# Explainability Report

## Method Used
To understand which variables had the strongest impact on the final model, I used **permutation importance** on the test set. This method measures how much performance changes when the values of one feature are shuffled while keeping the others unchanged instead of just assuming or redact a top based on logic.

## Most Important Features
The most important features for predicting delivery time were:

1. **Distance_km** (14.59)
2. **Preparation_Time_min** (4.12)
3. **Traffic_Level** (1.79)
4. **Weather** (1.32)
5. **Courier_Experience_yrs** (0.48)

### Notes
`Vehicle_Type` had a very small contribution, and 'Time_of_Day' had almost no impact on the model's performance.

## Business Interpretation
The results show that **distance** is the stongest driver of delivery time, which is consistent with business logic because longer trips, usually require more time.
**Preparation time** was the second most important variable, suggesting that delays do not depend only on the courier or the road, but also on restaurant operations.
**Traffic level** and **weather** also played an important variable, which confirms that external operational conditions affect delivery performance.
'Courier_Experience_yrs' had a smaller but still positive contribution.
