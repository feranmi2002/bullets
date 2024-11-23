// Import necessary packages
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bullets/features/conversation/widgets/conversation_card.dart';
import '../controller/conversation_controller.dart';

// Class to display the conversation list
class ConversationList extends ConsumerStatefulWidget {
  const ConversationList({super.key});

  @override
  ConversationListState createState() => ConversationListState();
}

class ConversationListState extends ConsumerState<ConversationList> {
  // ScrollController to manage scrolling
  final ScrollController _scrollController = ScrollController();

  // Variable to store the previous conversation count
  int previousConversationCount = 0;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 1),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // Watch the current list of conversations
    final conversations = ref.watch(conversationProvider);


    // Check if new conversations were added and scroll if necessary
    if (conversations.length > previousConversationCount && _scrollController.hasClients) {
      // Scroll to the bottom only if new conversations are added
      _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
    }

    // Update the previous conversation count
    previousConversationCount = conversations.length;

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 8,
            child: ListView.builder(
              controller: _scrollController,
              itemCount: conversations.length,
              itemBuilder: (context, index) {
                return ConversationCard(
                  onLeftSwipe: () {},
                  conversationModel: conversations[index],
                );
              },
            ),
          ),
          //
        ],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    // Dispose the ScrollController properly when the widget is removed
    _scrollController.dispose();
  }
}