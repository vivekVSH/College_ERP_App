import 'package:flutter/material.dart';

class ResourceSharingScreen extends StatelessWidget {
  const ResourceSharingScreen({super.key});

  final List<Map<String, dynamic>> _resources = const [
    {
      'title': 'Data Structures Notes',
      'type': 'PDF',
      'subject': 'Computer Science',
      'uploadedBy': 'Prof. Smith',
      'date': '2024-02-10',
    },
    {
      'title': 'Physics Lab Manual',
      'type': 'PDF',
      'subject': 'Physics',
      'uploadedBy': 'Dr. Jones',
      'date': '2024-02-05',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resource Sharing'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Shared Resources',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _resources.length,
                itemBuilder: (context, index) {
                  final resource = _resources[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      title: Text(resource['title']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Subject: ${resource['subject']}'),
                          Text('Type: ${resource['type']}'),
                          Text('Uploaded By: ${resource['uploadedBy']}'),
                          Text('Date: ${resource['date']}'),
                        ],
                      ),
                      trailing: IconButton(
                        icon: const Icon(Icons.download),
                        onPressed: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Downloading ${resource['title']}')),
                          );
                        },
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Upload functionality coming soon')),
          );
        },
        tooltip: 'Upload Resource',
        child: const Icon(Icons.upload),
      ),
    );
  }
}