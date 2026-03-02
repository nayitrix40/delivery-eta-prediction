from pathlib import Path
import joblib
import pandas as pd


def main():
    #Defining the paths
    root = Path(__file__).resolve().parent
    model_path = root / "best_model.joblib"

    #This load our trained model
    model = joblib.load(model_path)

    #In this case We cretae an example for a new delivery data
    test_data = pd.DataFrame([{
        "Distance_km": 8.0,
        "Weather": "Rainy",
        "Traffic_Level": "High",
        "Time_of_Day": "Evening",
        "Vehicle_Type": "Scooter",
        "Preparation_Time_min": 25,
        "Courier_Experience_yrs": 3.0
    }])

    #And finally, make the prediction
    prediction = model.predict(test_data)

    print("Predicted Delivery Time (minutes):", round(prediction[0], 2))

if __name__ == "__main__":
    main()