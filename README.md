# delivery-eta-prediction

## Delivery Time Prediction Model by Nayim Rodriguez

This project trains a machine learning model to predict food delivery time based on operational and environmental factors.

## Recommended Pyhton Version 
Python 3.11

## Setup Instructions

1. Clone or download this repository.
2. Open the project folder in your preferred IDE (e.g., VS Code or PyCharm).
3. Create and activate a virtual environment.
4. Install the required dependencies:

   '''bash
   pip install -r requirements.txt

5. Make sure the dataset file (Food_Delivery_Times) is in the correct project location.
6. Run the training script:

   '''bash
   python train.py

7. After the model is trained, You'll see a .joblib file created, then run the prediction script:

   '''bash
   python predict.py

If You wanna try the **API**, then:

8. Run the api script:

   '''bash
   .\.venv\Scripts\python.exe -m uvicorn api:app --reload

9. After the api is running, write in the URL of a browser (Chrome, Firefox) the next url below to open it in the local server:

    http://127.0.0.1:8000/docs

10. You'll see the FastAPI open, 'Select the POST'
11. Click "Try out"
12. As this is a simple prototype, remember in the .json, write the right type for each feature:
- Distance_km: float
- Weather: str
- Traffic_Level: str
- Time_of_Day: str
- Vehicle_Type: str
- Preparation_Time_min: int
- Courier_Experience_yrs: float

13. Click "Execute"
14. And below, You are going to see a section that shows You the prediction of the delivery time.
