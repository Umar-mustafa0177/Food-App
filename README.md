
# 🍔 Foodie - Advanced Food Ordering Application

Foodie is a modern, high-performance food delivery application built with Flutter and Firebase. This project was developed as a **Mobile Application Development Semester Project**, evolving from a basic prototype into an advanced ordering system with real-time backend integration.


## 🚀 Key Features

* **Advanced Splash Screen:** A clean, branded experience with a 4-second delay and smooth logo transitions.
* **Firebase Authentication:** Secure user identity management including Login and Sign-Up (Email & Password).
* **Smart Auth Gate:** Automatically detects user session state to redirect between Home and Login screens seamlessly.
* **Password Recovery:** Integrated "Forgot Password" functionality that sends reset links via Firebase.
* **Interactive Registration:** Features a bouncy success animation and confirmation dialog after account creation.
* **Haptic Feedback:** Physical touch sensations (vibrations) on button interactions for a premium feel.


## 🍱 Menu Categories
The application is organized into several food categories with dedicated assets and logic:

* 🍔 **Burgers** - A wide variety of gourmet burger options.
* 🍰 **Desserts** - Sweet treats, cakes, and pastries.
* 🥤 **Drinks** - Refreshing beverages and juices.
* 🥗 **Salads** - Healthy, fresh, and organic salad choices.
* 🍟 **Sides** - Appetizers, fries, and snacks.

---

## 🛠️ Tech Stack & Dependencies

This project utilizes the following advanced Flutter packages:

| Package                 | Purpose                                                 |
|:------------------------|:--------------------------------------------------------|
| `firebase_auth`         | Secure user authentication and session management.      |
| `cloud_firestore`       | Real-time NoSQL database for menu items and user data.  |
| `avatar_glow`           | Beautiful glowing animations for the branding elements. |
| `flutter_native_splash` | Native boot-screen management for Android and iOS.      |
| `provider`              | Efficient state management across the application.      |
| `flutter_credit_card`   | Professional UI for credit card entry and management.   |


## 📂 Project Directory Structure

lib/
├── components/       # Reusable UI elements (Buttons, Textfields, Drawers)
├── images/           # High-quality assets (Burgers, Drinks, Splash_logo.png)
├── pages/            # App screens (Login, Register, Splash, Home, Settings)
├── services/         # Firebase Auth, Firestore Database logic, and Auth Gate
└── themes/           # Custom Light and Dark mode styling



## 💻 Installation & Local Setup

### 1. Prerequisites

* [Flutter SDK](https://docs.flutter.dev/get-started/install) installed.
* [Node.js](https://nodejs.org/) (required for Firebase CLI).
* Firebase Tools installed (`npm install -g firebase-tools`).

### 2. Clone the Repository

```bash
git clone [https://github.com/Umar-mustafa0177/Food-App.git](https://github.com/Umar-mustafa0177/Food-App.git)
cd Food-App


### 3. Install Dependencies

```bash
flutter pub get


### 4. Firebase Configuration

* Run `flutterfire configure` to link your local project with your Firebase Console.
* Ensure the `google-services.json` (Android) and `GoogleService-Info.plist` (iOS) files are generated in the correct directories.

### 5. Run the Project

```bash
flutter run



## 📝 Recent Version Updates

* **Refined Splash Logic:** Increased timer to 4s for better brand visibility.
* **Enhanced Register Page:** Added success dialog and automatic redirection.
* **Improved UI:** Optimized logo placement and removed unnecessary glow for a cleaner look.
* **Project Organization:** Migrated auth logic to specialized service folders.

---

**Developed with ❤️ by [Umar Mustafa**](https://www.google.com/search?q=https://github.com/Umar-mustafa0177)

