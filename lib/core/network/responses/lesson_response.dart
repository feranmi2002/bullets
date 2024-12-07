// To parse this JSON data, do
//
//     final lessonResponse = lessonResponseFromJson(jsonString);

import 'dart:convert';

LessonResponse lessonResponseFromJson(String str) => LessonResponse.fromJson(json.decode(str));

String lessonResponseToJson(LessonResponse data) => json.encode(data.toJson());

class LessonResponse {
  String? subjectId;
  String? subject;
  String? topicId;
  String? topic;
  List<Lesson>? lessons;

  LessonResponse({
    this.subjectId,
    this.subject,
    this.topicId,
    this.topic,
    this.lessons,
  });

  LessonResponse copyWith({
    String? subjectId,
    String? subject,
    String? topicId,
    String? topic,
    List<Lesson>? lessons,
  }) =>
      LessonResponse(
        subjectId: subjectId ?? this.subjectId,
        subject: subject ?? this.subject,
        topicId: topicId ?? this.topicId,
        topic: topic ?? this.topic,
        lessons: lessons ?? this.lessons,
      );

  factory LessonResponse.fromJson(Map<String, dynamic> json) => LessonResponse(
    subjectId: json["subjectID"],
    subject: json["subject"],
    topicId: json["topicID"],
    topic: json["topic"],
    lessons: json["lessons"] == null ? [] : List<Lesson>.from(json["lessons"]!.map((x) => Lesson.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "subjectID": subjectId,
    "subject": subject,
    "topicID": topicId,
    "topic": topic,
    "lessons": lessons == null ? [] : List<dynamic>.from(lessons!.map((x) => x.toJson())),
  };
}

class Lesson {
  String? id;
  String? title;
  int? lesson;

  Lesson({
    this.id,
    this.title,
    this.lesson,
  });

  Lesson copyWith({
    String? id,
    String? title,
    int? lesson,
  }) =>
      Lesson(
        id: id ?? this.id,
        title: title ?? this.title,
        lesson: lesson ?? this.lesson,
      );

  factory Lesson.fromJson(Map<String, dynamic> json) => Lesson(
    id: json["_id"],
    title: json["title"],
    lesson: json["lesson"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
    "lesson": lesson,
  };
}
