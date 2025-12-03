import 'package:flutter/material.dart';

class PharmaciesScreen extends StatelessWidget {
  const PharmaciesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Pharmacies'),
      ),
      body: const Center(
        child: Text('A list of nearby pharmacies will appear here.'),
      ),
    );
  }
}
