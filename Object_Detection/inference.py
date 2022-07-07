import cv2 
import numpy as np

cv2.namedWindow("preview")

cam = cv2.VideoCapture(0)

thresh = 0.5
classNames = []

classFile = "labels.txt"

with open(classFile,'rt') as f:
    classNames=[line.rstrip() for line in f]


configPath = "ssd_mobilenet_v3_large_coco_2020_01_14.pbtxt"
weightsPath = "frozen_inference_graph.pb"

model = cv2.dnn_DetectionModel(weightsPath, configPath)

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
            except IndexError:
                if classIdx > len(classNames):
                    cv2.putText(img, "unknown" , (bbox[0]+10, bbox[1]+30), font, font_scale, (0, 0, 255), thickness=2)

    k = cv2.waitKey(1)
    if k == ord('q'):
        break

    cv2.imshow("preview", img)


 
cam.release()
cv2.destroyAllWindows()