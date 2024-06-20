class ApplySeekerModel {
  int? id;
  int? opportunity_name;
  int? company_name;
  String? status;
  String? createdat;
  ApplySeekerModel({
    this.id,
    this.opportunity_name,
    this.company_name,
    this.status,
    this.createdat,
  });
  factory ApplySeekerModel.fromJson(Map<String, dynamic> json) =>
      ApplySeekerModel(
        id: json['id']!,
        opportunity_name: json['opportunity_name']!,
        company_name: json['company_name']!,
        status: json['status'],
        createdat: json['created_at'],
      );

  Map<String, dynamic> toJson() => {};
}
