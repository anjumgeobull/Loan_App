class ProfileModel {
  ProfileModel({
    required this.status,
    required this.profile,
  });
  late final int status;
  late final List<Profile> profile;

  ProfileModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    profile = List.from(json['profile']).map((e)=>Profile.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['profile'] = profile.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class Profile {
  Profile({
    required this.userAutoId,
    required this.name,
    required this.contact,
    required this.city,
    required this.employmentType,
    required this.requirementAmount,
    required this.status,
    required this.documents,
  });
  late final String userAutoId;
  late final String name;
  late final String contact;
  late final String city;
  late final String employmentType;
  late final String requirementAmount;
  late final String status;
  late final List<dynamic> documents;

  Profile.fromJson(Map<String, dynamic> json){
    userAutoId = json['user_auto_id'];
    name = json['name'];
    contact = json['contact'];
    city = json['city'];
    employmentType = json['employment_type'];
    requirementAmount = json['requirement_amount'];
    status = json['status'];
    documents = List.castFrom<dynamic, dynamic>(json['documents']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user_auto_id'] = userAutoId;
    _data['name'] = name;
    _data['contact'] = contact;
    _data['city'] = city;
    _data['employment_type'] = employmentType;
    _data['requirement_amount'] = requirementAmount;
    _data['status'] = status;
    _data['documents'] = documents;
    return _data;
  }
}


// class ProfileModel {
//   ProfileModel({
//     required this.status,
//     required this.profile,
//   });
//   late final int status;
//   late final ProfileData profile;
//
//   ProfileModel.fromJson(Map<String, dynamic> json){
//     status = json['status'];
//     profile = ProfileData.fromJson(json['profile']);
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['status'] = status;
//     _data['profile'] = profile.toJson();
//     return _data;
//   }
// }
//
// class ProfileData {
//   ProfileData({
//     required this.id,
//     required this.uniqueId,
//     required this.name,
//     required this.contact,
//     required this.status,
//     required this.token,
//     required this.registerDate,
//     required this.otp,
//     required this.otpStatus,
//     required this.updatedAt,
//     required this.createdAt,
//   });
//   late final String id;
//   late final String uniqueId;
//   late final String name;
//   late final String contact;
//   late final String status;
//   late final String token;
//   late final String registerDate;
//   late final String otp;
//   late final String otpStatus;
//   late final String updatedAt;
//   late final String createdAt;
//
//   ProfileData.fromJson(Map<String, dynamic> json){
//     id = json['_id'];
//     uniqueId = json['unique_id'];
//     name = json['name'];
//     contact = json['contact'];
//     status = json['status'];
//     token = json['token'];
//     registerDate = json['register_date'];
//     otp = json['otp'].toString();
//     otpStatus = json['otp_status'];
//     updatedAt = json['updated_at'];
//     createdAt = json['created_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['_id'] = id;
//     _data['unique_id'] = uniqueId;
//     _data['name'] = name;
//     _data['contact'] = contact;
//     _data['status'] = status;
//     _data['token'] = token;
//     _data['register_date'] = registerDate;
//     _data['otp'] = otp;
//     _data['otp_status'] = otpStatus;
//     _data['updated_at'] = updatedAt;
//     _data['created_at'] = createdAt;
//     return _data;
//   }
// }