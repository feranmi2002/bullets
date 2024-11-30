class TopicModel {
  String? id;
  String? title;
  String? subjectId;

  TopicModel({this.id, this.title, this.subjectId});

  TopicModel.fromJson(Map<String, dynamic> json){
    id = json["_id"];
    title = json["title"];
    subjectId = json["subjectId"];

  }
}
