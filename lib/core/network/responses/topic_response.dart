// To parse this JSON data, do
//
//     final topicResponse = topicResponseFromJson(jsonString);

import 'dart:convert';

TopicResponse topicResponseFromJson(String str) => TopicResponse.fromJson(json.decode(str));

String topicResponseToJson(TopicResponse data) => json.encode(data.toJson());

class TopicResponse {
  String? subjectId;
  String? subject;
  List<Topic>? topics;

  TopicResponse({
    this.subjectId,
    this.subject,
    this.topics,
  });

  TopicResponse copyWith({
    String? subjectId,
    String? subject,
    List<Topic>? topics,
  }) =>
      TopicResponse(
        subjectId: subjectId ?? this.subjectId,
        subject: subject ?? this.subject,
        topics: topics ?? this.topics,
      );

  factory TopicResponse.fromJson(Map<String, dynamic> json) => TopicResponse(
    subjectId: json["subjectID"],
    subject: json["subject"],
    topics: json["topics"] == null ? [] : List<Topic>.from(json["topics"]!.map((x) => Topic.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "subjectID": subjectId,
    "subject": subject,
    "topics": topics == null ? [] : List<dynamic>.from(topics!.map((x) => x.toJson())),
  };
}

class Topic {
  String? id;
  String? title;

  Topic({
    this.id,
    this.title,
  });

  Topic copyWith({
    String? id,
    String? title,
  }) =>
      Topic(
        id: id ?? this.id,
        title: title ?? this.title,
      );

  factory Topic.fromJson(Map<String, dynamic> json) => Topic(
    id: json["_id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
  };
}
