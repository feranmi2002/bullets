import 'package:bullets/data.dart';
import 'package:bullets/features/conversation/screen/conversation_screen.dart';
import 'package:bullets/models/subject_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../colors.dart';

class TopicLessonWidget extends StatelessWidget {
  final SubjectModel? subjectModel;
  const TopicLessonWidget({super.key, this.subjectModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(subjectModel!.title!),
      ),
      body: ListView.builder(
        itemCount: dummyLessons.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ConversationScreen(lessonModel: dummyLessons[index]),
              ),
            ),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: cardColor,
              ),
              child: ListTile(
                focusColor: cardColor,
                leading: Icon(Icons.collections_bookmark),
                title: Text(dummyLessons[index].title!), // Use dummyLessons instead of dummySubjects
                subtitle: LinearProgressIndicator(
                  backgroundColor: Colors.grey[300],
                ),
                trailing: Icon(CupertinoIcons.right_chevron, color: Colors.white),
              ),
            ),
          );
        },
      ),
    );
  }
}