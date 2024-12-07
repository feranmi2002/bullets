import 'package:bullets/common/controller/all_controller.dart';
import 'package:bullets/data.dart';
import 'package:bullets/features/conversation/repository/conversation_provider.dart';
import 'package:bullets/features/conversation/screen/conversation_screen.dart';
import 'package:bullets/models/subject_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../colors.dart';
import '../../../common/util.dart';
import '../../../core/network/responses/topic_response.dart';

class LessonWidget extends ConsumerWidget {
  final String subjectId;
  final Topic topic;

  LessonWidget({
    super.key,
    required this.subjectId ,
    required this.topic ,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final topics = ref
        .read(allControllerProvider)
        .getLessons(topicId: topic.id ?? '', context: context);
print('ffffffffffffffffffffffff$topics');
    print('hhhhhhhhhhhhhhhhhhhhhhhhhhhh${topic.id}');
    return FutureBuilder(
        future: topics,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: const CircularProgressIndicator());
          }
          if (snapshot.hasData) {
            final lesson = snapshot.data;
            final lessonList = lesson?.lessons ?? [];
            return Scaffold(
              appBar: AppBar(
                title: Text("${lesson!.topic}"),
              ),
              body: ListView.builder(
                itemCount: lessonList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      final indexNotifier = ref.read(indexProvider);
                      indexNotifier.setIndex(index);
                      final saveLessonId = ref.read(saveLessonProvider.notifier);
                      saveLessonId.saveLesson(lessonList[index]);

                      Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {

                          return ConversationScreen(
                            lessonModel: lessonList[index]);}
                      ),
                    );},
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: cardColor,
                      ),
                      child: ListTile(
                        focusColor: cardColor,
                        leading: Icon(Icons.collections_bookmark),
                        title: Text(lessonList[index].title!),
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
