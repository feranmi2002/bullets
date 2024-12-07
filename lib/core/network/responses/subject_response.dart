// To parse this JSON data, do
//
//     final subjectResponse = subjectResponseFromJson(jsonString);

import 'dart:convert';

List<SubjectResponse> subjectResponseFromJson(String str) => List<SubjectResponse>.from(json.decode(str).map((x) => SubjectResponse.fromJson(x)));

String subjectResponseToJson(List<SubjectResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class SubjectResponse {
  bool? featured;
  bool? recommended;
  bool? disabled;
  String? imageUrl;
  String? author;
  String? duration;
  String? otherDetails;
  String? id;
  String? title;
  String? category;
  bool? draft;
  DateTime? createdOn;
  int? v;

  SubjectResponse({
    this.featured,
    this.recommended,
    this.disabled,
    this.imageUrl,
    this.author,
    this.duration,
    this.otherDetails,
    this.id,
    this.title,
    this.category,
    this.draft,
    this.createdOn,
    this.v,
  });

  SubjectResponse copyWith({
    bool? featured,
    bool? recommended,
    bool? disabled,
    String? imageUrl,
    String? author,
    String? duration,
    String? otherDetails,
    String? id,
    String? title,
    String? category,
    bool? draft,
    DateTime? createdOn,
    int? v,
  }) =>
      SubjectResponse(
        featured: featured ?? this.featured,
        recommended: recommended ?? this.recommended,
        disabled: disabled ?? this.disabled,
        imageUrl: imageUrl ?? this.imageUrl,
        author: author ?? this.author,
        duration: duration ?? this.duration,
        otherDetails: otherDetails ?? this.otherDetails,
        id: id ?? this.id,
        title: title ?? this.title,
        category: category ?? this.category,
        draft: draft ?? this.draft,
        createdOn: createdOn ?? this.createdOn,
        v: v ?? this.v,
      );

  factory SubjectResponse.fromJson(Map<String, dynamic> json) => SubjectResponse(
    featured: json["featured"],
    recommended: json["recommended"],
    disabled: json["disabled"],
    imageUrl: json["imageUrl"],
    author: json["author"],
    duration: json["duration"],
    otherDetails: json["otherDetails"],
    id: json["_id"],
    title: json["title"],
    category: json["category"],
    draft: json["draft"],
    createdOn: json["createdOn"] == null ? null : DateTime.parse(json["createdOn"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "featured": featured,
    "recommended": recommended,
    "disabled": disabled,
    "imageUrl": imageUrl,
    "author": author,
    "duration": duration,
    "otherDetails": otherDetails,
    "_id": id,
    "title": title,
    "category": category,
    "draft": draft,
    "createdOn": createdOn?.toIso8601String(),
    "__v": v,
  };
}
