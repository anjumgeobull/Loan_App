class RegisterResponse {
  RegisterResponse({
    required this.status,
    required this.msg,
    required this.data,
  });
  late final int status;
  late final String msg;
  late final Data data;

  RegisterResponse.fromJson(Map<String, dynamic> json){
    status = json['status'];
    msg = json['msg'];
    data = Data.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['msg'] = msg;
    _data['data'] = data.toJson();
    return _data;
  }
}

class Data {
  Data({
    required this.uniqueId,
    required this.name,
    required this.contact,
    required this.status,
    required this.token,
    required this.city,
    required this.employmentType,
    required this.requirementAmount,
    required this.photo,
    required this.pancard,
    required this.aadharOrVotingcard,
    required this.bankStatement,
    required this.rcBook,
    required this.insurance,
    required this.registerDate,
    required this.otp,
    required this.otpStatus,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
  });
  late final String uniqueId;
  late final String name;
  late final String contact;
  late final String status;
  late final String token;
  late final String city;
  late final String employmentType;
  late final String requirementAmount;
  late final String photo;
  late final String pancard;
  late final String aadharOrVotingcard;
  late final String bankStatement;
  late final String rcBook;
  late final String insurance;
  late final String registerDate;
  late final String otp;
  late final String otpStatus;
  late final String updatedAt;
  late final String createdAt;
  late final String id;

  Data.fromJson(Map<String, dynamic> json){
    uniqueId = json['unique_id'];
    name = json['name'];
    contact = json['contact'];
    status = json['status'];
    token = json['token'];
    city = json['city'];
    employmentType = json['employment_type'];
    requirementAmount = json['requirement_amount'];
    photo = json['photo'];
    pancard = json['pancard'];
    aadharOrVotingcard = json['aadhar_or_votingcard'];
    bankStatement = json['bank_statement'];
    rcBook = json['rc_book'];
    insurance = json['insurance'];
    registerDate = json['register_date'];
    otp = json['otp'];
    otpStatus = json['otp_status'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['_id'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['unique_id'] = uniqueId;
    _data['name'] = name;
    _data['contact'] = contact;
    _data['status'] = status;
    _data['token'] = token;
    _data['city'] = city;
    _data['employment_type'] = employmentType;
    _data['requirement_amount'] = requirementAmount;
    _data['photo'] = photo;
    _data['pancard'] = pancard;
    _data['aadhar_or_votingcard'] = aadharOrVotingcard;
    _data['bank_statement'] = bankStatement;
    _data['rc_book'] = rcBook;
    _data['insurance'] = insurance;
    _data['register_date'] = registerDate;
    _data['otp'] = otp;
    _data['otp_status'] = otpStatus;
    _data['updated_at'] = updatedAt;
    _data['created_at'] = createdAt;
    _data['_id'] = id;
    return _data;
  }
}