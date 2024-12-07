import 'package:bullets/common/controller/all_controller.dart';
import 'package:bullets/core/network/responses/lesson_response.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/util.dart';
import '../../../core/network/network_handler.dart';
import '../../../core/network/responses/conversation_response.dart';
import '../screen/conversation_screen.dart';

class ConversationProvider with ChangeNotifier {
  final NetworkHandler _networkHandler;
  List<Conversation> _conversations = [];
  List<Conversation> _allConversations = [];
  int _conversationIndex = 0;
  double value=1;
  bool _isLast = false;
  bool _hasCloseBottomText = true;
  String? messagereply ;

  ConversationProvider(this._networkHandler);

  List<Conversation> get conversations => _conversations;
  List<Conversation> get allConversations => _allConversations;

  bool get isLast => _isLast;
  bool get hasCloseBottomText => _hasCloseBottomText;

  /// Loads the next conversation based on the current index
  Future<void> loadNextConversation({required String lessonId}) async {
    try {
      final response = await _networkHandler.getConversations(lessonId: lessonId);
      _allConversations = response.conversations ?? [];
  _conversationIndex= 1;
      if (_conversationIndex < _allConversations.length) {
        _conversations.add(_allConversations[_conversationIndex]);
        _conversationIndex++;
        getLoadedConversationsPercentage();
        debugPrint('Loaded Conversations: $_conversations');
        notifyListeners(); // Notify listeners when data changes
      } else {
        _isLast = true;
        notifyListeners(); // Notify listeners when the last conversation is reached
      }
    } on Exception catch (e) {
      debugPrint('Error loading next conversation: $e');
    }
  }

  /// Loads all conversations for a given lesson
  Future<List<Conversation>> loadAllConversations({required String lessonId}) async {
    try {
      final response = await _networkHandler.getConversations(lessonId: lessonId);
      _allConversations = response.conversations ?? [];
      _conversationIndex = 0;

      if (_allConversations.isNotEmpty) {
        _conversations=[];
        _conversations.addAll(_allConversations);
        _isLast = true;
      }
      getLoadedConversationsPercentage();
      debugPrint('All Conversations Loaded: $_conversations');
      notifyListeners(); // Notify listeners when data changes
      return _conversations;
    } on Exception catch (e) {
      debugPrint('Error loading all conversations: $e');
      return [];
    }
  }


  Future<void> loadInitConversations({required String lessonId}) async {
    try {
      final response = await _networkHandler.getConversations(lessonId: lessonId);
      _allConversations = response.conversations ?? [];
      _conversationIndex = 0;
      _isLast = false;
      if (_allConversations.isNotEmpty) {
        _conversations=[];
        _conversations.add(_allConversations[0]);

      }
      debugPrint('init Conversations Loaded: $_conversations');
      notifyListeners(); // Notify listeners when data changes
      _conversations;
    } on Exception catch (e) {
      debugPrint('Error loading all conversations: $e');
      //return [];
    }
  }

  /// Refreshes conversations by resetting the index and reloading data
  void refreshConversations(String lessonId) {
    _conversationIndex = 0;
    _isLast = false;
    _conversations.clear();
    loadInitConversations(lessonId: lessonId);
    getLoadedConversationsPercentage();
    notifyListeners(); // Notify listeners when the state is refreshed
  }

  /// Fetches the next lesson and navigates to its screen
  Future<void> getNextLesson({
    required WidgetRef ref,
    required BuildContext context,
    required String lessonId,
  }) async {
    try {
      final response = await _networkHandler.getConversations(lessonId: lessonId);

      final nextLessonResponse = await ref.read(allControllerProvider).getLessons(
        topicId: '${response.topicId}',
        context: context,
      );
      final lessons = nextLessonResponse.lessons;

      if (lessons != null && _conversationIndex < lessons.length - 1) {
        final nextConversation = lessons[_conversationIndex + 1];

        ref.read(indexProvider).setIndex(_conversationIndex + 1);
        ref.read(saveLessonProvider.notifier).saveLesson(lessons[_conversationIndex]);

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => ConversationScreen(lessonModel: nextConversation),
          ),
        );
      } else {
        showSnackBar(context: context, content: "You have reached the last lesson.");
      }
    } on Exception catch (e) {
      debugPrint('Error fetching next lesson: $e');
      showSnackBar(context: context, content: "Failed to fetch the next lesson.");
    }
  }

  /// Calculates the percentage of loaded conversations
  void getLoadedConversationsPercentage() {
    if (_allConversations.isEmpty) {
      value = 0.0;
    } else {
      final loadedCount = _conversations.length;
      final totalCount = _allConversations.length;
      value = (loadedCount / totalCount).clamp(0.0, 1.0); // Ensures value is within range
    }
    print('Loaded Conversations Percentage: $value');
    notifyListeners();
  }


  void toggleCloseBottomTextField() {
    _hasCloseBottomText = !_hasCloseBottomText;
    notifyListeners(); // Notify listeners when the state changes
  }
  void getReplyMessage(String message){
    messagereply =message;

    notifyListeners();
  }
}

// Use ChangeNotifierProvider to expose ConversationProvider to the app
final conversationControllerProvider = ChangeNotifierProvider<ConversationProvider>(
      (ref) => ConversationProvider(NetworkHandler(Dio())),
);





final saveLessonProvider = StateNotifierProvider<SaveLessonIdNotifier, Lesson?>(
      (ref) => SaveLessonIdNotifier(),
);

class SaveLessonIdNotifier extends StateNotifier<Lesson?> {
  SaveLessonIdNotifier() : super(null);

  void saveLesson(Lesson lessonModel) => state = lessonModel;
  Lesson? getLesson() => state;
}
