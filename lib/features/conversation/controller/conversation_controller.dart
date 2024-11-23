import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bullets/models/conversation_model.dart';
import '../../../data.dart';

// Conversation provider class
class ConversationNotifier extends StateNotifier<List<ConversationModel>> {
  ConversationNotifier() : super([allConversions[0]]);

  int conversationIndex = 1;
  bool isLast = false;

  // Getter for isLast
  bool getIsLast() => isLast;

  // Function to load the next conversation
  void loadNextConversation() {
    if (conversationIndex < allConversions.length) {
      // Add the next conversation
      state = [...state, allConversions[conversationIndex]];

      // Increment the index
      conversationIndex++;

      // Mark as last if all conversations are loaded
      if (conversationIndex >= allConversions.length) {
        isLast = true;
      }
    }
  }

  // Function to load all conversations
  void loadAllConversations() {
    state = [allConversions[0], ...allConversions.sublist(1)];
    conversationIndex = allConversions.length;
    isLast = true;
  }

  // Function to refresh conversations
  void refreshConversations() {
    state = [allConversions[0]];
    conversationIndex = 1;
    isLast = false;
  }
}

// Create a provider for ConversationNotifier
final conversationProvider =
StateNotifierProvider<ConversationNotifier, List<ConversationModel>>(
      (ref) => ConversationNotifier(),
);
