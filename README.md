# Blood Donation App

![alt text](<Group 12.jpg>)

A Flutter-based mobile application that connects blood donors with hospitals in need. This app aims to streamline the blood donation process, making it easier for donors to find donation opportunities and for hospitals to manage their blood supply.

## Key Features

### For Donors:

- **User-friendly registration and login:** Donors can easily create an account and log in.
- **Profile management:** Donors can view and update their profile information.
- **View donation requests:** Donors can see a list of donation requests from hospitals.
- **Real-time notifications:** Donors receive notifications about urgent donation needs.
- **Direct communication:** Donors can be contacted directly by hospitals for donation requests.

### For Hospitals:

- **Secure registration and login:** Hospitals can register and log in to the app.
- **Post donation requests:** Hospitals can create and post new blood donation requests.
- **View available donors:** Hospitals can see a list of available donors and their blood types.
- **Directly call donors:** Hospitals can initiate a phone call to a donor directly from the app.
- **Manage donation requests:** Hospitals can view and manage their active donation requests.

## Technologies Used

- **Flutter:** For building the cross-platform mobile application.
- **Firebase:**
  - **Firebase Authentication:** For user authentication (email/password).
  - **Cloud Firestore:** As the backend database to store user data and donation requests.
- **GetX:** For state management and navigation.
- **Shared Preferences:** For local storage.
- **Flutter SVG:** For rendering SVG images.
- **Flutter Phone Direct Caller:** To initiate phone calls from the app.

## Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

- Flutter SDK: [https://flutter.dev/docs/get-started/install](https://flutter.dev/docs/get-started/install)
- A code editor like VS Code or Android Studio.
- An Android or iOS emulator/device.

## Folder Structure

```
lib/
├── assets/
├── donor/
│   ├── tabs/
│   └── donorHome.dart
├── Hospital/
│   ├── screens/
│   └── hospitalHomeScreen.dart
├── services/
│   └── firebaseServices.dart
├── widgets/
├── app_pages.dart
├── donorOrHospital.dart
├── firebase_options.dart
├── login.dart
├── main.dart
├── signup_detailes.dart
├── signup_details2.dart
├── signup.dart
├── slidder.dart
├── splash.dart
└── success.dart
```
