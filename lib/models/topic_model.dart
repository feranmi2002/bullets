class TopicModel {
  String? id;
  String? title;

  TopicModel({this.id, this.title});

  TopicModel.fromJson(Map<String, dynamic> json){
    id = json["_id"];
    title = json["title"];

  }
}
