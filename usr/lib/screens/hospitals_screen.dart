import 'package:flutter/material.dart';

class HospitalsScreen extends StatelessWidget {
  const HospitalsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nearby Hospitals'),
      ),
      body: const Center(
        child: Text('A list of nearby hospitals will appear here.'),
      ),
    );
  }
}
