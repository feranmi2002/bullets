import 'package:bullets/core/network/responses/lesson_response.dart';
import 'package:bullets/features/conversation/bottom_text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../colors.dart';
import '../repository/conversation_provider.dart';
import '../widgets/conversation_list.dart';

class ConversationScreen extends ConsumerWidget {
  final Lesson? lessonModel;

  const ConversationScreen({Key? key, this.lessonModel}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final conversationProviderNotifier = ref.watch(conversationControllerProvider);
    final conversationProvider = ref.watch(conversationControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(lessonModel?.title ?? 'Lesson Title'),
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
          const SizedBox(height: 30),
          Expanded(
            child: ConversationList(lessonId: lessonModel),
          ),
          if (!conversationProvider.isLast)
            GestureDetector(
              onTap: () => conversationProviderNotifier.loadNextConversation(
                lessonId: lessonModel?.id ?? '',
              ),
              child: Container(
                height: 40,
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
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
          const SizedBox(height: 20), // Add consistent spacing
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () =>
                    conversationProviderNotifier.refreshConversations(lessonModel?.id ?? ''),
                icon: const Icon(Icons.refresh),
                tooltip: "Refresh Conversations",
              ),
              if (conversationProvider.isLast)
                IconButton(
                  onPressed: () {
                    conversationProviderNotifier.getNextLesson(
                      ref: ref,
                      context: context,
                      lessonId: lessonModel?.id ?? '',
                    );
                  },
                  icon: const Icon(Icons.arrow_circle_right, size: 40),
                  tooltip: "Next Lesson",
                ),
              IconButton(
                onPressed: () => conversationProviderNotifier.loadAllConversations(lessonId: lessonModel?.id ??''),
                icon: const Icon(Icons.list),
                tooltip: "Load All Conversations",
              ),
            ],
          ),

          const SizedBox(height: 16), // Add spacing at the bottom
        ],
      ),
    );
  }
}
