import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  final List<Map<String, dynamic>> _modules = const [
    {
      'title': 'Academics',
      'icon': Icons.book,
      'route': '/academics',
      'color': Colors.blue,
    },
    {
      'title': 'Accounts',
      'icon': Icons.account_balance_wallet,
      'route': '/accounts',
      'color': Colors.green,
    },
    {
      'title': 'Admission',
      'icon': Icons.how_to_reg,
      'route': '/admission',
      'color': Colors.orange,
    },
    {
      'title': 'Assignment',
      'icon': Icons.assignment,
      'route': '/assignment',
      'color': Colors.purple,
    },
    {
      'title': 'Certificate',
      'icon': Icons.card_membership,
      'route': '/certificate',
      'color': Colors.amber,
    },
    {
      'title': 'Event',
      'icon': Icons.event,
      'route': '/event',
      'color': Colors.red,
    },
    {
      'title': 'Examination',
      'icon': Icons.quiz,
      'route': '/examination',
      'color': Colors.indigo,
    },
    {
      'title': 'Feedback',
      'icon': Icons.feedback,
      'route': '/feedback',
      'color': Colors.teal,
    },
    {
      'title': 'Grievance',
      'icon': Icons.report_problem,
      'route': '/grievance',
      'color': Colors.deepOrange,
    },
    {
      'title': 'Hostel',
      'icon': Icons.home,
      'route': '/hostel',
      'color': Colors.brown,
    },
    {
      'title': 'Notification',
      'icon': Icons.notifications,
      'route': '/notification',
      'color': Colors.pink,
    },
    {
      'title': 'Project Monitoring',
      'icon': Icons.trending_up,
      'route': '/project',
      'color': Colors.cyan,
    },
    {
      'title': 'Quiz',
      'icon': Icons.help_outline,
      'route': '/quiz',
      'color': Colors.lime,
    },
    {
      'title': 'Registration',
      'icon': Icons.app_registration,
      'route': '/registration',
      'color': Colors.deepPurple,
    },
    {
      'title': 'Resource Sharing',
      'icon': Icons.share,
      'route': '/resource',
      'color': Colors.blueGrey,
    },
    {
      'title': 'TimeTable',
      'icon': Icons.schedule,
      'route': '/timetable',
      'color': Colors.lightGreen,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('College ERP Dashboard'),
        actions: [
          PopupMenuButton(
            onSelected: (value) {
              if (value == 'logout') {
                _handleLogout(context);
              }
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                value: 'profile',
                child: Row(
                  children: [
                    const Icon(Icons.person),
                    const SizedBox(width: 8),
                    Text('${AuthService.currentUser} (${AuthService.userRole})'),
                  ],
                ),
              ),
              const PopupMenuItem(
                value: 'logout',
                child: Row(
                  children: [
                    Icon(Icons.logout),
                    SizedBox(width: 8),
                    Text('Logout'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundColor: Theme.of(context).primaryColor,
                      child: const Icon(
                        Icons.person,
                        size: 30,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome, ${AuthService.currentUser}!',
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Role: ${AuthService.userRole}',
                          style: TextStyle(
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Modules',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1.1,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                itemCount: _modules.length,
                itemBuilder: (context, index) {
                  final module = _modules[index];
                  return Card(
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, module['route']);
                      },
                      borderRadius: BorderRadius.circular(12),
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              module['icon'],
                              size: 40,
                              color: module['color'],
                            ),
                            const SizedBox(height: 8),
                            Text(
                              module['title'],
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _handleLogout(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                AuthService.logout();
                Navigator.pushReplacementNamed(context, '/login');
              },
              child: const Text('Logout'),
            ),
          ],
        );
      },
    );
  }
}