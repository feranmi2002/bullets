class SubjectModel {
  String? title;
  String? otherDetails;
  String? duration;
  String? category;
  bool? draft;
  String? id;
  String? imageUrl;
  String? author;

  SubjectModel(
      {this.title,
      this.otherDetails,
      this.duration,
      this.category,
      this.draft,
      this.id,
      this.imageUrl,
      this.author});

  SubjectModel.fromJson(Map<String, dynamic> json){
    id = json["_id"];
    title = json["title"];
    otherDetails = json["otherDetails"];
    duration = json["duration"];
    category = json["category"];
    draft = json["draft"];
    imageUrl = json["imageUrl"];
    author = json["author"];
  }
}
