import 'package:bullets/models/lesson_model.dart';

class LessonResponse {
  String? subject;
  String? topic;
  List<LessonModel> lessons = [];
  String? subjectId;
  String? topicId;

  LessonResponse({this.subject, this.topic, this.lessons = const [
  ], this.subjectId, this.topicId});

  LessonResponse.fromJson(Map<String, dynamic> json){
    subject = json["subject"];
    topic = json["topic"];
    subjectId = json["subjectID"];
    topicId = json["topicID"];
    lessons = json["lessons"] == null
        ? []
        : List<LessonModel>.from(
        json["lessons"]!.map((x) => LessonModel.fromJson(x)));
  }

}