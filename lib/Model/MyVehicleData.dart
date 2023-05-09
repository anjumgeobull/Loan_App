// class MyVehicleModel {
//   MyVehicleModel({
//     required this.status,
//     required this.msg,
//     required this.data,
//   });
//   late final int status;
//   late final String msg;
//   late final List<MyVehicleData> data;
//
//   MyVehicleModel.fromJson(Map<String, dynamic> json){
//     status = json['status'];
//     msg = json['msg'];
//     data = List.from(json['data']).map((e)=>MyVehicleData.fromJson(e)).toList();
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['status'] = status;
//     _data['msg'] = msg;
//     _data['data'] = data.map((e)=>e.toJson()).toList();
//     return _data;
//   }
// }
//
// class MyVehicleData {
//   MyVehicleData({
//     required this.id,
//     required this.userAutoId,
//     required this.vehicleNumber,
//     required this.isMyVehicle,
//     required this.license,
//     required this.fullChassis,
//     required this.owner,
//     required this.registrationDate,
//     required this.fuelType,
//     required this.engine,
//     required this.vehicleClass,
//     required this.makerName,
//     required this.makerModel,
//     required this.ownerCount,
//     required this.insuranceDate,
//     required this.pollution,
//     required this.fitnessDt,
//     required this.isBlacklisted,
//     required this.model,
//     required this.insurerName,
//     required this.financierName,
//     required this.vehicleColor,
//     required this.manufacturingDate,
//     required this.normsType,
//     required this.ownerFatherName,
//     required this.registrationAuthority,
//     required this.insurancePolicyNo,
//     required this.presentAddress,
//     required this.permanentAddress,
//     required this.vehicleCubicCapacity,
//     required this.puccNo,
//     required this.vehicleWeight,
//     required this.seatingCapacity,
//     required this.pucExpiry,
//     required this.fitUpto,
//     required this.taxUpto,
//     required this.blacklistStatus,
//     required this.nocDetails,
//     required this.rcStatus,
//     required this.rcStatusAsOn,
//     required this.bodyType,
//     required this.updatedAt,
//     required this.createdAt,
//   });
//   late final String id;
//   late final String userAutoId;
//   late final String vehicleNumber;
//   late final String isMyVehicle;
//   late final String license;
//   late final String fullChassis;
//   late final String owner;
//   late final String registrationDate;
//   late final String fuelType;
//   late final String engine;
//   late final String vehicleClass;
//   late final String makerName;
//   late final String makerModel;
//   late final String ownerCount;
//   late final String insuranceDate;
//   late final String pollution;
//   late final String fitnessDt;
//   late final String isBlacklisted;
//   late final String model;
//   late final String insurerName;
//   late final String financierName;
//   late final String vehicleColor;
//   late final String manufacturingDate;
//   late final String normsType;
//   late final String ownerFatherName;
//   late final String registrationAuthority;
//   late final String insurancePolicyNo;
//   late final String presentAddress;
//   late final String permanentAddress;
//   late final String vehicleCubicCapacity;
//   late final String puccNo;
//   late final String vehicleWeight;
//   late final String seatingCapacity;
//   late final String pucExpiry;
//   late final String fitUpto;
//   late final String taxUpto;
//   late final String blacklistStatus;
//   late final String nocDetails;
//   late final String rcStatus;
//   late final String rcStatusAsOn;
//   late final String bodyType;
//   late final String updatedAt;
//   late final String createdAt;
//
//   MyVehicleData.fromJson(Map<String, dynamic> json){
//     id = json['_id'];
//     userAutoId = json['user_auto_id'];
//     vehicleNumber = json['vehicle_number'];
//     isMyVehicle = json['is_my_vehicle'];
//     license = json['license'];
//     fullChassis = json['full_chassis'];
//     owner = json['owner'];
//     registrationDate = json['registration_date'];
//     fuelType = json['fuel_type'];
//     engine = json['engine'];
//     vehicleClass = json['vehicle_class'];
//     makerName = json['maker_name'];
//     makerModel = json['maker_model'];
//     ownerCount = json['owner_count'];
//     insuranceDate = json['insurance_date'];
//     pollution = json['pollution'];
//     fitnessDt = json['fitness_dt'];
//     isBlacklisted = json['is_blacklisted'];
//     model = json['model'];
//     insurerName = json['insurer_name'];
//     financierName = json['financier_name'];
//     vehicleColor = json['vehicle_color'];
//     manufacturingDate = json['manufacturing_date'];
//     normsType = json['norms_type'];
//     ownerFatherName = json['owner_father_name'];
//     registrationAuthority = json['registration_authority'];
//     insurancePolicyNo = json['insurance_policy_no'];
//     presentAddress = json['present_address'];
//     permanentAddress = json['permanent_address'];
//     vehicleCubicCapacity = json['vehicle_cubic_capacity'];
//     puccNo = json['pucc_no'];
//     vehicleWeight = json['vehicle_weight'];
//     seatingCapacity = json['seating_capacity'];
//     pucExpiry = json['puc_expiry'];
//     fitUpto = json['fit_upto'];
//     taxUpto = json['tax_upto'];
//     blacklistStatus = json['blacklist_status'];
//     nocDetails = json['noc_details'];
//     rcStatus = json['rc_status'];
//     rcStatusAsOn = json['rc_status_as_on'];
//     bodyType = json['body_type'];
//     updatedAt = json['updated_at'];
//     createdAt = json['created_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final _data = <String, dynamic>{};
//     _data['_id'] = id;
//     _data['user_auto_id'] = userAutoId;
//     _data['vehicle_number'] = vehicleNumber;
//     _data['is_my_vehicle'] = isMyVehicle;
//     _data['license'] = license;
//     _data['full_chassis'] = fullChassis;
//     _data['owner'] = owner;
//     _data['registration_date'] = registrationDate;
//     _data['fuel_type'] = fuelType;
//     _data['engine'] = engine;
//     _data['vehicle_class'] = vehicleClass;
//     _data['maker_name'] = makerName;
//     _data['maker_model'] = makerModel;
//     _data['owner_count'] = ownerCount;
//     _data['insurance_date'] = insuranceDate;
//     _data['pollution'] = pollution;
//     _data['fitness_dt'] = fitnessDt;
//     _data['is_blacklisted'] = isBlacklisted;
//     _data['model'] = model;
//     _data['insurer_name'] = insurerName;
//     _data['financier_name'] = financierName;
//     _data['vehicle_color'] = vehicleColor;
//     _data['manufacturing_date'] = manufacturingDate;
//     _data['norms_type'] = normsType;
//     _data['owner_father_name'] = ownerFatherName;
//     _data['registration_authority'] = registrationAuthority;
//     _data['insurance_policy_no'] = insurancePolicyNo;
//     _data['present_address'] = presentAddress;
//     _data['permanent_address'] = permanentAddress;
//     _data['vehicle_cubic_capacity'] = vehicleCubicCapacity;
//     _data['pucc_no'] = puccNo;
//     _data['vehicle_weight'] = vehicleWeight;
//     _data['seating_capacity'] = seatingCapacity;
//     _data['puc_expiry'] = pucExpiry;
//     _data['fit_upto'] = fitUpto;
//     _data['tax_upto'] = taxUpto;
//     _data['blacklist_status'] = blacklistStatus;
//     _data['noc_details'] = nocDetails;
//     _data['rc_status'] = rcStatus;
//     _data['rc_status_as_on'] = rcStatusAsOn;
//     _data['body_type'] = bodyType;
//     _data['updated_at'] = updatedAt;
//     _data['created_at'] = createdAt;
//     return _data;
//   }
// }

class MyVehicleModel {
  MyVehicleModel({
    required this.status,
    required this.msg,
    required this.data,
  });
  late final int status;
  late final String msg;
  late final List<MyVehicleData> data;

  MyVehicleModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    msg = json['msg'];
    data = List.from(json['data']).map((e)=>MyVehicleData.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['msg'] = msg;
    _data['data'] = data.map((e)=>e.toJson()).toList();
    return _data;
  }
}

class MyVehicleData {
  MyVehicleData({
    required this.id,
    required this.userAutoId,
    required this.vehicleNumber,
    required this.isMyVehicle,
    required this.updatedAt,
    required this.createdAt,
  });
  late final String id;
  late final String userAutoId;
  late final String vehicleNumber;
  late final String isMyVehicle;
  late final String updatedAt;
  late final String createdAt;

  MyVehicleData.fromJson(Map<String, dynamic> json){
    id = json['_id'];
    userAutoId = json['user_auto_id'];
    vehicleNumber = json['vehicle_number'];
    isMyVehicle = json['is_my_vehicle'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['_id'] = id;
    _data['user_auto_id'] = userAutoId;
    _data['vehicle_number'] = vehicleNumber;
    _data['is_my_vehicle'] = isMyVehicle;
    _data['updated_at'] = updatedAt;
    _data['created_at'] = createdAt;
    return _data;
  }
}