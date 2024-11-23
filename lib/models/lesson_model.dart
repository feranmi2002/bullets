class LessonModel {
  String? id;
  int? lesson;
  String? title;
  String? topicId;

  LessonModel({this.id, this.lesson, this.title, this.topicId});

  LessonModel.fromJson(Map<String, dynamic> json) {
    id = json["_id"];
    lesson = json["lesson"];
    title = json["title"];
  }
}
