# Exploratory Data Analysis Report

## Dataset Overview
This dataset contains **1,000 delivery records** and **9 variables** related to delivery operations and context. The objective is to predict the delivery duration in minutes using the target variable **`Delivery_Time_min`**, making this a supervised **regression** problem.

## Data Quality Review
The dataset includes numerical and categorical features.

**Numerical Columns**
- `Order_ID` (identifier)
- `Distance_km`
- `Preparation_Time_min`
- `Courier_Experience_yrs`
- `Delivery_Time_min` (Tarjet)

**Categorical columns**
- `Weather`
- `Traffic_Level`
- `Time_of_Day`
- `Vehicle_Type`

### Missing Values
Missing values were found in the following columns:

- `Weather`: 30 missing values
- `Traffic_Level`: 30 missing values
- `Time_of_Day`: 30 missing values
- `Vehicle_Type`: 30 missing values

### Feature Selection Note
`Order_ID` was excluded because It is only an identifier and doesn't provide a operatinal factor in order to predicting delivery time.

## Key Patterns (Relevant Observations)
From the nature of the variables and the goal of predicting delivery time, the following patterns are expected and were considered important for modeling:

- **Traffic level impact**: `Traffic_Level` is likely one of the strongest drivers of delivery time.
- **Distance effect**: `Distance_km` is expected to have a direct relationship with delivery time, distance typically results in longer delivery time.
- **Preparation time contribution**: `Preparation_Time_min` is probably a significant contributor to the final delivery time, since it increases the total end-to-end time before delivery begins actually.
- **Weather condition**: `Weather` may influence delivery time (rain or fog), as It can reduce speed and increase caution while driving.
- **Vehicle type interaction**: `Vehicle_Type` may affect delivery time performance depending on traffic and distance as well (For example: scooters may perform differently than cars in high traffic).
- **Time-of-day variability**: `Time_of_Day` can act as a proxy for demand/traffic patterns and may indirectly influence delivery time, and depends on the area as well.

## Outliers
Potential outliers may exist in:

- deliveries with unusually high delivery times compared to the rest of the data can happen,
- unusual combinations such as short distances with very high delivery times, which may reflect operational issues (like delays ay pickup, customer unavailability), extreme traffic events, or data noise.

If I have to be honest, no records were automatically removed during exploration, since extreme cases can still represent valid real-world scenarios and may be important for a business-facing prediction model.

## Assumptions
The following assumptions were made ro support modeling:

1. **Target definition**: `Delivery_Time_min` is assumed to represent the total time relevant to the business problem.
2. **Identifier exclusion**: `Order_ID` does not provide predictive value and can be removed.
3. **Handling missing value**
   - Numerical missing values (e.g., 'Courier_Experience_yrs') can be imputed using the **median**, and categorical missing value for the **most frequent category**
