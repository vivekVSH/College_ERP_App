import 'package:flutter/material.dart';

class ProjectMonitoringScreen extends StatelessWidget {
  const ProjectMonitoringScreen({super.key});

  final List<Map<String, dynamic>> _projects = const [
    {
      'title': 'AI Chatbot Development',
      'status': 'In Progress',
      'progress': 0.75,
      'deadline': '2024-06-30',
    },
    {
      'title': 'IoT Smart Campus',
      'status': 'Completed',
      'progress': 1.0,
      'deadline': '2024-01-15',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Project Monitoring'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'My Projects',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _projects.length,
                itemBuilder: (context, index) {
                  final project = _projects[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      title: Text(project['title']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Deadline: ${project['deadline']}'),
                          LinearProgressIndicator(
                            value: project['progress'],
                            backgroundColor: Colors.grey[300],
                            valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                          ),
                          Text('Progress: ${(project['progress'] * 100).toInt()}%'),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: project['status'] == 'Completed' ? Colors.green : Colors.orange,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              project['status'],
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