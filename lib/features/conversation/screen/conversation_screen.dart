import 'package:flutter/material.dart';

import '../widgets/conversion_list.dart';

class ConversationScreen extends StatelessWidget {
  const ConversationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Converse"),
        centerTitle: false,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.music_note_rounded),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.person),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.play_arrow),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ConversionList(),
          ),
          SizedBox(height: 20), // Reduced height
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.refresh),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.list),
              ),
            ],
          ),
        ],
      ),
    );
  }
}