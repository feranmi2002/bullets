import 'package:bullets/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../common/screen/topic_lesson_widget.dart';
import '../../../data.dart';

class SubjectList extends StatelessWidget {
  const SubjectList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dummySubjects.length,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: ()=> Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TopicLessonWidget(subjectModel: dummySubjects[index],)
          )),
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: cardColor,
            ),
            child: Row(
              children: [
                ClipRRect( // Use ClipRRect to clip the image to the container's shape
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    dummySubjects[index].imageUrl!,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: ListTile(
                    focusColor: cardColor,
                    title: Text(dummySubjects[index].title!),
                    subtitle: LinearProgressIndicator(
                      backgroundColor: Colors.grey[300],
                    ),
                    trailing: Icon(CupertinoIcons.right_chevron, color: Colors.white),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}