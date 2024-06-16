class BloomingModel {
  String? likes;
  bool? isLike;
  String? image;
  String? description;

  BloomingModel({this.likes, this.isLike, this.image, this.description});

  BloomingModel.fromJson(Map<String, dynamic> json) {
    likes = json['likes'];
    isLike = json['isLike'];
    image = json['image'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['likes'] = likes;
    data['isLike'] = isLike;
    data['image'] = image;
    data['description'] = description;
    return data;
  }
}
