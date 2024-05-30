class PostModel {
  String? id;
  String? seekerid;
  DateTime? body;
  String? file;
  String? createdat;
  String? updatedat;

  PostModel({
    this.id,
    this.seekerid,
    this.body,
    this.file,
    this.createdat,
    this.updatedat,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
      id: json['id']!.toString(),
      seekerid: json['seeker_id']!.toString(),
      body: json['body']!,
      file: json['file']!,
      createdat: json['created_at']!,
      updatedat: json['updated_at']!);

  Map<String, dynamic> toJson() => {};
}
