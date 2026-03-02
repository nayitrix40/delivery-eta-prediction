# Strategic Reflections Report

## Model Failure

### Your model underestimates delivery time on rainy days. Do you fix the model, the data, or the business expectations?
Well, I would first review the **data**, then the **model**, and if It is necessary the **business expectation** in the sort term (But actually that depends of the results after fixing the first two).

If the model is consistently underestimating delivery time on rainy days, that suggests the effect of weather may not be fully captured in the training data or by the model itself. I would check rainy-day cases are well represented in the dataset, and of course, whether additional variables or feature interactions are needed to better reflect those conditions.

Once the issue is confirmed, I can improve the model or the feature set, and communicate the situation to the business and consider using more conservative delivery estimates on rainy days until the model is improved.

## Transferability

### The model performs well in Mumbai. It’s now being deployed in São Paulo. How do you ensure generalization?
It's risky assuming that a model that performs well in Mumbai will automatically perform well in São Paulo. So first, I would test it usin São Paulo data and check wheter the same variables still explain delivery time accurately.

Then, I'd compare the data distributions and operational conditions between both cities, since factors as We know such traffic patterns, weather, **road structure**, and delivery behavior may differ. If the model performs worse, basically I'd retrain or adapt it using São Paulo data and include additional features if needed.

In short, generalization should be validated with local data, not assumed.

## GenAI Disclosure

### Generative AI tools are a great resource that can facilitate development, what parts of this project did you use GenAI tools for? How did you validate or modify their output?
I used GenAI tools as a support resource in several parts of the project. In the SQL, I used them to quickly explore useful functions and improve the structure of some queries, especially the more complex one related to trend analysis. In the modeling section, I used GenAI to help structure the preprocessing pipeline and test additional models for comparison. I also used it to organize the structure of the written reports in order that I could have a better view to response.

I validated and modified the outputs by running the queries and code myself, checking that They matched the business question, adjusting the syntax and project structure where needed, I compared model performance using MAE, RMSE, and R^2. The final decisions, including model selection and business interpretation, were based on my own review of the results.

## Your Signature Insight

### What's one non-obvious insight or decision you're proud of from this project?
One decision I am proud of was testing multiple models instead of assuming the most complex one would be best. Although I initially expected XGBoost or Random Forest to perform better, then I noticed the dataset was relatively small and not extremely complex. After comparing all three models, Linear Regression got the best performance, which showed me the importance of choosing models based on evidence rather than assumptions.

## Going to Production

### How would you deploy your model to production? What other components would you need to include/develop in your codebase? Please be as detailed each step of the process, and feel free to showcase some of these components in the codebase.
I would deploy the model as an API so that the company's internal systems/software can send delivery details and receive an estimated delivery time in return. So the main steps would be like:
1. package the trained model
2. expose it through a prediction endpoint
3. validate inputs
4. handle errors
5. connect it to the operational platform where ETA predictions are needed.

For making the solution production-ready, I'd also include logging, model versioning, monitoring, and if It's possible, retraining process so the model can be updated as business conditions change.

A more detailed implementation roadmap for these production and API-related steps is described in next_steps.md
