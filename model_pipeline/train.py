from pathlib import Path
import joblib
import pandas as pd

from sklearn.model_selection import train_test_split    #All the dependencies that We need
from sklearn.compose import ColumnTransformer
from sklearn.pipeline import Pipeline
from sklearn.impute import SimpleImputer
from sklearn.preprocessing import OneHotEncoder
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_absolute_error, mean_squared_error, r2_score


def main():
    #Defining the paths, so the variables can reach to the right place, and the file.joblib as well
    root = Path(__file__).resolve().parent
    dataset = root / "Food_Delivery_Times.csv"
    output_model_path = root / "best_model.joblib"

    #We load the .csv
    df = pd.read_csv(dataset)

    #Define target (Y) and features
    y = df["Delivery_Time_min"]
    X = df.drop(columns=["Delivery_Time_min", "Order_ID"]) #Variables that aren't relevant

    #We divide the feature groups
    categorical_feat = ["Weather", "Traffic_Level", "Time_of_Day", "Vehicle_Type"] #They usually are strings
    numerical_feat = ["Distance_km", "Preparation_Time_min", "Courier_Experience_yrs"] #Numerical values

    #The, We split the dataset into training and testing sets (Good Practices tho)
    X_train, X_test, y_train, y_test = train_test_split(
        X, y, test_size=0.2, random_state=42
    )

    #Preprocessing for numerical features (In order to fill empty values with the median)
    numerical_transf = Pipeline(steps=[
        ("imputer", SimpleImputer(strategy="median"))
    ])

    #Preprocessing for categorical features (In order to fill empty values with the most frequent value, and vectorize the strings)
    categorical_transf = Pipeline(steps=[
        ("imputer", SimpleImputer(strategy="most_frequent")),
        ("onehot", OneHotEncoder(handle_unknown="ignore"))
    ])

    #In this part, It is combining both preprocessing
    preprocessor = ColumnTransformer(transformers=[
        ("num", numerical_transf, numerical_feat),
        ("cat", categorical_transf, categorical_feat)
    ])

    #Our final model pipeline
    model_pipeline = Pipeline(steps=[
        ("preprocessor", preprocessor),
        ("model", LinearRegression())
    ])

    #This trains the model with the other 80% of the dataset
    model_pipeline.fit(X_train, y_train)

    #With this can test the prediction of the model, using the 20% of the dataset, in order that It is more efficient
    predictions = model_pipeline.predict(X_test)

    #This variables are going to save the results in order to see the accuracy (r2), and the error values of the model
    mae = mean_absolute_error(y_test, predictions)
    rmse = mean_squared_error(y_test, predictions) ** 0.5
    r2 = r2_score(y_test, predictions)

    #Just basic printing to see the values
    print("Final model: Linear regression")
    print(f"MAE= {mae:.2f}")
    print(f"RMSE= {rmse:.2f}")
    print(f"R2= {r2:.2f}")

    #This help us to save the training model, in order that It can be used in 'predict.py'
    joblib.dump(model_pipeline, output_model_path)

if __name__ == "__main__":
    main()