import 'package:bullets/models/conversation_model.dart';
import 'package:flutter/material.dart';

import '../../../data.dart';
import 'display_text_files.dart';

class ConversionList extends StatefulWidget {
  const ConversionList({super.key});

  @override
  State<ConversionList> createState() => _ConversionListState();
}

class _ConversionListState extends State<ConversionList> {
  // List to store conversations
  List<ConversationModel> conversations = [allConversions[0]];

  // Flag to check if all conversations have been loaded
  bool isLast = false;

  // Index to track the current conversation
  int conversationIndex = 1;

  // Function to load the next conversation
  void loadNextConversation() {
    // Check if there are more conversations to load
    if (conversationIndex < allConversions.length) {
      // Add the next conversation to the list
      conversations.add(allConversions[conversationIndex]);

      // Increment the conversation index
      conversationIndex++;

      // Update the UI
      setState(() {});

      // Check if all conversations have been loaded
      if (conversationIndex >= allConversions.length) {
        isLast = true;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 8,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: conversations.length,
            itemBuilder: (context, index) {
              // Display each conversation
              return DisplayTextImagesGif(
                conversationModel: conversations[index],
              );
            },
          ),
        ),
        Expanded(
          flex: 2,
          child: isLast
              ? IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.arrow_circle_right, size: 40),
                )
              : GestureDetector(
                  onTap: loadNextConversation,
                  child: const SizedBox(height: 40),
                ),
        ),
      ],
    );
  }
}
