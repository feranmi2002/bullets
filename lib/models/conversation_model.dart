import 'dart:ui';

import 'package:bullets/models/ImageModel.dart';
import 'package:bullets/models/VideoModel.dart';

class ConversationModel {
  String? id;
  String? type;
  String? message;
  ImageModel? imageModel;
  VideoModel? videoModel;
  String? lessonId;
  String? subjectId;

  ConversationModel({this.id, this.type, this.message, this.imageModel, this.videoModel, this.lessonId, this.subjectId});

  ConversationModel.fromJson(Map<String, dynamic> json){
    id = json["_id"];
    type = json["type"];
    message = json["message"];
    imageModel = json["image"] != null ? ImageModel.fromJson(json["image"]) : null;
    videoModel = json["video"] != null ? VideoModel.fromJson(json["video"]) : null;
  }
}
