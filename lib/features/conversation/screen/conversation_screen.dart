import 'package:bullets/data.dart';
import 'package:bullets/features/subject/widget/subject_list.dart';
import 'package:bullets/models/lesson_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../colors.dart';
import '../controller/conversation_controller.dart';
import '../widgets/conversation_list.dart';

class ConversationScreen extends ConsumerWidget {
  final LessonModel? lessonModel;
  const ConversationScreen({Key? key, this.lessonModel}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Access the ConversationNotifier
    final conversationNotifier = ref.read(conversationProvider.notifier);
    final conversations = ref.watch(conversationProvider);
    // Check if all conversations are loaded
    final isLast = conversationNotifier.getIsLast();

    return Scaffold(
      appBar: AppBar(
        title:  Text(lessonModel!.title!),
        centerTitle: false,
        backgroundColor: backgroundColor,
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
          // Linear Progress Indicator
          LinearProgressIndicator(
            backgroundColor: Colors.grey[300],
            value: allConversions.isNotEmpty
                ? (conversations.length / allConversions.length)
                : 0,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.black), // Set bar color here
          ),

          const SizedBox(height: 30),
          Expanded(
            child: Column(
              children: [
                const Expanded(
                  child: ConversationList(),
                ),
                if(!isLast)GestureDetector(
                  onTap: conversationNotifier.loadNextConversation, // Changed to null
                  child: Container(
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: const Center(
                      child: Text(
                        'Load More',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20), // Adjust spacing
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    IconButton(
                      onPressed: conversationNotifier.refreshConversations,
                      icon: const Icon(Icons.refresh),
                      tooltip: "Refresh Conversations",
                    ),
                    if(isLast)IconButton(
                      onPressed: null, // Changed to null
                      icon: const Icon(Icons.arrow_circle_right, size: 40),
                    ),
                    IconButton(
                      onPressed: conversationNotifier.loadAllConversations,
                      icon: const Icon(Icons.list),
                      tooltip: "Load All Conversations",
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}