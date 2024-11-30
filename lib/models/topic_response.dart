import 'package:bullets/models/topic_model.dart';

class TopicResponse {
  String? subject;
  String? subjectId;
  List<TopicModel> topics = [];

  TopicResponse({this.subjectId, this.subject, this.topics = const []});

  TopicResponse.fromJson(Map<String, dynamic> json) {
    subject = json["subject"];
    subjectId = json["subjectID"];
    topics = json["topics"] == null
        ? []
        : List<TopicModel>.from(
            json["topics"]!.map((x) => TopicModel.fromJson(x)));
  }
}
