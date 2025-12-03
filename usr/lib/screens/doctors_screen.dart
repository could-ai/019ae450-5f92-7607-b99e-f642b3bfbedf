import 'package:flutter/material.dart';

class DoctorsScreen extends StatelessWidget {
  const DoctorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Suggested Doctors'),
      ),
      body: const Center(
        child: Text('A list of suggested doctors will appear here.'),
      ),
    );
  }
}
