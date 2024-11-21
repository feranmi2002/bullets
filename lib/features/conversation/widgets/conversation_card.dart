import 'package:bullets/colors.dart';
import 'package:bullets/models/conversation_model.dart';
import 'package:flutter/material.dart';
import 'package:swipe_to/swipe_to.dart';

import 'display_text_files.dart';

class ConversationCard extends StatelessWidget {
  final String message;
  final VoidCallback onLeftSwipe;
  final ConversationModel conversationModel;


  const ConversationCard({Key? key,
    required this.message,
    required this.onLeftSwipe, required this.conversationModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SwipeTo(
        onLeftSwipe: (details) {
          onLeftSwipe();
          print("swipe ");
        },
        child: Align(
            alignment: Alignment.centerRight,
            child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery
                      .of(context)
                      .size
                      .width - 45,
                ),
                child: Card(
                  elevation: 1,
                  shape:
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  color: cardColor,
                  margin: const EdgeInsets.symmetric(
                      horizontal: 15, vertical: 5),
                  child: Padding(
                      padding: const EdgeInsets.only(
                        left: 10,
                        right: 30,
                        top: 5,
                        bottom: 20,
                      ),
                  child:
                      DisplayTextImagesGif(
                          conversationModel: conversationModel,),
                  ),
                ))));
  }
}