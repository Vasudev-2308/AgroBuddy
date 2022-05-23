import cv2 
import numpy as np

cv2.namedWindow("preview")

cam = cv2.VideoCapture(0)

cam.set(3, 640)
cam.set(4, 480)


thresh = 0.60
classNames = []

classFile = "objects.names"

with open(classFile,'rt') as f:
    classNames= f.read().rstrip('\n').split('\n')


configPath = "ssd_config_file.pbtxt"
weightsPath = "saved_Model.pb"

net = cv2.dnn_DetectionModel(weightsPath, configPath)
net.setPreferableBackend(cv2.dnn.DNN_BACKEND_OPENCV)
net.setPreferableTarget(cv2.dnn.DNN_TARGET_CPU)

net.setInputSize(320, 320)
net.setInputScale(1.0 / 127.5)
net.setInputMean((127.5, 127.5, 127.5))
net.setInputSwapRB(True)



while True:
    ret, img = cam.read()
    if not ret:
        break
    
    classIds, confidences, bboxes = net.detect(img, confThreshold=thresh)
    if len(classIds) != 0:

        for classId, confidence, box in zip(classIds.flatten(), confidences.flatten(), bboxes):
            label = str(classNames[classId-1])
            
            cv2.rectangle(img, box, (0, 255, 0), 2)
            print(classNames[classId-1], confidence)
            cv2.putText(img, label.upper(),(box[0]+10, box[1]+30), cv2.FONT_HERSHEY_SIMPLEX, 1, (0,255,0),2)

    k = cv2.waitKey(1)
    if k == ord('q'):
        break

    cv2.imshow("preview", img)


 
cam.release()
cv2.destroyAllWindows()