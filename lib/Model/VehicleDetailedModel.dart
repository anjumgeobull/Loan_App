class VehicleDetailedModel {
  VehicleDetailedModel({
    required this.status,
    required this.msg,
    required this.data,
  });
  late final int status;
  late final String msg;
  late final VehicleData data;

  VehicleDetailedModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    msg = json['msg'];
    data = VehicleData.fromJson(json['data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['msg'] = msg;
    _data['data'] = data.toJson();
    return _data;
  }
}

class VehicleData {
  VehicleData({
    required this.license,
    required this.fullChassis,
    required this.owner,
    required this.registrationDate,
    required this.fuelType,
    required this.engine,
    required this.vehicleClass,
    required this.makerName,
    required this.makerModel,
    required this.ownerCount,
    required this.insuranceDate,
    required this.pollution,
    required this.fitnessDt,
    required this.isBlacklisted,
    required this.model,
    required this.insurerName,
    required this.financierName,
    required this.vehicleColor,
    required this.manufacturingDate,
    required this.normsType,
    required this.ownerFatherName,
    required this.registrationAuthority,
    required this.insurancePolicyNo,
    required this.presentAddress,
    required this.permanentAddress,
    required this.vehicleCubicCapacity,
    required this.puccNo,
    required this.vehicleWeight,
    required this.seatingCapacity,
    required this.pucExpiry,
    required this.fitUpto,
    required this.taxUpto,
    required this.gvw,
    required this.unladenWeight,
    required this.sleeperCap,
    required this.standCap,
    required this.wheelBase,
    required this.blacklistStatus,
    required this.nocDetails,
    required this.rcStatus,
    required this.rcStatusAsOn,
    required this.permitNo,
    required this.permitIssueDate,
    required this.permitValidFrom,
    required this.permitValidUpto,
    required this.permitType,
    required this.bodyType,
    required this.noCyl,
  });
  late final String license;
  late final String fullChassis;
  late final String owner;
  late final String registrationDate;
  late final String fuelType;
  late final String engine;
  late final String vehicleClass;
  late final String makerName;
  late final String makerModel;
  late final String ownerCount;
  late final String insuranceDate;
  late final String pollution;
  late final String fitnessDt;
  late final bool isBlacklisted;
  late final String model;
  late final String insurerName;
  late final String financierName;
  late final String vehicleColor;
  late final String manufacturingDate;
  late final String normsType;
  late final String ownerFatherName;
  late final String registrationAuthority;
  late final String insurancePolicyNo;
  late final String presentAddress;
  late final String permanentAddress;
  late final String vehicleCubicCapacity;
  late final String puccNo;
  late final String vehicleWeight;
  late final String seatingCapacity;
  late final String pucExpiry;
  late final String fitUpto;
  late final String taxUpto;
  late final String gvw;
  late final String unladenWeight;
  late final String sleeperCap;
  late final String standCap;
  late final String wheelBase;
  late final String blacklistStatus;
  late final String nocDetails;
  late final String rcStatus;
  late final String rcStatusAsOn;
  late final String permitNo;
  late final String permitIssueDate;
  late final String permitValidFrom;
  late final String permitValidUpto;
  late final String permitType;
  late final String bodyType;
  late final String noCyl;
//addcondition

  VehicleData.fromJson(Map<String, dynamic> json){
    license = json['license']==null?"":json['license'];
    fullChassis = json['full_chassis']==null?"":json['full_chassis'];
    owner = json['owner']==null?"":json['owner'];
    registrationDate = json['registration_date']==null?"":json['registration_date'];
    fuelType = json['fuel_type']==null?"":json['fuel_type'];
    engine = json['engine']==null?"":json['engine'];
    vehicleClass = json['vehicle_class']==null?"":json['vehicle_class'];
    makerName = json['maker_name']==null?"":json['maker_name'];
    makerModel = json['maker_model']==null?"":json['maker_model'];
    ownerCount = json['owner_count']==null?"":json['owner_count'];
    insuranceDate = json['insurance_date']==null?"":json['insurance_date'];
    pollution = json['pollution']==null?"":json['pollution'];
    fitnessDt = json['fitness_dt']==null?"":json['fitness_dt'];
    isBlacklisted = json['is_blacklisted']==null?"":json['is_blacklisted'];
    model = json['model']==null?"":json['model'];
    insurerName = json['insurer_name']==null?"":json['insurer_name'];
    financierName = json['financier_name']==null?"":json['financier_name'];
    vehicleColor = json['vehicle_color']==null?"":json['vehicle_color'];
    manufacturingDate = json['manufacturing_date'];
    normsType = json['norms_type']==null?"":json['norms_type'];
    ownerFatherName = json['owner_father_name']==null?"":json['owner_father_name'];
    registrationAuthority = json['registration_authority']==null?"":json['registration_authority'];
    insurancePolicyNo = json['insurance_policy_no']==null?"":json['insurance_policy_no'];
    presentAddress = json['present_address']==null?"":json['present_address'];
    permanentAddress = json['permanent_address']==null?"":json['permanent_address'];
    vehicleCubicCapacity = json['vehicle_cubic_capacity']==null?"":json['vehicle_cubic_capacity'];
    puccNo = json['pucc_no']==null?"":json['pucc_no'];
    vehicleWeight = json['vehicle_weight']==null?"":json['vehicle_weight'];
    seatingCapacity = json['seating_capacity']==null?"":json['seating_capacity'];
    pucExpiry = json['puc_expiry']==null?"":json['puc_expiry'];
    fitUpto = json['fit_upto']==null?"":json['fit_upto'];
    //taxUpto = null;
    taxUpto = json['tax_upto']==null?"":json['tax_upto'];
    gvw = json['gvw']==null?"":json['gvw'];
    unladenWeight = json['unladen_weight']==null?"":json['unladen_weight'];
    sleeperCap = json['sleeper_cap']==null?"":json['sleeper_cap'];
    standCap = json['stand_cap']==null?"":json['stand_cap'];
    wheelBase = json['wheel_base']==null?"":json['wheel_base'];
    blacklistStatus = json['blacklist_status']==null?"":json['blacklist_status'];
    nocDetails = json['noc_details']==null?"":json['noc_details'];
    rcStatus = json['rc_status']==null?"":json['rc_status'];
   // rcStatusAsOn = null;
    rcStatusAsOn = json['"rc_status_as_on": ']==null?"":json['rc_status_as_on'];
    permitNo = json['permit_no']==null?"":json['permit_no'];
    permitIssueDate = json['permit_issue_date']==null?"":json['permit_issue_date'];
    permitValidFrom = json['permit_valid_from']==null?"":json['permit_valid_from'];
    permitValidUpto = json['permit_valid_upto']==null?"":json['permit_valid_upto'];
    permitType = json['permit_type']==null?"":json['permit_type'];
    bodyType = json['body_type']==null?"":json['body_type'];
    noCyl = json['no_cyl']==null?"":json['no_cyl'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['license'] = license;
    _data['full_chassis'] = fullChassis;
    _data['owner'] = owner;
    _data['registration_date'] = registrationDate;
    _data['fuel_type'] = fuelType;
    _data['engine'] = engine;
    _data['vehicle_class'] = vehicleClass;
    _data['maker_name'] = makerName;
    _data['maker_model'] = makerModel;
    _data['owner_count'] = ownerCount;
    _data['insurance_date'] = insuranceDate;
    _data['pollution'] = pollution;
    _data['fitness_dt'] = fitnessDt;
    _data['is_blacklisted'] = isBlacklisted;
    _data['model'] = model;
    _data['insurer_name'] = insurerName;
    _data['financier_name'] = financierName;
    _data['vehicle_color'] = vehicleColor;
    _data['manufacturing_date'] = manufacturingDate;
    _data['norms_type'] = normsType;
    _data['owner_father_name'] = ownerFatherName;
    _data['registration_authority'] = registrationAuthority;
    _data['insurance_policy_no'] = insurancePolicyNo;
    _data['present_address'] = presentAddress;
    _data['permanent_address'] = permanentAddress;
    _data['vehicle_cubic_capacity'] = vehicleCubicCapacity;
    _data['pucc_no'] = puccNo;
    _data['vehicle_weight'] = vehicleWeight;
    _data['seating_capacity'] = seatingCapacity;
    _data['puc_expiry'] = pucExpiry;
    _data['fit_upto'] = fitUpto;
    _data['tax_upto'] = taxUpto;
    _data['gvw'] = gvw;
    _data['unladen_weight'] = unladenWeight;
    _data['sleeper_cap'] = sleeperCap;
    _data['stand_cap'] = standCap;
    _data['wheel_base'] = wheelBase;
    _data['blacklist_status'] = blacklistStatus;
    _data['noc_details'] = nocDetails;
    _data['rc_status'] = rcStatus;
    _data['rc_status_as_on'] = rcStatusAsOn;
    _data['permit_no'] = permitNo;
    _data['permit_issue_date'] = permitIssueDate;
    _data['permit_valid_from'] = permitValidFrom;
    _data['permit_valid_upto'] = permitValidUpto;
    _data['permit_type'] = permitType;
    _data['body_type'] = bodyType;
    _data['no_cyl'] = noCyl;
    return _data;
  }
}