#Libraries and dependencies
from pathlib import Path
import joblib
import pandas as pd
from fastapi import FastAPI
from pydantic import BaseModel

#This creates the FastAPI app
app = FastAPI(title="Delivery ETA-prediction api")

#Loads the trained model
root_ofProject = Path(__file__).resolve().parent
model_path = root_ofProject / "best_model.joblib"
model = joblib.load(model_path)

#This is important!, define the expected input structure, and Pydantic helps that the request contains the 
#correct fields and data types as well.
class Deliverydetails(BaseModel):
    Distance_km: float
    Weather: str
    Traffic_Level: str
    Time_of_Day: str
    Vehicle_Type: str
    Preparation_Time_min: int
    Courier_Experience_yrs: float

#The basic root endpoint
#With a confirmartion message that the api is running without issues
@app.get("/")
def root():
    return {"message": "Delivery ETA-prediction api is running"}

#And here We have our prediction enpoint
#This receive all delivery details, dataframe conversion, sends to the trained model
#and finally returns the estimated delivery time
@app.post("/predict")
def predict_delivery_time(request: Deliverydetails):
    input_data = pd.DataFrame([{
        "Distance_km": request.Distance_km,
        "Weather": request.Weather,
        "Traffic_Level": request.Traffic_Level,
        "Time_of_Day": request.Time_of_Day,
        "Vehicle_Type": request.Vehicle_Type,
        "Preparation_Time_min": request.Preparation_Time_min,
        "Courier_Experience_yrs": request.Courier_Experience_yrs
    }])

    prediction = model.predict(input_data)[0]

    return {
        "predicted_delivery_time_min": round(float(prediction), 2)
    }