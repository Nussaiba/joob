class PostModel {
  int? id;
  int? user_id;
  String? seekerid;
  String? body;
  String? file;
  String? createdat;
  String? updatedat;
  String? createdby;
  String? profileImg;
  String? type;

  PostModel(
      {this.id,
      this.seekerid,
      this.user_id,
      this.body,
      this.file,
      this.createdat,
      this.updatedat,
      this.createdby,
      this.profileImg,
      this.type
      });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
        id: json['id']!,
        user_id: json['user_id']!,
        seekerid: json['seeker_id']!.toString(),
        body: json['body']!,
        file: json['file'],
        createdat: json['created_at']!,
        updatedat: json['updated_at']!,
        createdby: json['created_by']!,
        profileImg: json['profile_img'],
        type:  json['type']
      );

  Map<String, dynamic> toJson() => {};
}
