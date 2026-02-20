class WarehouseModel {
  String? warehouseId;
  String? warehouseName;
  String? customerId;
  String? customerName;
  String? partId;
  String? partNo;
  String? partName;
  String? availableStock;
  String? fgStock;
  String? holdStock;
  String? ngStock;
  String? totalStock;
  String? todaySupply;
  String? nextDaySupply;
  String? abnormality;
  String? totalInwardVehicle;
  String? totalOutwardVehicle;

  WarehouseModel(
      {this.warehouseId,
      this.warehouseName,
      this.customerId,
      this.customerName,
      this.partId,
      this.partNo,
      this.partName,
      this.availableStock,
      this.fgStock,
      this.holdStock,
      this.ngStock,
      this.totalStock,
      this.todaySupply,
      this.nextDaySupply,
      this.abnormality,
      this.totalInwardVehicle,
      this.totalOutwardVehicle});

  WarehouseModel.fromJson(Map<String, dynamic> json) {
    warehouseId = json['warehouseId'];
    warehouseName = json['warehouseName'];
    customerId = json['customerId'];
    customerName = json['customerName'];
    partId = json['partId'];
    partNo = json['partNo'];
    partName = json['partName'];
    availableStock = json['availableStock'];
    fgStock = json['fgStock'];
    holdStock = json['holdStock'];
    ngStock = json['ngStock'];
    totalStock = json['totalStock'];
    todaySupply = json['todaySupply'];
    nextDaySupply = json['nextDaySupply'];
    abnormality = json['abnormality'];
    totalInwardVehicle = json['totalInwardVehicle'];
    totalOutwardVehicle = json['totalOutwardVehicle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['warehouseId'] = this.warehouseId;
    data['warehouseName'] = this.warehouseName;
    data['customerId'] = this.customerId;
    data['customerName'] = this.customerName;
    data['partId'] = this.partId;
    data['partNo'] = this.partNo;
    data['partName'] = this.partName;
    data['availableStock'] = this.availableStock;
    data['fgStock'] = this.fgStock;
    data['holdStock'] = this.holdStock;
    data['ngStock'] = this.ngStock;
    data['totalStock'] = this.totalStock;
    data['todaySupply'] = this.todaySupply;
    data['nextDaySupply'] = this.nextDaySupply;
    data['abnormality'] = this.abnormality;
    data['totalInwardVehicle'] = this.totalInwardVehicle;
    data['totalOutwardVehicle'] = this.totalOutwardVehicle;
    return data;
  }
}

class SpaceWiseModel {
  String? customerId;
  String? customerName;
  String? totalSpace;
  String? usedSpace;
  String? freeArea;
  String? reservedSpace;
  String? overflowArea;

  SpaceWiseModel(
      {this.customerId,
      this.customerName,
      this.totalSpace,
      this.usedSpace,
      this.freeArea,
      this.reservedSpace,
      this.overflowArea});

  SpaceWiseModel.fromJson(Map<String, dynamic> json) {
    customerId = json['customerId'];
    customerName = json['customerName'];
    totalSpace = json['totalSpace'];
    usedSpace = json['usedSpace'];
    freeArea = json['freeArea'];
    reservedSpace = json['reservedSpace'];
    overflowArea = json['overflowArea'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customerId'] = customerId;
    data['customerName'] = customerName;
    data['totalSpace'] = totalSpace;
    data['usedSpace'] = usedSpace;
    data['freeArea'] = freeArea;
    data['reservedSpace'] = reservedSpace;
    data['overflowArea'] = overflowArea;
    return data;
  }
}
