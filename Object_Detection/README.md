# Getting Started with the Object Detection 

Object recognition is a general term to describe a collection of related computer vision tasks that involve identifying objects in digital photographs.

Image classification involves predicting the class of one object in an image. Object localization refers to identifying the location of one or more objects in an image and drawing abounding box around their extent. Object detection combines these two tasks and localizes and classifies one or more objects in an image.

Object Detection is one of the inference module in the project **Agrobuddy**. 

Expanding on Edge-AI we have 

    EdgeAI = IoT Device on Egde + Inference (AI)


## <u>Folder Structure</u>

The Folder contains 4 important files for the inference module to work. They are: 

1. **inference.py**: This is a python script that contains the code to run the object detection module. The module uses **Computer Vision** and low level image processing to ***draw bounding boxes*** on objects appearing infront of the camera module and then detect objects using **SSD Mobinet** pretrained weights to detect objects.
2. **labels.txt**: This file contains 80+ labels for objects based on the **COCO Dataset**. This file will be further loaded to determine the object title that needs to be returned. 
3. **ssd_mobilenet_v3_large_coco_2020_01_14.pbtxt**: The mobilenet-ssd model is a Single-Shot multibox Detection (SSD) network, intended to perform object detection. In simple words this file is a pre-trained Tensorflow model and has already been trained on the COCO dataset. This model is implemented using the Caffe* framework. For details about this model, check out the repository. The model input is a blob that consists of a single image of 1, 3, 300, 300 in BGR order, also like the densenet-121 model. 
4. **frozen_inference_graph.pb**: Freezing is the process to identify and save all of required things(graph, weights etc) in a single file that you can easily use. Frozen graphs are commonly used for inference in TensorFlow and are stepping stones for inference for other frameworks.



## More about SSD Mobinet : 

MobilenetSSD is an object detection model that computes the bounding box and category of an object from an input image. This Single Shot Detector (SSD) object detection model uses Mobilenet as backbone and can achieve fast object detection optimized for mobile devices. 

MobilenetSSDtakes a (3,300,300) image as input and outputs (1,3000,4) boxes and (1,3000,21) scores. Boxes contains offset values (cx,cy,w,h) from the default box. Scores contains confidence values for the presence of each of the 20 object categories, the value 0 being reserved for the background.


  - #### Internal Configuration MobinetSSD:
        image_size = 300
        image_mean = np.array([127, 127, 127]) # RGB layout
        image_std = 128.0
        iou_threshold = 0.45
        center_variance = 0.1
        size_variance = 0.2

        specs = [
        SSDSpec(19, 16, SSDBoxSizes(60, 105), [2, 3]),
        SSDSpec(10, 32, SSDBoxSizes(105, 150), [2, 3]),
        SSDSpec(5, 64, SSDBoxSizes(150, 195), [2, 3]),
        SSDSpec(3, 100, SSDBoxSizes(195, 240), [2, 3]),
        SSDSpec(2, 150, SSDBoxSizes(240, 285), [2, 3]),
        SSDSpec(1, 300, SSDBoxSizes(285, 330), [2, 3])
        ]


In SSD, after extracting the features using an arbitrary backbone, the bounding boxes are calculated at each resolution while reducing the resolution with Extra Feature Layers. MobilenetSSD will concatenate the output of the six levels of resolution and calculate a total of 3000 bounding boxes, and finally, filter out bounding boxes using non-maximum suppression (nms).


## Understanding the Code: 

1. **The .dnn_DetectionModel()** : It is a deep neural network model that helps in loading a pretrained model, (ssd-mobilenet in our case). The DNN module allows loading pre-trained models of most popular deep learning frameworks, including Tensorflow, Caffe, Darknet, Torch.

2. **What is a bbox?** 
The b in bbox is for bounding. Bounding boxes can be useful as standalone shapes, but they are primarily used for approximating more complex shapes to speed operations.

3. **Why are we using the .flatten() ?**
Flattening lists in python means converting multidimensional lists into one-dimensional lists. It is basically a method of merging all the sublists of a nested list into one unified list.

As we now know that coco.names has 80 object categories, we need to a way to retrieve these names so that we can use them. This is where we can use file handling and string methods. We read our file using f.read(), remove or strip the spaces on the right-side of words using .rstrip(\n) and separated words by breaking lines where there is space using split(\n). Refer to string methods to get a proper grasp on these concepts.

## How to get the Module working ? 

1. Download or Clone the Repository

2. Make sure you have the correct version of python installed i.e. (python 3.7.x). 

3. Install Open-CV libraries on the device using the following command 

        $ pip install opencv-python opencv-contrib-python numpy 

4. Run the inference.py file:
    
        $ python inference.py 


## Further Developments: 

The biggest drawback of the SSD framework is the fact that its performance is directly proportional to object sizes meaning that it doesn’t fare too well on object categories with small sizes as compared to other approaches such as the family of R-CNNs. Further More, the MobileNet has accuracy 65% in 100 epochs where as the The ResNet-50 has accuracy 81% in 30 epochs. Therefore to make it more accurate, we would try and replace from Mobinet to Resnet.




