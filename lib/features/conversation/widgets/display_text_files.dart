
import 'package:bullets/models/conversation_model.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../video_player_item.dart';

class DisplayTextImagesGif extends StatelessWidget {
  final ConversationModel conversationModel;

  const DisplayTextImagesGif(
      {super.key, required this.conversationModel});

  @override
  Widget build(BuildContext context) {
    // bool isPlaying = false;
    // final AudioPlayer audioPlayer = AudioPlayer();
    return conversationModel.imageModel == null && conversationModel.videoModel == null
        ? Text(
            conversationModel.message ?? "",
            style: const TextStyle(fontSize: 16),
          )
        : conversationModel.imageModel != null && conversationModel.videoModel == null
            ? CachedNetworkImage(
                imageUrl:
                    conversationModel.imageModel?.url ?? '') // this a dependency that help cache the to avoid multiple recall
            : conversationModel.imageModel == null && conversationModel.videoModel != null
        ? VideoPlayerItem(videoUrl: conversationModel.videoModel?.url ?? "")
        : const Text("Unsupported media type");
                // : StatefulBuilder(builder: (context, setState) {
                //     return IconButton(
                //         constraints: const BoxConstraints(minWidth: 120),
                //         onPressed: () async {
                //           if (isPlaying) {//if audio is playing stop
                //             await audioPlayer.pause();
                //             setState(() {
                //               isPlaying = false;
                //             });
                //           } else {
                //             audioPlayer.play(UrlSource(message));
                //             setState(() {
                //               isPlaying = true;
                //             });
                //           }
                //         },
                //         icon: isPlaying ? const Icon(Icons.play_circle)
                //             :const Icon(Icons.stop_circle));
                //   });
  }
}
