import 'package:flutter/material.dart';

class PrescriptionsScreen extends StatelessWidget {
  const PrescriptionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for prescriptions
    final List<Map<String, String>> prescriptions = [
      {
        'medicine': 'Amoxicillin',
        'dosage': '500mg - 3 times a day',
        'doctor': 'Dr. Smith',
        'date': '2023-10-25',
        'status': 'Active',
      },
      {
        'medicine': 'Ibuprofen',
        'dosage': '400mg - As needed',
        'doctor': 'Dr. Johnson',
        'date': '2023-10-20',
        'status': 'Completed',
      },
      {
        'medicine': 'Lisinopril',
        'dosage': '10mg - Once a day',
        'doctor': 'Dr. Williams',
        'date': '2023-10-15',
        'status': 'Active',
      },
      {
        'medicine': 'Metformin',
        'dosage': '500mg - Twice a day',
        'doctor': 'Dr. Brown',
        'date': '2023-10-10',
        'status': 'Active',
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Prescriptions'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: prescriptions.length,
        itemBuilder: (context, index) {
          final item = prescriptions[index];
          final isActive = item['status'] == 'Active';
          
          return Card(
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        item['medicine']!,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                        decoration: BoxDecoration(
                          color: isActive ? Colors.green.withOpacity(0.1) : Colors.grey.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: isActive ? Colors.green : Colors.grey,
                          ),
                        ),
                        child: Text(
                          item['status']!,
                          style: TextStyle(
                            color: isActive ? Colors.green : Colors.grey,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      const Icon(Icons.medication, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        item['dosage']!,
                        style: const TextStyle(fontSize: 14, color: Colors.black87),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.person, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        'Prescribed by: ${item['doctor']}',
                        style: const TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      const Icon(Icons.calendar_today, size: 16, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        'Date: ${item['date']}',
                        style: const TextStyle(fontSize: 14, color: Colors.black54),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Action to add new prescription
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Add Prescription feature coming soon!')),
          );
        },
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
