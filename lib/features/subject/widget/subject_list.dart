import 'package:bullets/colors.dart';
import 'package:bullets/common/controller/all_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../topic/screen/topic_widget.dart';
import '../../../common/util.dart';
import '../../../core/api/end_points.dart';

class SubjectList extends ConsumerWidget {
  const SubjectList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final subjectNotifier = ref.read(allControllerProvider);
    //final subjects = ref.watch(allControllerProvider);
    return FutureBuilder(
        future: subjectNotifier.getSubjects(
            categoryId: ApiUrl.categoriesApi, context: context),
        builder: (context, snapshot) {
          // if (snapshot.connectionState == ConnectionState.waiting) {
          //   return Center(child: const CircularProgressIndicator());
          // }
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () =>
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  TopicWidget(subjectId: snapshot.data![index],
                                  ))),
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: cardColor,
                    ),
                    child: Row(
                      children: [
                        ClipRRect(
                          // Use ClipRRect to clip the image to the container's shape
                          borderRadius: BorderRadius.circular(10),
                          child: Image.network(
                            snapshot.data![index].imageUrl!,
                            width: 100,
                            height: 100,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: ListTile(
                            focusColor: cardColor,
                            title: Text(snapshot.data![index].title!),
                            subtitle: LinearProgressIndicator(
                              backgroundColor: Colors.grey[300],
                            ),
                            trailing: const Icon(CupertinoIcons.right_chevron,
                                color: Colors.white),
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            );
          }
          else if (snapshot.hasError) {
            print(snapshot.error.toString());
            // showSnackBar(context: context, content: snapshot.error.toString());
            return const Center(child: Text('An error occurred'));
          } else {
            return const Center(child: CircularProgressIndicator(backgroundColor: Colors.transparent,));
          }
        }
    );
  }
}
