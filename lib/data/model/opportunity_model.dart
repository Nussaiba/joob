class OpportuntiyModel {
  // OpportuntiyModel opportunitFromJson(String str) =>
  //     OpportuntiyModel.fromJson(json.decode(str));
  //String opportuntiyToJson(OpportuntiyModel data) => json.encode(data.toJson());
  String? id;
  String? companyid;
  String? title;
  String? body;
  String? location;
  String? jopType;
  String? workPlaceType;
  String? jophours;
  String? qualifications;
  String? skills;
  String? salary;
  String? vacant;
  String? image;
  String? createdat;
  String? updatedat;
  OpportuntiyModel(
      {this.id,
      this.companyid,
      this.title,
      this.body,
      this.location,
      this.jopType,
      this.workPlaceType,
      this.jophours,
      this.qualifications,
      this.skills,
      this.salary,
      this.vacant,
      this.image,
      this.createdat,
      this.updatedat});
  factory OpportuntiyModel.fromJson(Map<String, dynamic> json) =>
      OpportuntiyModel(
          id: json['id']!.toString(),
          companyid: json['company_id']!.toString(),
          title: json['title']!,
          body: json['body']!,
          location: json['location']!,
          jopType: json['job_type']!,
          workPlaceType: json['work_place_type']!,
          jophours: json['job_hours']!.toString(),
          qualifications: json['qualifications']!,
          skills: json['skills_req']!,
          salary: json['salary']!.toString(),
          vacant: json['vacant']!.toString(),
          image: json['file']!,
          createdat: json['created_at']!,
          updatedat: json['updated_at']!);

          
  Map<String, dynamic> toJson() => {};
}
