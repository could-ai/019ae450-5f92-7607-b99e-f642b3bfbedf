import 'package:flutter/material.dart';

class ChatbotScreen extends StatefulWidget {
  const ChatbotScreen({super.key});

  @override
  State<ChatbotScreen> createState() => _ChatbotScreenState();
}

class _ChatbotScreenState extends State<ChatbotScreen> {
  final TextEditingController _controller = TextEditingController();
  final List<Map<String, String>> _messages = [
    {
      'role': 'assistant',
      'content': 'Hello! I am your AI medical assistant. How can I help you today?',
    },
  ];
  bool _isLoading = false;

  void _sendMessage() {
    if (_controller.text.trim().isEmpty) return;

    final userMessage = _controller.text;
    setState(() {
      _messages.add({
        'role': 'user',
        'content': userMessage,
      });
      _controller.clear();
      _isLoading = true;
    });

    // Simulate AI response delay
    Future.delayed(const Duration(seconds: 2), () {
      if (mounted) {
        setState(() {
          _messages.add({
            'role': 'assistant',
            'content': _getMockResponse(userMessage),
          });
          _isLoading = false;
        });
      }
    });
  }

  String _getMockResponse(String input) {
    input = input.toLowerCase();
    if (input.contains('headache')) {
      return 'For a headache, make sure you are hydrated and getting enough rest. You can take over-the-counter pain relievers like Ibuprofen or Acetaminophen. If it persists, please consult a doctor.';
    } else if (input.contains('fever')) {
      return 'If you have a fever, drink plenty of fluids and rest. You can take Acetaminophen to lower the fever. If your temperature exceeds 39°C (102°F) or lasts more than 3 days, see a doctor immediately.';
    } else if (input.contains('appointment')) {
      return 'You can book an appointment with a doctor through the "Doctors" tab in this app. Would you like me to guide you there?';
    } else if (input.contains('pharmacy') || input.contains('medicine')) {
      return 'You can find nearby pharmacies in the "Pharmacies" tab to purchase medicines.';
    } else {
      return 'I understand. While I am an AI, I recommend consulting with a healthcare professional for accurate medical advice regarding "${input}". Is there anything else I can help you with?';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AI Health Assistant'),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16.0),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                final message = _messages[index];
                final isUser = message['role'] == 'user';
                return Align(
                  alignment: isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 4),
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.blueAccent : Colors.grey[200],
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(12),
                        topRight: const Radius.circular(12),
                        bottomLeft: isUser ? const Radius.circular(12) : Radius.zero,
                        bottomRight: isUser ? Radius.zero : const Radius.circular(12),
                      ),
                    ),
                    constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width * 0.75),
                    child: Text(
                      message['content']!,
                      style: TextStyle(
                        color: isUser ? Colors.white : Colors.black87,
                        fontSize: 16,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          if (_isLoading)
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: LinearProgressIndicator(),
            ),
          Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 1,
                  blurRadius: 5,
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(
                      hintText: 'Ask about your health...',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey[100],
                      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    onSubmitted: (_) => _sendMessage(),
                  ),
                ),
                const SizedBox(width: 8),
                CircleAvatar(
                  backgroundColor: Colors.blueAccent,
                  child: IconButton(
                    icon: const Icon(Icons.send, color: Colors.white),
                    onPressed: _sendMessage,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
