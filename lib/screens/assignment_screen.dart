import 'package:flutter/material.dart';

class AssignmentScreen extends StatefulWidget {
  const AssignmentScreen({super.key});

  @override
  State<AssignmentScreen> createState() => _AssignmentScreenState();
}

class _AssignmentScreenState extends State<AssignmentScreen> {
  final List<Map<String, dynamic>> _assignments = [
    {
      'title': 'Data Structures Implementation',
      'subject': 'Computer Science',
      'dueDate': '2024-02-15',
      'status': 'Pending',
      'marks': null,
      'description': 'Implement basic data structures like Stack, Queue, and Linked List',
    },
    {
      'title': 'Circuit Analysis Report',
      'subject': 'Electronics',
      'dueDate': '2024-02-10',
      'status': 'Submitted',
      'marks': 85,
      'description': 'Analyze the given circuit and provide detailed report',
    },
    {
      'title': 'Physics Lab Report',
      'subject': 'Physics',
      'dueDate': '2024-02-08',
      'status': 'Graded',
      'marks': 92,
      'description': 'Submit lab report on wave interference experiment',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Assignments'),
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: _showFilterOptions,
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
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatCard('Total', _assignments.length.toString(), Colors.blue),
                    _buildStatCard('Pending', _getPendingCount().toString(), Colors.orange),
                    _buildStatCard('Completed', _getCompletedCount().toString(), Colors.green),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'All Assignments',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _assignments.length,
                itemBuilder: (context, index) {
                  final assignment = _assignments[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: _getStatusColor(assignment['status']),
                        child: Icon(
                          _getStatusIcon(assignment['status']),
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        assignment['title'],
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Subject: ${assignment['subject']}'),
                          Text('Due: ${assignment['dueDate']}'),
                          if (assignment['marks'] != null)
                            Text('Marks: ${assignment['marks']}/100'),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: _getStatusColor(assignment['status']),
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              assignment['status'],
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios),
                      onTap: () => _showAssignmentDetails(assignment),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showSubmitDialog,
        child: const Icon(Icons.upload),
        tooltip: 'Submit Assignment',
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

  int _getPendingCount() {
    return _assignments.where((a) => a['status'] == 'Pending').length;
  }

  int _getCompletedCount() {
    return _assignments.where((a) => a['status'] != 'Pending').length;
  }

  Color _getStatusColor(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return Colors.orange;
      case 'submitted':
        return Colors.blue;
      case 'graded':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  IconData _getStatusIcon(String status) {
    switch (status.toLowerCase()) {
      case 'pending':
        return Icons.schedule;
      case 'submitted':
        return Icons.cloud_upload;
      case 'graded':
        return Icons.check_circle;
      default:
        return Icons.assignment;
    }
  }

  void _showAssignmentDetails(Map<String, dynamic> assignment) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(assignment['title']),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Subject: ${assignment['subject']}'),
            Text('Due Date: ${assignment['dueDate']}'),
            Text('Status: ${assignment['status']}'),
            if (assignment['marks'] != null)
              Text('Marks: ${assignment['marks']}/100'),
            const SizedBox(height: 16),
            const Text('Description:'),
            Text(assignment['description']),
          ],
        ),
        actions: [
          if (assignment['status'] == 'Pending')
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                _showSubmitDialog();
              },
              child: const Text('Submit'),
            ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _showSubmitDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Submit Assignment'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TextField(
              decoration: InputDecoration(
                labelText: 'Assignment Title',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('File selected: assignment.pdf')),
                );
              },
              icon: const Icon(Icons.attach_file),
              label: const Text('Attach File'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Assignment submitted successfully')),
              );
            },
            child: const Text('Submit'),
          ),
        ],
      ),
    );
  }

  void _showFilterOptions() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Filter Assignments'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              title: const Text('All'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: const Text('Pending'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: const Text('Submitted'),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              title: const Text('Graded'),
              onTap: () => Navigator.pop(context),
            ),
          ],
        ),
      ),
    );
  }
}