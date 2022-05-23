import cv2 
import numpy as np
cv2.namedWindow("Preview")
cam = cv2.VideoCapture(0)

while cam.isOpened():
    ret, frame1 = cam.read()
    ret, frame2 = cam.read()

    diff = cv2.absdiff(frame1,frame2)

    grey = cv2.cvtColor(diff, cv2.COLOR_BGR2GRAY)

    blur = cv2.GaussianBlur(grey, (5, 5), 0)

    _, thresh = cv2.threshold(blur, 20, 255,cv2.THRESH_BINARY)

    dilated = cv2.dilate(thresh, None, iterations=3)

    contours, _ = cv2.findContours(dilated, cv2.RETR_TREE, cv2.CHAIN_APPROX_SIMPLE)

    for c in contours:
        if cv2.contourArea(c) >= 10000:
            #mask = np.zeros(cam.shape, dtype="np.uint8")
            x,y,w,h = cv2.boundingRect(c)
            cv2.rectangle(frame1,(x,y),(x+w,y+h), (0,255,0),3)
        else:
            continue
    
    if not ret:
        break

    cv2.imshow("Preview", frame1)

    if cv2.waitKey(10)==ord('q'):
        break


cam.release()
cv2.destroyAllWindows()
