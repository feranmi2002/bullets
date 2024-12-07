import 'package:bullets/core/network/network_handler.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/network/responses/lesson_response.dart';
import '../util.dart';
import '../../core/network/responses/subject_response.dart';
import '../../core/network/responses/topic_response.dart';

class AllController {
  final NetworkHandler networkHandler;


  AllController(this.networkHandler);

  Future<List<SubjectResponse>> getSubjects(
      {required String categoryId, required BuildContext context}) async {
    try {
      final response = await networkHandler.getSubjects(categoryId: categoryId);
      return response;
    } on Exception catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  Future<TopicResponse> getTopics(
      {required String subjectId, required BuildContext context}) async {
    try {
      final response = await networkHandler.getTopics(subjectId: subjectId);
      return response;
    } on Exception catch (e) {
      debugPrint(e.toString());
      showSnackBar(context: context, content: e.toString());
      return TopicResponse();
    }
  }


  Future<LessonResponse> getLessons(
      {required String topicId, required BuildContext context}) async {
    try {
      final response = await networkHandler.getLessons(topicId: topicId);
      return response;
    } on Exception catch (e) {
      debugPrint(e.toString());
      showSnackBar(context: context, content: e.toString());
      return LessonResponse();
    }
  }



}
final allControllerProvider = Provider((ref) => AllController(NetworkHandler(Dio()),),
);

final indexProvider = Provider((ref) {
  return IndexNotifier(0);
});

class IndexNotifier  {

int index ;
  void incrementIndex() => index++;
  void decrementIndex() => index--;
  void resetIndex() => index = 0;
  void setIndex(int ind) => index = ind;

IndexNotifier(this.index);
}