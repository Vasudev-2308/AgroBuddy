# Getting Started with Crop Recommender Module

Crop recommender is a module built to recommend the best possible crop to a user based on the soil conditions. 


The user needs to provide a few details such as 

- Nitrogen (N)
- Phosphorus (P)
- Potassium (K)
- Temperature of the Region 
- Humidity 
- Ph of Soil 
- Rainfall (mm)


<br>
The current module is a directory containing various files (including cache files and checkpoints) and folders. The most useful details from the current directory are:

1. app.py : Contains the Flask Script to Receive inputs from user as a *GET* request and send out a suitable crop to the user as a response.
2. Crop_recommendation.csv (Dataset)
3. KNN_model_crop_prediction.pkl (Trained Model Dumped in Pickle file)
4. model.py : Python Script to create a model using KNN and dump into a pickle file



## More information about the algorithm being used: 

Since the task was to classify the best crop to be grown based on the input values, the K-Nearest Neighbour Algorithm for machine learning was used. 

- ### Reasons behind K-NN 
  - K-Nearest Neighbour is one of the simplest Machine Learning algorithms based on Supervised Learning technique.
  - K-NN algorithm assumes the similarity between the new case/data and available cases and put the new case into the category that is most similar to the available categories.
  - K-NN algorithm stores all the available data and classifies a new data point based on the similarity. This means when new data appears then it can be easily classified into a well suite category by using K- NN algorithm.
  - K-NN algorithm can be used for Regression as well as for Classification but mostly it is used for the Classification problems.
  - K-NN is a non-parametric algorithm, which means it does not make any assumption on underlying data.
  - It is also called a lazy learner algorithm because it does not learn from the training set immediately instead it stores the dataset and at the time of classification, it performs an action on the dataset.
  - KNN algorithm at the training phase just stores the dataset and when it gets new data, then it classifies that data into a category that is much similar to the new data.


## More about the Dataset 

Precision agriculture is in trend nowadays. It helps the farmers to get informed decision about the farming strategy. Here,the dataset contains various useful metrics such as **N**, **P**, **K**,**Temperature**, **Humidity**, **PH**, **Rainfall** which would help us build a predictive model  to recommend the most suitable crops to grow in a particular farm based on various parameters.

- ### Context 
  - This dataset was build by augmenting datasets of rainfall, climate and fertilizer data available for India (The data and results may vary from country to country).



## How to run the module:
   
The module contains a trained model using K-NN algorithm that has been trained on a dataset via supervised learning. The model is dumped on a pickle file called ***KNN_model_crop_prediction.pkl***. 

You may download or clone the module to get the hang of the model. 

## Running the Application: 

   To get the application up and running and inorder to access the model via GUI, the server side script has been written using **Flask**. The model is hosted on ***Heroku*** following the RESTAPI practices. 


- #### What is Flask and Why Flask ? 
    - Flask is a web framework that provides libraries to build lightweight web applications in python.
    <br>
    -  It is based on WSGI toolkit and jinja2 template engine. Flask is considered as a micro framework.

<br>


## Further Developments: 

1. Since the current model is best suitable for conditions in India, it would be better if we could provide solution that cater to a world wide audience. 

2. Since the module is hosted on Heroku, there might be possibilities of delay in response due to network issues or from Heroku's side. Therefore hosting it on a dedicated device with low latency could be another option for development. 