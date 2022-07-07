import os
import pickle
import numpy as np 
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.neighbors import KNeighborsClassifier
from sklearn.model_selection import train_test_split
from sklearn.model_selection import RandomizedSearchCV
from sklearn.metrics import accuracy_score, confusion_matrix, ConfusionMatrixDisplay, classification_report

dataset = pd.read_csv("./Crop_recommendation.csv")

X = dataset.drop('label', axis=1)
Y = dataset['label']

X_train, X_test, Y_train, Y_test = train_test_split(X, Y, test_size = 0.2)

KNN_model = KNeighborsClassifier()

KNN_model.fit(X_train,Y_train)

y_pred = KNN_model.predict(X_test)

results = classification_report(Y_test, y_pred)
print(results)

rice_dataset = dataset[dataset["label"] == 'rice']
jute_dataset = dataset[dataset["label"] == 'jute']
dataset_rice_jute = pd.concat([rice_dataset, jute_dataset])


file = open('KNN_model_crop_prediction.pkl', 'wb')
# dump information to that file
pickle.dump(KNN_model, file)
print("Model saved")

