# Next Steps

This prototype demonstrates how the trained model could be exposed thorough a basic API endpoint for the obkective of ETA prediction:

## 1. Improve input validation
Although the API already validates basic data types, additional checks should be added (preventing negatives, invalid categories for traffic, weather, and the others)

## 2. Better error handling
The current version is intentionally lightweight. A production-ready service should clearer error messages and handle unexpected cases more robustly.

## 3. Monitoring and logging
The API should log requests, prediction outputs, and possible failures. This would help monitor usage, detect issues, and evaluate wheter the model continues working well over time.

## 4. Model versioning
The model should be versioned so that updates can be tracked and rolled back if It is necessary. 

## 5. Retraining pipeline
As delivery patterns change over the time, because It can happen, the model should be retrained periodically using more recent data.

## 6. Integration with business systems
The API could be connected to internal dispatch, ordering, or customer-facing systems, so de ETA predictions can be generated at once during real delivery operations
