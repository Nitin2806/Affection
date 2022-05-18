<div id="top"></div>
<h1 align="center">
  <br>
  <a href="https://github.com/Nitin2806/Affection"><img src="https://github.com/Nitin2806/Affection/blob/main/assets/images/affection.png" alt="Affection" width="200"></a>
  <br>
  Affection
  <br>
</h1>
<h4 align="center">A Social Friendly app built on <a href="https://flutter.dev/" target="_blank">Flutter</a></h4>


<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <!-- <ul>
        <li><a href="#built-with">How to use</a></li>
      </ul> -->
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <!-- <li><a href="#installation">Installation</a></li> -->
      </ul>
    </li>
    <!-- <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li> -->
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

## About The Project

A Flutter project for Building Friendly Social Application to connect with People around.Building up all necessary functionalities for designing the application which helps people to look for thier affection.


### Built With

This section should list any major frameworks/libraries used to bootstrap your project. Leave any add-ons/plugins for the acknowledgements section. Here are a few examples.

* [Flutter](https://flutter.dev/)

<p align="right">(<a href="#top">back to top</a>)</p>

## Getting Started

### Prerequisites


### Installation and Setup Guide

To clone and run this application, you'll need [Git](https://git-scm.com) , [Flutter](https://docs.flutter.dev/get-started/install)and [Dart](https://dart.dev/) installed on your computer. From your command line:

```bash
# Clone this repository
$ git clone https://github.com/Nitin2806/affection

# Go into the repository
$ cd affection

# Install dependencies
$ flutter pub get

# Run the app
$ flutter run (Choose your device)
```

Note: If you're using Linux Bash for Windows, [see this guide](https://www.howtogeek.com/261575/how-to-run-graphical-linux-desktop-applications-from-windows-10s-bash-shell/)

### Firebase 

- Create a new Project

![Sign In](/assets/firebase/overview.jpg) 

- Set Firestore Database Rules

```
rules_version = '2';
service cloud.firestore {
  match /databases/{database}/documents {
    match /{document=**} {
      allow read, write
    }
  }
}

```
- Enable Sign-in  methods to Email/Password

![Sign In](/assets/firebase/signinmethods.jpg) 
- Create a new android project

- Add `google-services.json` file to android root directory of project `/android/app/`

- Create a web project
- Add Configuration to project ` main.dart ` file






<!-- CONTACT -->
## Contact

### **Nitin Mishra**

[Twitter](https://twitter.com/Nitin_mishra_) 

Gmail - (mnitin2311@gmail.com)


Project Link : [Affection](https://github.com/Nitin2806/affection)

<p align="right">(<a href="#top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

Google and Stackoverflow

<p align="right">(<a href="#top">back to top</a>)</p>