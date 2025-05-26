import 'package:flutter/material.dart';

class EventScreen extends StatefulWidget {
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  final List<Map<String, dynamic>> _events = [
    {
      'title': 'Annual Tech Fest',
      'date': '2024-03-15',
      'time': '10:00 AM',
      'venue': 'Main Auditorium',
      'type': 'Festival',
      'description': 'Annual technology festival with competitions and exhibitions',
      'registered': true,
    },
    {
      'title': 'Career Guidance Seminar',
      'date': '2024-02-28',
      'time': '2:00 PM',
      'venue': 'Conference Hall',
      'type': 'Seminar',
      'description': 'Career guidance session by industry experts',
      'registered': false,
    },
    {
      'title': 'Sports Day',
      'date': '2024-03-05',
      'time': '8:00 AM',
      'venue': 'Sports Ground',
      'type': 'Sports',
      'description': 'Annual sports day with various competitions',
      'registered': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Events'),
        actions: [
          IconButton(
            icon: const Icon(Icons.calendar_today),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Calendar view coming soon')),
              );
            },
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
                    _buildStatCard('Total Events', _events.length.toString(), Colors.blue),
                    _buildStatCard('Registered', _getRegisteredCount().toString(), Colors.green),
                    _buildStatCard('Upcoming', _getUpcomingCount().toString(), Colors.orange),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Upcoming Events',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _events.length,
                itemBuilder: (context, index) {
                  final event = _events[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: _getEventTypeColor(event['type']),
                        child: Icon(
                          _getEventTypeIcon(event['type']),
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        event['title'],
                        style: const TextStyle(fontWeight: FontWeight.w600),
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('📅 ${event['date']} at ${event['time']}'),
                          Text('📍 ${event['venue']}'),
                          Text('🏷️ ${event['type']}'),
                          if (event['registered'])
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: const Text(
                                'Registered',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                        ],
                      ),
                      trailing: event['registered']
                          ? const Icon(Icons.check_circle, color: Colors.green)
                          : IconButton(
                              icon: const Icon(Icons.app_registration),
                              onPressed: () => _registerForEvent(index),
                            ),
                      onTap: () => _showEventDetails(event),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showCreateEventDialog,
        tooltip: 'Create Event',
        child: const Icon(Icons.add),
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

  int _getRegisteredCount() {
    return _events.where((e) => e['registered'] == true).length;
  }

  int _getUpcomingCount() {
    return _events.length; // Simplified for demo; in a real app, compare dates
  }

  Color _getEventTypeColor(String type) {
    switch (type.toLowerCase()) {
      case 'festival':
        return Colors.red;
      case 'seminar':
        return Colors.blue;
      case 'sports':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  IconData _getEventTypeIcon(String type) {
    switch (type.toLowerCase()) {
      case 'festival':
        return Icons.celebration;
      case 'seminar':
        return Icons.mic;
      case 'sports':
        return Icons.sports;
      default:
        return Icons.event;
    }
  }

  void _registerForEvent(int index) {
    setState(() {
      _events[index]['registered'] = true;
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Registered for ${_events[index]['title']}')),
    );
  }

  void _showEventDetails(Map<String, dynamic> event) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(event['title']),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Date: ${event['date']}'),
            Text('Time: ${event['time']}'),
            Text('Venue: ${event['venue']}'),
            Text('Type: ${event['type']}'),
            const SizedBox(height: 16),
            const Text('Description:'),
            Text(event['description']),
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

  void _showCreateEventDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Create Event'),
        content: const Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              decoration: InputDecoration(
                labelText: 'Event Title',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Date (YYYY-MM-DD)',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Time',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Venue',
                border: OutlineInputBorder(),
              ),
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
                const SnackBar(content: Text('Event created successfully')),
              );
            },
            child: const Text('Create'),
          ),
        ],
      ),
    );
  }
}