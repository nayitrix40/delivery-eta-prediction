# Model Notes

## Modeling Approach
I started with Linear Regression as a baseline because It is simple, interpretable, and provides a clear reference point for comparison (and the one I most get used to it). But I also evaluated Random Forest Regressor and XGBoost Regressor to test wheter more flexible models could better capture non-linear relationships in the data.

## Prepocessing
Before training, I removed 'Order_ID' (It's only a identifier and doesn't provide predictive value. Missing numerical values were imputed using the **median**, while missing categorical values were imputed using the **most frequent category**). Categorical variables (string) were encoded using **one-hot-encoding**.

## Evaluation
The dataset was split into 80% training and 20% testing (as good practices of course). Model performance was evaluated using the next metrics:

- MAE (Mean Absolute Error)
- RMSE (Root Mean Squared Error)
- R^2 (Coefficient of determination)

## Model Comparison
The results were:

- Linear Regression: MAE: 6.06, RMSE: 8.95, R^2: 0.82
- Random Forest Regressor: MAE: 6.72, RMSE: 9.61, R^2: 0.79
- Linear Regression: MAE: 7.52, RMSE: 10.29, R^2: 0.76

## Final Model Selection
After comparing all three models, Linear Regression achieved the best overall performance, with the lowest error values and the highest R^2. Based on these results, I selected Linear Regression as the final model for this dataset.

### Notes
No extensive hyperparameter tuning was performed, since the goal was to build a clean, reproducible, and interpratable baseline solutions for the business problem.
