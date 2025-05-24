import 'package:flutter/material.dart';

class TimetableScreen extends StatelessWidget {
  const TimetableScreen({super.key});

  final Map<String, List<Map<String, String>>> _timetable = const {
    'Monday': [
      {'time': '9:00 AM - 10:00 AM', 'subject': 'Mathematics', 'room': 'A-101'},
      {'time': '10:00 AM - 11:00 AM', 'subject': 'Physics', 'room': 'A-102'},
    ],
    'Tuesday': [
      {'time': '9:00 AM - 10:00 AM', 'subject': 'Chemistry', 'room': 'A-103'},
      {'time': '10:00 AM - 11:00 AM', 'subject': 'Computer Science', 'room': 'Lab-1'},
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Timetable'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Weekly Timetable',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _timetable.keys.length,
                itemBuilder: (context, index) {
                  final day = _timetable.keys.elementAt(index);
                  final schedule = _timetable[day]!;
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ExpansionTile(
                      title: Text(day),
                      children: schedule.map((slot) => ListTile(
                        title: Text(slot['subject']!),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Time: ${slot['time']}'),
                            Text('Room: ${slot['room']}'),
                          ],
                        ),
                      )).toList(),
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