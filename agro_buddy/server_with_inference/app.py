import subprocess
import cv2 
import numpy as np
from flask import Flask, request, Response, render_template
import RPi.GPIO as GPIO
import time
import Adafruit_DHT


class EdgeDevice:

    configPath = "ssd_mobilenet_v3_large_coco_2020_01_14.pbtxt"
    weightsPath = "frozen_inference_graph.pb"

    model = cv2.dnn_DetectionModel(weightsPath, configPath)
    
    GPIO.setwarnings(False)
    GPIO.setmode(GPIO.BCM)

    PIR_input = 17
    Flame_input = 2
    Soil_Moisture_pin = 4
    temp_and_humid_Sensor = Adafruit_DHT.DHT11
    temp_pin = 27
    
    GPIO.setup(Soil_Moisture_pin, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
    GPIO.setup(Flame_input, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)
    GPIO.setup(PIR_input, GPIO.IN, pull_up_down=GPIO.PUD_DOWN)

    def detect_motion(self):
        if GPIO.input(self.PIR_input):
            #subprocess.call("python inference.py", shell=True)
            return True

        # print("Motion Detected")
        else:
            return False
        # print("No Motion Detected")

    def detect_flame(self):
        if GPIO.input(self.Flame_input):
            return False
        # print("No Flame Detected")
        else:
            return True
        # print("Flame Detected")

    def detect_temperature_humidity(self):
        humidity, temperature = Adafruit_DHT.read_retry(self.temp_and_humid_Sensor, self.temp_pin)
        if humidity is not None and temperature is not None:
            return temperature, humidity
        else:
            return 0,0

    def detect_water(self):
        if GPIO.input(self.Soil_Moisture_pin):
            return True
            # print("No Water Detected")
        else:
            return False
            # print("Water Detected")


    
    def runInference(self):
        model = self.model
        cv2.namedWindow("preview")
        cam = cv2.VideoCapture(0)
        thresh = 0.5
        classNames = []

        classFile = "labels.txt"

        with open(classFile,'rt') as f:
            classNames=[line.rstrip() for line in f]

        model.setInputSize(320, 320)
        model.setInputScale(1.0 / 127.5)
        model.setInputMean((127.5, 127.5, 127.5))
        model.setInputSwapRB(True)



        while True:
            ret, img = cam.read()
            if not ret:
                break
            
            classIds, confidences, boxes = model.detect(img, confThreshold=thresh)
            
            if len(classIds) > 0:
                font_scale = 2
                font = cv2.FONT_HERSHEY_PLAIN
                
                for classIdx, conf, bbox in zip(classIds.flatten(), confidences.flatten(), boxes):
                    
                    try:
                        cv2.rectangle(img, bbox, (0, 255, 0), 2)
                        #print(classIdx)
                        cv2.putText(img, classNames[classIdx] , (bbox[0]+10, bbox[1]+30), font, font_scale, (0, 255, 0), thickness=2)
                        return classNames[classIdx]
                    except IndexError:
                        if classIdx > len(classNames):
                            cv2.putText(img, "unknown" , (bbox[0]+10, bbox[1]+30), font, font_scale, (0, 0, 255), thickness=2)

            cv2.waitKey(50000)
            

            cv2.imshow("preview", img)


        
        cam.release()
        cv2.destroyAllWindows()


        # while True:
             

app = Flask(__name__)

@app.route("/")
def getData():
    data = EdgeDevice()
    data_dict = {}
    while True:
        data_dict['motion_status'] = data.detect_motion()
        if data_dict["motion_status"] == True:
            objects = data.runInference()
            data_dict['object'] = objects
        data_dict['flame_status'] = data.detect_flame()
        data_dict['temperature'], data_dict['humidity'] = data.detect_temperature_humidity()
        data_dict['moisture_status'] = data.detect_water()
        time.sleep(10)
        return (data_dict)
        

if __name__ == "__main__":
    app.run(host='0.0.0.0', debug=True, port=8080)
    

    





# class Inference:
#     configPath = "ssd_mobilenet_v3_large_coco_2020_01_14.pbtxt"
#     weightsPath = "frozen_inference_graph.pb"

#     model = cv2.dnn_DetectionModel(weightsPath, configPath)

#     def runInference(self):
#         model = self.model
#         cv2.namedWindow("preview")
#         cam = cv2.VideoCapture(0)
#         thresh = 0.5
#         classNames = []

#         classFile = "labels.txt"

#         with open(classFile,'rt') as f:
#             classNames=[line.rstrip() for line in f]

#         model.setInputSize(320, 320)
#         model.setInputScale(1.0 / 127.5)
#         model.setInputMean((127.5, 127.5, 127.5))
#         model.setInputSwapRB(True)



#         while True:
#             ret, img = cam.read()
#             if not ret:
#                 break
            
#             classIds, confidences, boxes = model.detect(img, confThreshold=thresh)
            
#             if len(classIds) > 0:
#                 font_scale = 2
#                 font = cv2.FONT_HERSHEY_PLAIN
                
#                 for classIdx, conf, bbox in zip(classIds.flatten(), confidences.flatten(), boxes):
                    
#                     try:
#                         cv2.rectangle(img, bbox, (0, 255, 0), 2)
#                         #print(classIdx)
#                         cv2.putText(img, classNames[classIdx] , (bbox[0]+10, bbox[1]+30), font, font_scale, (0, 255, 0), thickness=2)
#                     except IndexError:
#                         if classIdx > len(classNames):
#                             cv2.putText(img, "unknown" , (bbox[0]+10, bbox[1]+30), font, font_scale, (0, 0, 255), thickness=2)

#             k = cv2.waitKey(1)
#             if k == ord('q'):
#                 break

#             cv2.imshow("preview", img)


        
#         cam.release()
#         cv2.destroyAllWindows()



# Inference().runInference()