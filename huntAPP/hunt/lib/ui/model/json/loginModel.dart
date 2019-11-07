class LoginModel {
  final String srn;
  final String level;
  final String name;

  LoginModel(this.srn, this.level, this.name);

  LoginModel.fromJson(Map<String, dynamic> json)
      : srn = json['srn'],
        level = json['level'],
        name = json['name'];

  Map<String, dynamic> toJson() =>
      {
        'srn': srn,
        'level': level,
        'name': name,
      };
}