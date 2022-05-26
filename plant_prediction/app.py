from flask import Flask, render_template, request
import pickle
import numpy as np

app = Flask(__name__)
model = pickle.load(open('KNN_model_crop_prediction.pkl', 'rb'))

@app.route('/')
def home():
    return render_template('basic.html')


@app.route('/predict', methods=['POST'])
def predict():

    features = []
    n_val = request.form.get('n_val')
    p_val = request.form.get('p_val')
    k_val = request.form.get('k_val')
    temp_val = request.form.get('temp_val')
    hum_val = request.form.get('humid_val')
    ph_val = request.form.get('ph_val')
    rf_val = request.form.get('rf_val')


    

    features.append(float(n_val))  # type: ignore
    features.append(float(p_val))  # type: ignore
    features.append(float(k_val))  # type: ignore
    features.append(float(temp_val)) # type: ignore
    features.append(float(hum_val)) # type: ignore
    features.append(float(ph_val)) # type: ignore
    features.append(float(rf_val)) # type: ignore

    
    
    
    
    final_features = [np.array(features)]
    
    prediction = model.predict(final_features)
    output = prediction[0]

    return render_template('basic.html', prediction_text='Crop will be {}'.format(output))



if __name__ == "__main__":
    app.run(debug=True, port=8080, host='0.0.0.0')