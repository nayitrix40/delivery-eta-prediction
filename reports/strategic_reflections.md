# Strategic Reflections Report

## Model Failure

### Your model underestimates delivery time on rainy days. Do you fix the model, the data, or the business expectations?
Well, I would first review the **data**, after that, the **model**, and if It is necessary the **business expectation** in the sort term (But actually that depends of the results after fixing the first two).

If the model is consistently underestimating delivery time on rainy days, that suggests the effect of weather may not be fully captured in the training data or by the model itself. I would check rainy-day cases are well represented in the dataset, and of course, whether additional variables or feature interactions are needed to better reflect those conditions.

Once the issue is confirmed, I can improve the model or the feature set, and communicate the situation to the business and consider using more conservative delivery estimates on rainy days until the model is improved.

## Transferability

### The model performs well in Mumbai. It’s now being deployed in São Paulo. How do you ensure generalization?
It's risky assuming that a model that performs well in Mumbai will automatically perform well in São Paulo. So first, I would test it usin São Paulo data and check wheter the same variables still explain delivery time accurately.

Then, I'll compare the data distributions and operational conditions between both cities, since factors as We know such traffic patterns, weather, **road structure**, and delivery behavior may differ. If the model performs worse, basically I'd retrain or adapt it using São Paulo data and include additional features if needed.

In short, generalization should be validated with local data, not assumed.

## GenAI Disclosure

### Generative AI tools are a great resource that can facilitate development, what parts of this project did you use GenAI tools for? How did you validate or modify their output?
I used GenAI tools as a support resource in several parts of the project. In the SQL, I used them to quickly explore useful functions and improve the structure of some queries, especially the more complex one related to trend anaysis. In the modeling section, I used GenAI to help structure the preprocessing pipeline and test additional models for comparison. I also used it to organize the structure of the written reports in order that I could have a better view to response.

I validated and modifed the outputs by running the queries

## Your Signature Insight

## Going to Production
