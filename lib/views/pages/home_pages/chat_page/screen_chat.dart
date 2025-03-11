import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Athalia Putri'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                ChatBubble(
                  isMe: false,
                  message: 'Look at how chocho sleeps in my arms!',
                  imageUrl: 'https://placekitten.com/200/200',
                  timestamp: '16:46',
                ),
                ChatBubble(
                  isMe: true,
                  message: 'Can I come over?',
                  timestamp: '16:46',
                ),
                ChatBubble(
                  isMe: false,
                  message: 'Of course, let me know if you\'re on your way.',
                  timestamp: '16:46',
                ),
                ChatBubble(
                  isMe: true,
                  message: 'K, I\'m on my way',
                  timestamp: '16:50 - Read',
                ),
                const SizedBox(height: 16),
                const Center(child: Text('Sat, 17/10', style: TextStyle(color: Colors.grey))),
                ChatBubble(
                  isMe: true,
                  message: 'Good morning, did you sleep well?',
                  timestamp: '09:45',
                ),
              ],
            ),
          ),
          ChatInputField(),
        ],
      ),
    );
  }
}

class ChatBubble extends StatelessWidget {
  final bool isMe;
  final String message;
  final String? imageUrl;
  final String timestamp;

  const ChatBubble({
    super.key,
    required this.isMe,
    required this.message,
    this.imageUrl,
    required this.timestamp,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isMe) ...[
          if (imageUrl != null)
            CircleAvatar(
              backgroundImage: NetworkImage(imageUrl!),
              radius: 16,
            ),
          const SizedBox(width: 8),
        ],
        Column(
          crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              margin: const EdgeInsets.symmetric(vertical: 4),
              constraints: const BoxConstraints(maxWidth: 250),
              decoration: BoxDecoration(
                color: isMe ? Colors.blue : Colors.grey[200],
                borderRadius: BorderRadius.circular(16).copyWith(
                  bottomLeft: Radius.circular(isMe ? 16 : 0),
                  bottomRight: Radius.circular(isMe ? 0 : 16),
                ),
              ),
              child: Text(
                message,
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.black,
                ),
              ),
            ),
            Text(
              timestamp,
              style: const TextStyle(color: Colors.grey, fontSize: 12),
            ),
          ],
        ),
      ],
    );
  }
}

class ChatInputField extends StatelessWidget {
  const ChatInputField({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: Colors.grey)),
      ),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {},
          ),
          Expanded(
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Type a message',
                border: InputBorder.none,
              ),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.send, color: Colors.blue),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
