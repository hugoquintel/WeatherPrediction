from pathlib import Path
import pickle

BASE_DIR = Path(__file__).resolve(strict=True).parent
with open(f"{BASE_DIR}/predict.pkl", "rb") as f:
    clf = pickle.load(f)
with open(f"{BASE_DIR}/scale.pkl", "rb") as g:
    sc = pickle.load(g)

def predict(precipitation, wind, temp_avg):
    input = [precipitation, wind, temp_avg]
    input = sc.transform([input])
    result = clf.predict(input)

    if result == 0:
        return "drizzle"
    elif result == 1:
        return "fog"
    elif result == 2:
        return "rain"
    elif result == 3:
        return "snow"
    elif result == 4:
        return "sun"