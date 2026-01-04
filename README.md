# mynew_project

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.



//for firebase 
1st run 
npm install -g firebase-tools
for this we have to install node js in our system

2nd command
firebase login


3rd command
flutter pub global activate flutterfire_cli

add the given path to environement variables

4th command
flutterfire configure


select android and ios 

Platform  Firebase App Id
android   1:378512711826:android:e9faf6b36beacd8efa864b
ios       1:378512711826:ios:db1ea7f37ec42267fa864b


flutter pub add firebase_core

now create a new folder services in lib
move auth folder to services 

after all firebaser email etc 

now for tehe firestore databser 
1st command
flutter pub add cloud_firestore