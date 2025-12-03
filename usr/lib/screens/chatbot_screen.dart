import 'package:flutter/material.dart';

class ChatbotScreen extends StatelessWidget {
  const ChatbotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Chatbot'),
      ),
      body: const Center(
        child: Text('The AI Chatbot interface will be here.'),
      ),
    );
  }
}
