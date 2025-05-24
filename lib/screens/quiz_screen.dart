import 'package:flutter/material.dart';

class QuizScreen extends StatelessWidget {
  const QuizScreen({super.key});

  final List<Map<String, dynamic>> _quizzes = const [
    {
      'title': 'Math Quiz 1',
      'subject': 'Mathematics',
      'date': '2024-03-01',
      'score': 90,
      'status': 'Completed',
    },
    {
      'title': 'Physics Quiz',
      'subject': 'Physics',
      'date': '2024-03-15',
      'score': null,
      'status': 'Upcoming',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Quizzes',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _quizzes.length,
                itemBuilder: (context, index) {
                  final quiz = _quizzes[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      title: Text(quiz['title']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Subject: ${quiz['subject']}'),
                          Text('Date: ${quiz['date']}'),
                          if (quiz['score'] != null) Text('Score: ${quiz['score']}/100'),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: quiz['status'] == 'Completed' ? Colors.green : Colors.orange,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              quiz['status'],
                              style: const TextStyle(color: Colors.white, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      trailing: quiz['status'] == 'Upcoming'
                          ? IconButton(
                              icon: const Icon(Icons.play_arrow),
                              onPressed: () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Starting ${quiz['title']}')),
                                );
                              },
                            )
                          : null,
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