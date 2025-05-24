import 'package:flutter/material.dart';

class AcademicsScreen extends StatefulWidget {
  const AcademicsScreen({super.key});

  @override
  State<AcademicsScreen> createState() => _AcademicsScreenState();
}

class _AcademicsScreenState extends State<AcademicsScreen> {
  final List<Map<String, dynamic>> _subjects = [
    {
      'name': 'Mathematics',
      'code': 'MATH101',
      'credits': 4,
      'attendance': 85,
      'grade': 'A',
    },
    {
      'name': 'Physics',
      'code': 'PHY101',
      'credits': 3,
      'attendance': 92,
      'grade': 'A+',
    },
    {
      'name': 'Chemistry',
      'code': 'CHEM101',
      'credits': 3,
      'attendance': 78,
      'grade': 'B+',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Academics'),
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatCard('CGPA', '8.5', Colors.green),
                    _buildStatCard('Credits', '42/60', Colors.blue),
                    _buildStatCard('Semester', '6th', Colors.orange),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Current Subjects',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _subjects.length,
                itemBuilder: (context, index) {
                  final subject = _subjects[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: _getGradeColor(subject['grade']),
                        child: Text(
                          subject['grade'],
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      title: Text(
                        subject['name'],
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Code: ${subject['code']}'),
                          Text('Credits: ${subject['credits']}'),
                          LinearProgressIndicator(
                            value: subject['attendance'] / 100,
                            backgroundColor: Colors.grey[300],
                            valueColor: AlwaysStoppedAnimation<Color>(
                              subject['attendance'] >= 75 
                                ? Colors.green 
                                : Colors.red,
                            ),
                          ),
                          Text('Attendance: ${subject['attendance']}%'),
                        ],
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () {
                        _showSubjectDetails(context, subject);
                      },
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

  Widget _buildStatCard(String title, String value, Color color) {
    return Column(
      children: [
        Text(
          value,
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
        Text(
          title,
          style: TextStyle(
            color: Colors.grey[600],
          ),
        ),
      ],
    );
  }

  Color _getGradeColor(String grade) {
    switch (grade) {
      case 'A+':
        return Colors.green[700]!;
      case 'A':
        return Colors.green;
      case 'B+':
        return Colors.blue;
      case 'B':
        return Colors.orange;
      default:
        return Colors.red;
    }
  }

  void _showSubjectDetails(BuildContext context, Map<String, dynamic> subject) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(subject['name']),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Subject Code: ${subject['code']}'),
            Text('Credits: ${subject['credits']}'),
            Text('Current Grade: ${subject['grade']}'),
            Text('Attendance: ${subject['attendance']}%'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }
}