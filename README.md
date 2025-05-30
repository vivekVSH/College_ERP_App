# College_ERP_App
College ERP App
Overview
The College ERP App is a cross-platform application built with Flutter, designed to manage college-related tasks for students, teachers, and admins. It features 16 modules (e.g., Academics, Notification, Timetable) accessible via a dashboard, with role-based authentication. The app runs on Android, iOS, and web.
Features

Role-Based Authentication: Supports Student, Teacher, and Admin roles.
Dashboard: Grid of cards to navigate to 16 modules.
Modules: Includes Academics, Accounts, Admission, Assignment, Certificate, Event, Examination, Feedback, Grievance, Hostel, Notification, Project Monitoring, Quiz, Registration, Resource Sharing, and Timetable.
Cross-Platform: Runs on Android, iOS, and web (e.g., Chrome).

Prerequisites

Flutter: Version 3.0.0 or higher. Install from flutter.dev.
Dart: Included with Flutter.
Google Chrome: For running the app on the web.
Code Editor: VS Code or Android Studio recommended.
Git: To clone or manage the project (optional).

Project Structure
college_erp_app/
├── lib/
│   ├── main.dart              # Entry point, sets up theme and routes
│   ├── services/
│   │   └── auth_service.dart  # Authentication logic
│   ├── screens/               # 18 screens (login, dashboard, 16 modules)
├── test/
│   └── widget_test.dart       # Basic widget test
├── pubspec.yaml               # Dependencies and metadata
├── analysis_options.yaml      # Linting rules

Setup Instructions

Clone or Extract the Project  

If you have the project ZIP, extract it to a folder (e.g., college_erp_app).
Alternatively, clone the repository (if hosted on Git):  git clone <repository-url>
cd college_erp_app




Install Flutter and Dependencies  

Ensure Flutter is installed:flutter --version

If not installed or outdated, follow Flutter installation guide.
Enable web support:flutter config --enable-web




Fetch DependenciesNavigate to the project directory and fetch dependencies:
cd college_erp_app
flutter pub get


Generate Web FilesFor web deployment, generate necessary web files:
flutter create .



Running the App
On Web (Chrome)

Run in Debug Mode  
flutter run -d chrome


Chrome will open with the app (e.g., at http://localhost:8080).
Log in using demo credentials (see below).


Build a Release Version (Optional)For better performance:
flutter build web
cd build/web
python -m http.server 8000

Open Chrome and go to http://localhost:8000.


On Android/iOS

Connect a device or start an emulator/simulator.
Run:flutter run


Usage

Log in with demo credentials.
Explore the dashboard with a grid of cards for 16 modules.
Click a module (e.g., Notification) to view details or interact (e.g., mark as read).

Troubleshooting

Errors on Run: Run flutter analyze to catch issues. Ensure all files match the project structure.
Blank Screen in Chrome: Check Chrome’s developer console (F12 → Console) for errors. Rebuild with flutter clean and flutter run -d chrome.
Flutter Version: Ensure Flutter is >=3.0.0 (flutter upgrade if needed).

Future Enhancements

Add a Firebase backend for real-time data.
Implement role-based features and push notifications.
Improve web responsiveness for larger screens.

Author
Developed by Vivek as a Flutter project for college management.

Contact with : Email :handevivek942@gmail.com
Contact No: 7517033784
