import 'package:flutter/material.dart';

class HospitalsScreen extends StatelessWidget {
  const HospitalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for hospitals
    final List<Map<String, dynamic>> hospitals = [
      {
        'name': 'City General Hospital',
        'address': '123 Main St, Downtown',
        'distance': '1.2 km',
        'rating': 4.5,
        'isOpen': true,
      },
      {
        'name': 'St. Mary Medical Center',
        'address': '456 Oak Ave, Westside',
        'distance': '3.5 km',
        'rating': 4.8,
        'isOpen': true,
      },
      {
        'name': 'Community Health Clinic',
        'address': '789 Pine Rd, North Hills',
        'distance': '5.0 km',
        'rating': 4.2,
        'isOpen': false,
      },
      {
        'name': 'University Hospital',
        'address': '321 College Blvd, Campus',
        'distance': '8.2 km',
        'rating': 4.9,
        'isOpen': true,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Hospitals'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: hospitals.length,
        itemBuilder: (context, index) {
          final hospital = hospitals[index];
          return Card(
            elevation: 3,
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 120,
                  decoration: BoxDecoration(
                    color: Colors.blue[100],
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(12)),
                  ),
                  child: Center(
                    child: Icon(
                      Icons.local_hospital,
                      size: 64,
                      color: Colors.blue[300],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            hospital['name'],
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: hospital['isOpen'] ? Colors.green.withOpacity(0.1) : Colors.red.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Text(
                              hospital['isOpen'] ? 'OPEN' : 'CLOSED',
                              style: TextStyle(
                                color: hospital['isOpen'] ? Colors.green : Colors.red,
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(
                        hospital['address'],
                        style: const TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(height: 8),
                      Row(
                        children: [
                          const Icon(Icons.location_on, size: 16, color: Colors.blueAccent),
                          const SizedBox(width: 4),
                          Text(
                            hospital['distance'],
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(width: 16),
                          const Icon(Icons.star, size: 16, color: Colors.amber),
                          const SizedBox(width: 4),
                          Text(
                            hospital['rating'].toString(),
                            style: const TextStyle(fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: () {
                             ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('Navigating to ${hospital['name']}...')),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text('Get Directions'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
