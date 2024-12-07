import 'dart:async';

import 'package:bullets/core/network/responses/lesson_response.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:bullets/features/conversation/widgets/conversation_card.dart';
import '../bottom_text_widget.dart';
import '../repository/conversation_provider.dart';

class ConversationList extends ConsumerStatefulWidget {
  final Lesson? lessonId;

  const ConversationList({super.key, required this.lessonId});

  @override
  ConversationListState createState() => ConversationListState();
}

class ConversationListState extends ConsumerState<ConversationList> {
  @override
  void initState() {
    super.initState();
    // Load all conversations when the widget is initialized
    // if(ref.read(conversationControllerProvider).conversations.length <=1){
    ref
        .read(conversationControllerProvider)
        .loadInitConversations(lessonId: widget.lessonId?.id ?? '');
    Timer(const Duration(seconds: 2), () {
      setState(() {
    ref.read(conversationControllerProvider).getLoadedConversationsPercentage();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final conversationProvider = ref.watch(conversationControllerProvider);
    bool checkNetworkConnection =false;

    return Scaffold(
      body: Column(
        children: [
          if (conversationProvider.conversations.isEmpty)
      Builder(builder: (context) {
        Timer(const Duration(seconds: 5), () {
          setState(() {
            checkNetworkConnection = true;
          });
        });
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (checkNetworkConnection)
              Text('Check your network connection')
            else
              Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.transparent,
                ),
              ),
          ],
        );
      }),
          LinearProgressIndicator(
            backgroundColor: Colors.grey[300],
            value: conversationProvider.value,
            valueColor: const AlwaysStoppedAnimation<Color>(Colors.black),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: conversationProvider.conversations.length,
              itemBuilder: (context, index) {
                return ConversationCard(
                  conversationModel: conversationProvider.conversations[index],
                  onLeftSwipe: () {

                   conversationProvider.getReplyMessage(conversationProvider.conversations[index].message ?? '');
                    conversationProvider.toggleCloseBottomTextField();
                  },
                );
              },
            ),
          ),
          if (conversationProvider.hasCloseBottomText)
            BottomTextWidget(),
        ],
      ),
    );
  }
}
