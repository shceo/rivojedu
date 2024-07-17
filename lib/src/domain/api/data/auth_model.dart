
 class SignIn {
  String? id;
  String? name;
  String? surname;
  // Null? avatar;
  // Null? birth;
  String? phoneNumber;
  int? password;
  String? token;

 SignIn(
      {this.id,
      this.name,
      this.surname,
      // this.avatar,
      // this.birth,
      this.phoneNumber,
      this.password,
      this.token});

  SignIn.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    surname = json['surname'];
    // avatar = json['avatar'];
    // birth = json['birth'];
    phoneNumber = json['phoneNumber'];
    password = json['password'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['surname'] = surname;
    // data['avatar'] = this.avatar;
    // data['birth'] = this.birth;
    data['phoneNumber'] = phoneNumber;
    data['password'] = password;
    data['token'] = token;
    return data;
  }
 }