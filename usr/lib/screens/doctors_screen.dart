import 'package:flutter/material.dart';

class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for doctors
    final List<Map<String, dynamic>> doctors = [
      {
        'name': 'Dr. Sarah Smith',
        'specialty': 'Cardiologist',
        'hospital': 'City General Hospital',
        'rating': 4.9,
        'experience': '12 years',
        'image': Icons.person_3,
      },
      {
        'name': 'Dr. John Doe',
        'specialty': 'Pediatrician',
        'hospital': 'St. Mary Medical Center',
        'rating': 4.7,
        'experience': '8 years',
        'image': Icons.person,
      },
      {
        'name': 'Dr. Emily Chen',
        'specialty': 'Dermatologist',
        'hospital': 'Skin Care Clinic',
        'rating': 4.8,
        'experience': '10 years',
        'image': Icons.person_2,
      },
      {
        'name': 'Dr. Michael Brown',
        'specialty': 'Neurologist',
        'hospital': 'University Hospital',
        'rating': 4.6,
        'experience': '15 years',
        'image': Icons.person_4,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Suggested Doctors'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: doctors.length,
        itemBuilder: (context, index) {
          final doctor = doctors[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                    radius: 35,
                    backgroundColor: Colors.blue[100],
                    child: Icon(doctor['image'], size: 40, color: Colors.blue[800]),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          doctor['name'],
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          doctor['specialty'],
                          style: const TextStyle(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          doctor['hospital'],
                          style: const TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          children: [
                            const Icon(Icons.star, size: 16, color: Colors.amber),
                            const SizedBox(width: 4),
                            Text(
                              doctor['rating'].toString(),
                              style: const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(width: 16),
                            const Icon(Icons.work, size: 16, color: Colors.grey),
                            const SizedBox(width: 4),
                            Text(
                              doctor['experience'],
                              style: const TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),
                        Row(
                          children: [
                            Expanded(
                              child: OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.symmetric(vertical: 0),
                                  side: const BorderSide(color: Colors.blueAccent),
                                ),
                                child: const Text('Profile'),
                              ),
                            ),
                            const SizedBox(width: 8),
                            Expanded(
                              child: ElevatedButton(
                                onPressed: () {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text('Booking appointment with ${doctor['name']}...')),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.blueAccent,
                                  foregroundColor: Colors.white,
                                  padding: const EdgeInsets.symmetric(vertical: 0),
                                ),
                                child: const Text('Book'),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
