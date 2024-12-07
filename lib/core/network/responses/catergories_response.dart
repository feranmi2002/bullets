// To parse this JSON data, do
//
//     final categoryResponse = categoryResponseFromJson(jsonString);

import 'dart:convert';

List<CategoryResponse> categoryResponseFromJson(String str) => List<CategoryResponse>.from(json.decode(str).map((x) => CategoryResponse.fromJson(x)));

String categoryResponseToJson(List<CategoryResponse> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CategoryResponse {
  String? id;
  String? title;

  CategoryResponse({
    this.id,
    this.title,
  });

  CategoryResponse copyWith({
    String? id,
    String? title,
  }) =>
      CategoryResponse(
        id: id ?? this.id,
        title: title ?? this.title,
      );

  factory CategoryResponse.fromJson(Map<String, dynamic> json) => CategoryResponse(
    id: json["_id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "title": title,
  };
}
