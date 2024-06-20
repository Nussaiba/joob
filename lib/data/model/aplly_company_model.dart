class ApplyModel {
  int? id;
  int? opportunity_id;
  int? user_id;
  int? company_id;
  String? cv;
  String? full_name;
  String? birth_day;
  String? location;
  String? about;
  String? skills;
  String? certificates;
  List? languages;
  List? projects;
  String? experiences;
  String? contacts;
  String? status;
  String? createdat;
  String? updatedat;
  ApplyModel(
      {this.id,
      this.opportunity_id,
      this.user_id,
      this.company_id,
      this.cv,
      this.full_name,
      this.birth_day,
      this.location,
      this.about,
      this.skills,
      this.certificates,
      this.languages,
      this.projects,
      this.experiences,
      this.contacts,
      this.status,
      this.createdat,
      this.updatedat});
  factory ApplyModel.fromJson(Map<String, dynamic> json) => ApplyModel(
      id: json['id']!,
      opportunity_id: json['opportunity_id']!,
      user_id: json['user_id']!,
      company_id: json['company_id']!,
      cv: json['cv']!,
      full_name: json['full_name']!,
      birth_day: json['birth_day']!,
      location: json['location']!,
      about: json['about']!,
      skills: json['skills']!,
      certificates: json['certificates']!,
      languages: json['languages']!,
      projects: json['projects']!,
      experiences: json['experiences'],
      contacts: json['contacts'],
      status: json['status'],
      createdat: json['created_at'],
      updatedat: json['updated_at']);

  Map<String, dynamic> toJson() => {};
}
