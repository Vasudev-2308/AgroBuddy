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

    features = [x for x in request.form.values()]
    #final_features = [np.array(list(features))]
    
    # prediction = model.predict(final_features)
    # output = prediction[0]

    return render_template('basic.html', prediction_text='Crop will be {}'.format(features))



if __name__ == "__main__":
    app.run(debug=True, port=8080, host='0.0.0.0')