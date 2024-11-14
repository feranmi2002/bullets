class ImageModel{
  String? caption;
  String? url;
  String? name;

  ImageModel({this.caption, this.url, this.name});

  ImageModel.fromJson(Map<String, dynamic> json){
    caption = json["caption"];
    url = json["url"];
    name = json["name"];
  }
}