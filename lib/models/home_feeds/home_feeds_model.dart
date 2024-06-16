import 'package:bloom_app/views/components/post_box_component.dart';

class HomePostFeedModel {
  String? postTime;
  String? title;
  String? desc;
  String? totalComments;
  String? totalLikes;
  String? postImage;
  String? thumnail;
  String? eventDateTime;
  String? eventTitle;
  String? eventLocation;
  String? totalInterests;
  String? type;
  PostType? postType;
  bool? like;

  HomePostFeedModel(
      {this.postTime,
      this.title,
      this.desc,
      this.totalComments,
      this.totalLikes,
      this.postImage,
      this.thumnail,
      this.eventDateTime,
      this.eventTitle,
      this.eventLocation,
      this.totalInterests,
      this.type,
      this.like});

  HomePostFeedModel.fromJson(Map<String, dynamic> json) {
    postTime = json['postTime'];
    title = json['title'];
    desc = json['desc'];
    totalComments = json['totalComments'];
    totalLikes = json['totalLikes'];
    postImage = json['postImage'];
    thumnail = json['thumnail'];
    eventDateTime = json['eventDateTime'];
    eventTitle = json['eventTitle'];
    eventLocation = json['eventLocation'];
    totalInterests = json['totalInterests'];
    type = json['type'];
    postType = checkTypes(json['type']);
    like = json['like'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['postTime'] = postTime;
    data['title'] = title;
    data['desc'] = desc;
    data['totalComments'] = totalComments;
    data['totalLikes'] = totalLikes;
    data['postImage'] = postImage;
    data['thumnail'] = thumnail;
    data['eventDateTime'] = eventDateTime;
    data['eventTitle'] = eventTitle;
    data['eventLocation'] = eventLocation;
    data['totalInterests'] = totalInterests;
    data['type'] = type;
    data['like'] = like ?? false;
    return data;
  }

  PostType checkTypes(String type) {
    switch (type) {
      case 'text':
        return PostType.text;
      case 'image':
        return PostType.image;
      case 'video':
        return PostType.video;
      case 'event':
        return PostType.event;
      default:
        return PostType.text;
    }
  }
}
