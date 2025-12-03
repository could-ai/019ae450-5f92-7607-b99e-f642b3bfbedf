import 'package:flutter/material.dart';

class PharmaciesScreen extends StatelessWidget {
  const PharmaciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Mock data for pharmacies
    final List<Map<String, dynamic>> pharmacies = [
      {
        'name': 'HealthPlus Pharmacy',
        'address': '123 Main St, Downtown',
        'distance': '0.5 km',
        'rating': 4.6,
        'isOpen': true,
      },
      {
        'name': 'CVS Pharmacy',
        'address': '456 Oak Ave, Westside',
        'distance': '1.2 km',
        'rating': 4.3,
        'isOpen': true,
      },
      {
        'name': 'Walgreens',
        'address': '789 Pine Rd, North Hills',
        'distance': '2.5 km',
        'rating': 4.1,
        'isOpen': false,
      },
      {
        'name': 'Local Care Pharmacy',
        'address': '321 College Blvd, Campus',
        'distance': '3.0 km',
        'rating': 4.8,
        'isOpen': true,
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Pharmacies'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: pharmacies.length,
        itemBuilder: (context, index) {
          final pharmacy = pharmacies[index];
          return Card(
            elevation: 2,
            margin: const EdgeInsets.only(bottom: 16),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              contentPadding: const EdgeInsets.all(16),
              leading: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.green[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Icon(Icons.local_pharmacy, color: Colors.green),
              ),
              title: Text(
                pharmacy['name'],
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Text(pharmacy['address']),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.location_on, size: 14, color: Colors.grey[600]),
                      const SizedBox(width: 2),
                      Text(
                        pharmacy['distance'],
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                      const SizedBox(width: 10),
                      const Icon(Icons.star, size: 14, color: Colors.amber),
                      const SizedBox(width: 2),
                      Text(
                        pharmacy['rating'].toString(),
                        style: TextStyle(color: Colors.grey[600], fontSize: 12),
                      ),
                    ],
                  ),
                ],
              ),
              trailing: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    pharmacy['isOpen'] ? 'OPEN' : 'CLOSED',
                    style: TextStyle(
                      color: pharmacy['isOpen'] ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                ],
              ),
              onTap: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Selected ${pharmacy['name']}')),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
