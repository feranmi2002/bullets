// To parse this JSON data, do
//
//     final conversationResponse = conversationResponseFromJson(jsonString);

import 'dart:convert';

ConversationResponse conversationResponseFromJson(String str) => ConversationResponse.fromJson(json.decode(str));

String conversationResponseToJson(ConversationResponse data) => json.encode(data.toJson());

class ConversationResponse {
  List<Conversation>? conversations;
  String? subjectId;
  String? subject;
  String? topicId;
  String? topic;
  LessonClass? lesson;

  ConversationResponse({
    this.conversations,
    this.subjectId,
    this.subject,
    this.topicId,
    this.topic,
    this.lesson,
  });

  ConversationResponse copyWith({
    List<Conversation>? conversations,
    String? subjectId,
    String? subject,
    String? topicId,
    String? topic,
    LessonClass? lesson,
  }) =>
      ConversationResponse(
        conversations: conversations ?? this.conversations,
        subjectId: subjectId ?? this.subjectId,
        subject: subject ?? this.subject,
        topicId: topicId ?? this.topicId,
        topic: topic ?? this.topic,
        lesson: lesson ?? this.lesson,
      );

  factory ConversationResponse.fromJson(Map<String, dynamic> json) => ConversationResponse(
    conversations: json["conversations"] == null ? [] : List<Conversation>.from(json["conversations"]!.map((x) => Conversation.fromJson(x))),
    subjectId: json["subjectID"],
    subject: json["subject"],
    topicId: json["topicID"],
    topic: json["topic"],
    lesson: json["lesson"] == null ? null : LessonClass.fromJson(json["lesson"]),
  );

  Map<String, dynamic> toJson() => {
    "conversations": conversations == null ? [] : List<dynamic>.from(conversations!.map((x) => x.toJson())),
    "subjectID": subjectId,
    "subject": subject,
    "topicID": topicId,
    "topic": topic,
    "lesson": lesson?.toJson(),
  };
}

class Conversation {
  String? id;
  String? lesson;
  Type? type;
  String? message;

  Conversation({
    this.id,
    this.lesson,
    this.type,
    this.message,
  });

  Conversation copyWith({
    String? id,
    String? lesson,
    Type? type,
    String? message,
  }) =>
      Conversation(
        id: id ?? this.id,
        lesson: lesson ?? this.lesson,
        type: type ?? this.type,
        message: message ?? this.message,
      );

  factory Conversation.fromJson(Map<String, dynamic> json) => Conversation(
    id: json["_id"],
    lesson: json["lesson"],
    type: typeValues.map[json["type"]]!,
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "lesson": lesson,
    "type": typeValues.reverse[type],
    "message": message,
  };
}

// enum String {
//   THE_608079791_E05_E7071_BAF22_D4
// }
//
// final lessonIdEnumValues = EnumValues({
//   "608079791e05e7071baf22d4": String.THE_608079791_E05_E7071_BAF22_D4
// });

enum Type {
  MESSAGE
}

final typeValues = EnumValues({
  "Message": Type.MESSAGE
});

class LessonClass {
  String? lessonId;
  String? title;
  String? lesson;

  LessonClass({
    this.lessonId,
    this.title,
    this.lesson,
  });

  LessonClass copyWith({
    String? lessonId,
    String? title,
    String? lesson,
  }) =>
      LessonClass(
        lessonId: lessonId ?? this.lessonId,
        title: title ?? this.title,
        lesson: lesson ?? this.lesson,
      );

  factory LessonClass.fromJson(Map<String, dynamic> json) => LessonClass(
    lessonId:json["lessonID"],
    title: json["title"],
    lesson: json["lesson"],
  );

  Map<String, dynamic> toJson() => {
    "lessonID": lessonId,
    "title": title,
    "lesson": lesson,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
