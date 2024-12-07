import 'package:bullets/features/conversation/repository/conversation_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';

class BottomTextWidget extends ConsumerStatefulWidget {

   const BottomTextWidget({super.key});

  @override
  ConsumerState<BottomTextWidget> createState() => _BottomTextWidgetState();
}

class _BottomTextWidgetState extends ConsumerState<BottomTextWidget> {
  final TextEditingController _messageController = TextEditingController();
  FocusNode focusNode = FocusNode(); // to control keyboard

  @override
  Widget build(BuildContext context) {
    final converseNotifier = ref.watch(conversationControllerProvider.notifier);
    final converse = ref.watch(conversationControllerProvider);
    String messageReply =converse.messagereply ?? '';
    return Column(
      children: [
      Container(
      width: 350,
      padding: const EdgeInsets.all(8),
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Text(
                  'message AI',
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              GestureDetector(
                child: const Icon(
                  Icons.close,
                  size: 16,
                ),
                onTap: () {
                  setState(() {

                    converseNotifier.toggleCloseBottomTextField();
                    print("aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa${converse.hasCloseBottomText}");
                  });

                },
              )
            ],
          ),
          const SizedBox(
            height: 8,
          ),
  HtmlWidget(messageReply,textStyle: TextStyle(color: Colors.black),),
          // messageReply.messageEnum == MessageEnum.image
          //     ? CachedNetworkImage(
          //   imageUrl: messageReply.message,
          //   fit: BoxFit.cover,
          //   height: 200,
          //   width: 200,
          //   placeholder: (context, url) => CircularProgressIndicator(),
          //   errorWidget: (context, url, error) => Icon(Icons.error),
          // )
          //     : DisplayTextImagesGif(
          //   message: messageReply.message,
          //   messageType: messageReply.messageEnum,
          // ),
        ],
      ),
    ),




        Row(
          children: [
            Expanded(
              child: TextFormField(
                focusNode: focusNode,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  hintText: 'Type a message!',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                    borderSide: const BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  contentPadding: const EdgeInsets.all(10),
                ),
                controller: _messageController,
                onChanged: (val) {
                },
                onTap: (){},
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 8, left: 2, right: 2),
              child: InkWell(
                  child: CircleAvatar(
                      backgroundColor: Colors.grey.withOpacity(.5),
                      radius: 25,
                      child: GestureDetector(
                        child: Icon(
                           Icons.send),
                        onTap: (){},
                      ))),
            )
          ],
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
    _messageController.dispose();

  }
}
