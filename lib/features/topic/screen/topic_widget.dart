import 'package:bullets/common/controller/all_controller.dart';
import 'package:bullets/core/network/responses/subject_response.dart';
import 'package:bullets/data.dart';
import 'package:bullets/features/conversation/screen/conversation_screen.dart';
import 'package:bullets/features/lesson/widget/lesson_widget.dart';
import 'package:bullets/models/subject_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../colors.dart';
import '../../../common/util.dart';

class TopicWidget extends ConsumerWidget {
  final SubjectResponse subjectId;


  TopicWidget({
    super.key,
    required this.subjectId

  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topics = ref
        .read(allControllerProvider)
        .getTopics(subjectId: subjectId.id ??'', context: context);

    return FutureBuilder(
        future: topics,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: const CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            final topic = snapshot.data;
            final topicList = topic?.topics ?? [];
            return Scaffold(
              appBar: AppBar(
                title: Text("${topic!.subject}"),
              ),
              body: ListView.builder(
                itemCount: topicList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LessonWidget(subjectId:subjectId.id ??'',topic: topicList[index]),
                      ),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: cardColor,
                      ),
                      child: ListTile(
                        focusColor: cardColor,
                        leading: Icon(Icons.collections_bookmark),
                        title: Text(topicList[index].title!),
                        // Use dummyLessons instead of dummySubjects
                        subtitle: LinearProgressIndicator(
                          backgroundColor: Colors.grey[300],
                        ),
                        trailing: Icon(CupertinoIcons.right_chevron,
                            color: Colors.white),
                      ),
                    ),
                  );
                },
              ),
            );
          } else if (snapshot.hasError) {
            print(snapshot.error.toString());
            // showSnackBar(context: context, content: snapshot.error.toString());
            return const Center(child: Text('An error occurred'));
          } else {
            return const Center(child: CircularProgressIndicator(backgroundColor: Colors.transparent,));
          }
        });
  }
}
