class PostModel {
  String? id;
  String? seekerid;
  String? body;
  String? file;
  String? createdat;
  String? updatedat;
  String? createdby;
  String? profileImg;

  PostModel({
    this.id,
    this.seekerid,
    this.body,
    this.file,
    this.createdat,
    this.updatedat,
    this.createdby,
    this.profileImg
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
      id: json['id']!.toString(),
      seekerid: json['seeker_id']!.toString(),
      body: json['body']!,
      file: json['file'],
      createdat: json['created_at']!,
      updatedat: json['updated_at']!,
      createdby:  json['created_by']!,
      profileImg: json['profile_img'],
      
      );

  Map<String, dynamic> toJson() => {};
}
