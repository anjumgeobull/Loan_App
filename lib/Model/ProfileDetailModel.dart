class ProfileModel {
  ProfileModel({
    required this.status,
    required this.profile,
  });
  late final int status;
  late final ProfileData profile;

  ProfileModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    profile = ProfileData.fromJson(json['profile']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['profile'] = profile.toJson();
    return _data;
  }
}

class ProfileData {
  ProfileData({
    required this.id,
    required this.uniqueId,
    required this.name,
    required this.contact,
    required this.status,
    required this.token,
    required this.registerDate,
    required this.otp,
    required this.otpStatus,
    required this.updatedAt,
    required this.createdAt,
  });
  late final String id;
  late final String uniqueId;
  late final String name;
  late final String contact;
  late final String status;
  late final String token;
  late final String registerDate;
  late final int otp;
  late final String otpStatus;
  late final String updatedAt;
  late final String createdAt;

  ProfileData.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    uniqueId = json['unique_id'];
    name = json['name'];
    contact = json['contact'];
    status = json['status'];
    token = json['token'];
    registerDate = json['register_date'];
    otp = json['otp'];
    otpStatus = json['otp_status'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['unique_id'] = uniqueId;
    _data['name'] = name;
    _data['contact'] = contact;
    _data['status'] = status;
    _data['token'] = token;
    _data['register_date'] = registerDate;
    _data['otp'] = otp;
    _data['otp_status'] = otpStatus;
    _data['updated_at'] = updatedAt;
    _data['created_at'] = createdAt;
    return _data;
  }
}