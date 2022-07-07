# AGROBUDDY

Agrobuddy is an Application built on top of the EdgeAI-Paradigm where we are integrating IoT and Flutter and Controlling hardware devices via our Application. The Project Agrobuddy represents our contribution to the Ag-Tech industry using Edge-AI paradigm. 

The Client Facing application is built using **Flutter** which helps us to build apps from platforms such as 

- **iOS**
- **Android**
- **macOS**
- **Windows**
- **Linux**

## Getting Started

The current module contains various folder and files out of which a few important files and folders for the project are : 

- **lib**
- **ios**
- **android**
- pubspec.yaml 
- **lib**/main.dart



## More about Flutter


Flutter transforms the app development process. It helps us to build, test, and deploy beautiful mobile, web, desktop, and embedded apps from a single codebase. 

Flutter is an open source framework by Google for building beautiful, natively compiled, multi-platform applications from a single codebase.

Flutter helps us by being 

1. Fast 
2. Productive 
3. Flexible 

#### Flutter uses Dart. 

- **What is Dart?** 

    Dart is a programming language designed for client development, such as for the web and mobile apps. It is developed by Google and can also be used to build server and desktop applications.


## More about Folders and Files 


#### lib: 
It is **THE** most important folder containing application, logic and services and its code. The entry point to our application is the **_main.dart_** file in our lib directory. the _runApp()_ method inside _void main()_ makes sure that our app runs on the target devices. 

- Inside the lib folder there are various sub folders such as **_Logic_, _Models_, _Screens_, _Services_, _UI_**

    - Logic: This Folder contains all the application and business logic pertaining to transactions such as fetching data from api, sending data to api, etc. 
    - Models: This folder contains data models in the form as required by the api. It also is responsible for managing states of the application. For the current project, we are using **provider** as a state management solution. 
    - Screens: This folder contains all the screens designed and coded in dart. It further follows a pagination method therefore the main application screen are inside _BottomNavBarPages_ sub folder. 
    - Services: This folder contains services that are invoked when particular action happens in the backend. 
    - UI: Custom built UI components are stored in this folder. 

#### lib/main.dart: 
    
This file is an entry point to application and is **required**. 

#### android: 

This folder is important if we need to change or reconfigure our android device settings and alter the _build.gradle_ or manifest files such as _AndroidManifest.xml_ 

#### ios: 

This folder is important if we need to change or reconfigure our ios device settings and alter the _info.plist_ or Runner files and Pods. 



### How to execute the module: 

1. Install and Setup flutter from https://docs.flutter.dev/get-started/install

2. Setup an Editor from https://docs.flutter.dev/get-started/editor?tab=androidstudio

3. Clone the Repository 
    
        $ https://github.com/Vasudev-2308/agrobuddy_ui.git

4. Go to the Project Directory 

        $ cd agro_buddy_ui/agro_buddy

5. Run the application: After setting up an emulator from AVD manager or turning on USB Debugging from _Developer Options_ and selecting your device as target device, run the following command 

        $ flutter run 


**This project has been successfully presented to stake holders and approved. Will be writing testing code, and making it deployable and scalabe for the future**


#### A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


### Future Developments: 

This project is built just on POC level therefore the application is not tested. In the future we would try to make it more robust, responsive and interactive. We would also perform various unit, integration and interactive testing to make a secure and scalable application which is deployment and release ready. 

