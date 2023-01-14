from fastapi import FastAPI
from pydantic import BaseModel
from app.model.model import predict


app = FastAPI()


class Input(BaseModel):
    precipitation: float
    wind: float
    temp_max: float
    temp_min: float   


class PredictionOut(BaseModel):
    weather: str


@app.get("/")
def home():
    return {"health_check": "OK"}

@app.post("/predict")
def WeatherResult(payload: Input):
    temp_avg = (payload.temp_max + payload.temp_min) / 2
    weather = predict(payload.precipitation, payload.wind, temp_avg)
    return {"Result": weather}