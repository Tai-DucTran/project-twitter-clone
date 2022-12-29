# finalproject

- Project Name: Final Project - Clone Twitter Application
- Project Description:
This is my first project after over 1 week learning flutter/dart/firebase. Honestly, I faced a lot of challenges but the experience is amazing.
I've been developing a clone twitter application with a minimize features suchs as:

    # successful development:
    -using Firebase Authentication to register, log-in and verify-email by email and password.
    -a nice UI
    -a tweet icon
    -a add_tweet page with 280 words

    # fail development:
    -using Firebase Storre to collect user data, tweet data..
    -create a draft tweet feature
    -user profile interface
    -twitter newsfeed.

## Getting Started
# Installation:
This project used: Flutter SDK, Dart, Firebase Auth
- dependencies:   
    firebase_core: ^2.4.0
    firebase_auth: ^4.2.3
    cloud_firestore: ^4.3.0
    firebase_analytics: ^10.0.8

- simulator: iPhone 14 ProMax - version iOS 16.2

- IDE: VSCode

- project file structure:
    -lib/main: main.dart to run the application

    -lib/views: these views are view_screens of each step such as login, 
    register, verify email, twitter app view, tweet.

    -lib/utilities: show_error_dialog

    -lib/constants: routes (contains all routes)

    -lib/emums: menu having logout function

    -lib/services/auth: relative aut files 

    -assets/images/: logo.png

## screenflow of the core user flow:

1. User hasn't signed up yet
    - The user goes to the Register View to sign up for your account.
    - The app requests the user to verify the email.
    - Firebase Auth sends a verification email to the user.
    - After verifying the account, the use can log in.
    - In the main UI, the user can click on the 'tweet' icon on the right of the bottom to go to the 'Add Tweet'
    - The user can write the tweet with 280 words limited.
    - Press the 'cancel' TextButton to cancel and return to the HomePage.
    - Press the icon button on the right of the top to log out
    
2. User signed up already and can login:
    - The process is the same as the first one.
    
A screenflow of the core user flows by images: 
click on this link to view: https://bit.ly/3hR0Lxg
    
