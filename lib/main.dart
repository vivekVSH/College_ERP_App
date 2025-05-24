import 'package:flutter/material.dart';
import 'screens/login_screen.dart';
import 'screens/dashboard_screen.dart';
import 'screens/academics_screen.dart';
import 'screens/accounts_screen.dart';
import 'screens/admission_screen.dart';
import 'screens/assignment_screen.dart';
import 'screens/certificate_screen.dart';
import 'screens/event_screen.dart';
import 'screens/examination_screen.dart';
import 'screens/feedback_screen.dart';
import 'screens/grievance_screen.dart';
import 'screens/hostel_screen.dart';
import 'screens/notification_screen.dart';
import 'screens/project_monitoring_screen.dart';
import 'screens/quiz_screen.dart';
import 'screens/registration_screen.dart';
import 'screens/resource_sharing_screen.dart';
import 'screens/timetable_screen.dart';

void main() {
  runApp(const CollegeERPApp());
}

class CollegeERPApp extends StatelessWidget {
  const CollegeERPApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'College ERP System',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: const Color(0xFF1976D2),
        scaffoldBackgroundColor: const Color(0xFFF5F5F5),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF1976D2),
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        cardTheme: const CardTheme(
          elevation: 4,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        ),
      ),
      home: const LoginScreen(),
      routes: {
        '/login': (context) => const LoginScreen(),
        '/dashboard': (context) => const DashboardScreen(),
        '/academics': (context) => const AcademicsScreen(),
        '/accounts': (context) => const AccountsScreen(),
        '/admission': (context) => const AdmissionScreen(),
        '/assignment': (context) => const AssignmentScreen(),
        '/certificate': (context) => const CertificateScreen(),
        '/event': (context) => const EventScreen(),
        '/examination': (context) => const ExaminationScreen(),
        '/feedback': (context) => const FeedbackScreen(),
        '/grievance': (context) => const GrievanceScreen(),
        '/hostel': (context) => const HostelScreen(),
        '/notification': (context) => const NotificationScreen(),
        '/project': (context) => const ProjectMonitoringScreen(),
        '/quiz': (context) => const QuizScreen(),
        '/registration': (context) => const RegistrationScreen(),
        '/resource': (context) => const ResourceSharingScreen(),
        '/timetable': (context) => const TimetableScreen(),
      },
    );
  }
}