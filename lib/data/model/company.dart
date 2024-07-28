

class CompanyModel {
  int? id;
  String? user_name;
  String? email;
  String? created_at;
  String? type;
  String? company_name;
  String? logo;
  String? location;
  String? about;
    String? domain;

  String? contact_info;
 
  CompanyModel({
    this.id,
    this.user_name,
    this.email,
    this.created_at,
    this.type,
    this.company_name,
    this.logo,
    this.location,
    this.about,
    this.contact_info,
    this.domain
   
  });
  factory CompanyModel.fromJson(Map<String, dynamic> json) => CompanyModel(
        id: json['id']!,
        user_name: json['user_name']!,
        email: json['email']!,
        created_at: json['created_at']!,
        type: json['type']!,
        company_name: json['more_info']['company_name']!,
        logo: json['more_info']['logo'],
        location: json['more_info']['location']!,
        about: json['more_info']['about']!,
                        domain: json['more_info']['domain']!,

        contact_info: json['more_info']['contact_info']!,

     
      );

  Map<String, dynamic> toJson() => {};
}
