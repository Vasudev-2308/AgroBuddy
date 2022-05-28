import json

from flask import Flask,jsonify, request
import pickle
import numpy as np

app = Flask(__name__)
model = pickle.load(open('KNN_model_crop_prediction.pkl', 'rb'))


response = ''
@app.route('/crop_recommender', methods=['POST', 'GET'])
def predict():
    global response
    features = []
    if request.method == 'POST':
        # print("Got VALUES")
        request_data = request.data
        request_data = json.loads(request_data.decode('utf-8'))

        n_val = float(request_data['n_val'])
        p_val = float(request_data['p_val'])
        k_val = float(request_data['k_val'])
        temp_val = float(request_data['temp_val'])
        hum_val = float(request_data['hum_val'])
        ph_val = float(request_data['ph_val'])
        rf_val = float(request_data['rf_val'])
        
        print(n_val, p_val, k_val, temp_val, hum_val, ph_val, rf_val)
        features.append(n_val)  # Nitrogen
        features.append(p_val)  # Phosphorus
        features.append(k_val)  # Potassium
        features.append(temp_val) # Temperature
        features.append(hum_val) # Humidity
        features.append(ph_val) # Ph
        features.append(rf_val) # Rainfall
        final_features = [np.array(features)]
        prediction = model.predict(final_features)
        output = prediction[0]
        response = output.upper()
        print(response)

        return " "
        
    else:
        # print("Sending Values")
        return jsonify(dict(response=response))




if __name__ == "__main__":
    app.run(debug=True, port=8080, host='0.0.0.0')