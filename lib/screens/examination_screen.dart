import 'package:flutter/material.dart';

class ExaminationScreen extends StatefulWidget {
  const ExaminationScreen({super.key});

  @override
  State<ExaminationScreen> createState() => _ExaminationScreenState();
}

class _ExaminationScreenState extends State<ExaminationScreen> {
  final List<Map<String, dynamic>> _exams = [
    {
      'title': 'Mid-Term Exam',
      'subject': 'Mathematics',
      'date': '2024-03-10',
      'marks': 85,
      'status': 'Completed',
    },
    {
      'title': 'Final Exam',
      'subject': 'Physics',
      'date': '2024-05-15',
      'marks': null,
      'status': 'Upcoming',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Examination'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Examinations',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _exams.length,
                itemBuilder: (context, index) {
                  final exam = _exams[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      title: Text(exam['title']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Subject: ${exam['subject']}'),
                          Text('Date: ${exam['date']}'),
                          if (exam['marks'] != null) Text('Marks: ${exam['marks']}/100'),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: exam['status'] == 'Completed' ? Colors.green : Colors.orange,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              exam['status'],
                              style: const TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ],
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
}