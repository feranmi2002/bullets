import 'package:bullets/common/controller/all_controller.dart';
import 'package:bullets/features/conversation/repository/conversation_provider.dart';
import 'package:bullets/features/subject/widget/subject_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../common/util.dart';
import '../../conversation/screen/conversation_screen.dart';

class SubjectScreen extends ConsumerStatefulWidget {
  const SubjectScreen({super.key});

  @override
  ConsumerState<SubjectScreen> createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends ConsumerState<SubjectScreen> {
  bool _status = true;

  void _onClicked() {
    setState(() {
      _status = !_status;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.message, color: Colors.black),
      ),
      body: Column(
        children: [
          Container(
            height: 200,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/book.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Center(
              child: InkWell(
                onTap: () {
                  final savedLessonId = ref.read(saveLessonProvider.notifier).getLesson();
                  if (savedLessonId != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ConversationScreen(lessonModel: savedLessonId),
                      ),
                    );
                  } else {
                    showSnackBar(context: context, content: 'No reading yet');
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: const Text(
                    "Continue Reading",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "My Courses",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                IconButton(
                  onPressed: null,
                  icon: Icon(Icons.refresh),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: _onClicked,
                  child: Chip(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    label: Row(
                      children: [
                        if (_status)
                          const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 18,
                          ),
                        const SizedBox(width: 5),
                        const Text(
                          "Active",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    backgroundColor:
                        _status ? Colors.black : Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: _onClicked,
                  child: Chip(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    label: Row(
                      children: [
                        if (!_status)
                          const Icon(
                            Icons.check,
                            color: Colors.white,
                            size: 18,
                          ),
                        const SizedBox(width: 5),
                        const Text(
                          "Completed",
                          style: TextStyle(color: Colors.white),
                        ),
                      ],
                    ),
                    backgroundColor:
                        !_status ? Colors.black : Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20), //
          Expanded(child: SubjectList())
        ],
      ),
    );
  }
}
