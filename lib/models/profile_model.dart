class ProfileModel {
  String? sId;
  String? firstName;
  String? lastName;
  String? dateOfBirth;
  String? phone;
  String? email;
  String? password;
  String? accountStatus;
  int? iV;
  String? district;
  String? block;

  ProfileModel(
      {this.sId,
      this.firstName,
      this.lastName,
      this.dateOfBirth,
      this.phone,
      this.email,
      this.password,
      this.accountStatus,
      this.iV,
      this.district,
      this.block});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    sId = json['_id'] as String?;
    firstName = json['first_name'] as String?;
    lastName = json['last_name'] as String?;
    dateOfBirth = json['date_of_birth'] as String?;
    phone = json['phone'] as String?;
    email = json['email'] as String?;
    password = json['password'] as String?;
    accountStatus = json['account_status'] as String?;
    iV = json['__v'] as int?;
    district = json['district'] as String?;
    block = json['block'] as String?;
  }
}
