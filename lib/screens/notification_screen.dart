import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  final List<Map<String, dynamic>> _notifications = const [
    {
      'title': 'Exam Schedule Released',
      'description': 'Mid-term exam schedule has been released.',
      'date': '2024-02-20',
      'isRead': false,
    },
    {
      'title': 'Fee Payment Reminder',
      'description': 'Please pay your hostel fee by 2024-02-25.',
      'date': '2024-02-18',
      'isRead': true,
    },
    {
      'title': 'Event Registration Open',
      'description': 'Register for the Annual Tech Fest by 2024-03-10.',
      'date': '2024-02-15',
      'isRead': false,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [
          IconButton(
            icon: const Icon(Icons.mark_email_read),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('All notifications marked as read')),
              );
            },
            tooltip: 'Mark all as read',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Notifications',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _notifications.isEmpty
                  ? const Center(
                      child: Text(
                        'No notifications available',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _notifications.length,
                      itemBuilder: (context, index) {
                        final notification = _notifications[index];
                        return Card(
                          margin: const EdgeInsets.only(bottom: 12),
                          color: notification['isRead']
                              ? Colors.grey[200]
                              : Colors.white,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: notification['isRead']
                                  ? Colors.grey
                                  : Theme.of(context).primaryColor,
                              child: const Icon(
                                Icons.notifications,
                                color: Colors.white,
                              ),
                            ),
                            title: Text(
                              notification['title'],
                              style: TextStyle(
                                fontWeight: notification['isRead']
                                    ? FontWeight.normal
                                    : FontWeight.bold,
                              ),
                            ),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(notification['description']),
                                const SizedBox(height: 4),
                                Text(
                                  'Date: ${notification['date']}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey[600],
                                  ),
                                ),
                              ],
                            ),
                            trailing: notification['isRead']
                                ? const Icon(Icons.check_circle,
                                    color: Colors.green)
                                : const Icon(Icons.circle,
                                    color: Colors.blue),
                            onTap: () {
                              _showNotificationDetails(context, notification);
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

  void _showNotificationDetails(
      BuildContext context, Map<String, dynamic> notification) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(notification['title']),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(notification['description']),
            const SizedBox(height: 16),
            Text(
              'Date: ${notification['date']}',
              style: TextStyle(color: Colors.grey[600]),
            ),
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