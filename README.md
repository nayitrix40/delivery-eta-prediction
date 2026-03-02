# delivery-eta-prediction

## Delivery Time Prediction Model

This project trains a machine learning model to predict food delivery time based on operational and environmental factors.

## Recommended Python Version 
Python 3.11

## Setup Instructions

1. Clone or download this repository.
2. Open the project folder in your preferred IDE (e.g., VS Code or PyCharm).
3. Create and activate a virtual environment.
4. Install the required dependencies:

   ```bash
   pip install -r requirements.txt

5. Make sure the dataset file (Food_Delivery_Times) is inside the model_pipeline/ folder.
6. Run the training script:

   ```bash
   python model_pipeline/train.py

7. After the model is trained, You'll see a .joblib file created, then run the prediction script:

   ```bash
   python model_pipeline/predict.py

## API Prototype:

1. Make sure the trained model file (best_model.joblib) already exists.
2. Open a terminal in the project folder.
3. Run the api with:

   ```bash
   python -m uvicorn model_pipeline.api:app --reload

4. Open your browser and go to:

    ```bash
    http://127.0.0.1:8000/docs

5. Use the /predict endpoint to send delivery details and receive the estiated delivery time.

Click "Try out"
As this is a simple prototype, remember in the .json, write the right type for each feature:
- Distance_km: float
- Weather: str
- Traffic_Level: str
- Time_of_Day: str
- Vehicle_Type: str
- Preparation_Time_min: int
- Courier_Experience_yrs: float

13. Click "Execute"
14. And below, You are going to see a section that shows You the prediction of the delivery time.
