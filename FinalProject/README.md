# Overview
This is a machine learning model api built with fastapi for predicting weather. The input includes:
* precipitation
* wind
* temp_max
* temp_min

***The input must be in that order for the model to work properly***

This api can be tested with Postman using 'Post' method with the following url: http://127.0.0.1:8000/predict

# API Running
1. Build ML models:
<my_model>.py                 
<- Script to train the model offline and create spam_detector_model.pkl and vectorizer.pkl

```
cd to folder of <my_model>.py
python <my_model>.py
```
e.g: 
```
python offline_training.py
```
2. Start our application using uvicorn Uvicron tool is pointed to the FastAPI instance to serve the app

```
uvicorn <file.py>:<FastAPI instance> --port <which port the app will be served on> --reload

uvicorn app:app --port 8000 --reload # reload will auto updated code changes to server
```

**Issue note**
If you encounter this error ERROR: Error loading ASGI app. Could not import module "api". It means you are not in the same folder with your FastAPI app instance while you run the uvicorn.

3. Send a predict request to API server
```
curl -X 'POST' \
  'http://127.0.0.1:8000/predict_sentiment?text_message=happy%20day' \
  -H 'accept: application/json' \
  -d ''
```




```

