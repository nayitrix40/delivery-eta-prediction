# Error Insights Report

## Overview
The model that I selected (Linear Regression) could obtain **MAE of 6.06**, **RMSE of 8.95**, and **R^2 of 0.82**, which indicates good performance. However... some delivery scenarios are like more difficult to predict than others.

## Likely Errors Patterns
The model is expected to make larger error when There are complex or unusal delivery situations, such as:

 - **Long-distance deliveries**
 - **High traffic conditions**
 - **Rainy or adverse weather**
 - **Orders with high preparation time**

These cases are more difficult to handle because delivery delays may be driven by multiple factors interacting at the same time.

## Why Errors May happen
Normally, a linear model works well when relationships are relatively simple, but some delivery situations may involve more different patterns, For example: The impact of traffic should/may become much stronger when distance is also high, or depending of the weather confition may affect also different vehicle types in different ways.

And I have to say, the dataset only includes a limited number of variables, so some important operational factors are not captured, such as route conditions, restaurant workload, or customer availability.

## Possible Improvements
Model performance could improve with:
- more delivery record,
- additional operational features,
- and more detailed data about routes, restaurant confitions, or delays during pickup/drop-off, so depending on that, We can try other model If only could improve the accuracy of the result.
