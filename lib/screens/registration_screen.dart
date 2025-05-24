import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  String _selectedCourse = 'Computer Science';

  final List<String> _courses = [
    'Computer Science',
    'Electronics',
    'Mechanical',
    'Civil',
  ];

  final List<Map<String, dynamic>> _registeredCourses = [
    {
      'name': 'Mathematics',
      'code': 'MATH101',
      'credits': 4,
      'semester': '6th',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Course Registration',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      DropdownButtonFormField<String>(
                        value: _selectedCourse,
                        decoration: const InputDecoration(
                          labelText: 'Select Course',
                          border: OutlineInputBorder(),
                        ),
                        items: _courses.map((course) => DropdownMenuItem(
                          value: course,
                          child: Text(course),
                        )).toList(),
                        onChanged: (value) {
                          setState(() {
                            _selectedCourse = value!;
                          });
                        },
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton(
                        onPressed: _registerCourse,
                        child: const Text('Register'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Registered Courses',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: _registeredCourses.length,
                itemBuilder: (context, index) {
                  final course = _registeredCourses[index];
                  return Card(
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      title: Text(course['name']),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Code: ${course['code']}'),
                          Text('Credits: ${course['credits']}'),
                          Text('Semester: ${course['semester']}'),
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

  void _registerCourse() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Registered for $_selectedCourse')),
    );
  }
}