class VideoModel{
  String? caption;
  String? url;

  VideoModel({this.caption, this.url});

  VideoModel.fromJson(Map<String, dynamic> json){
    caption = json["caption"];
    url = json["url"];
  }
}