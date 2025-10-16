class OverallModel {
  bool? isSuccess;
  String? message;
  OverallResult? result;

  OverallModel({this.isSuccess, this.message, this.result});

  OverallModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    result =
        json['result'] != null ? OverallResult.fromJson(json['result']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['isSuccess'] = isSuccess;
    data['message'] = message;
    if (result != null) {
      data['result'] = result!.toJson();
    }
    return data;
  }
}

class OverallResult {
  TruckDetail? truckDetail;
  StockStatus? stockStatus;
  Picking? picking;
  Delivery? delivery;
  SRV? srv;

  OverallResult({this.truckDetail});

  OverallResult.fromJson(Map<String, dynamic> json) {
    truckDetail = json['truckDetail'];
    stockStatus = json['stockStatus'];
    picking = json['picking'];
    delivery = json['delivery'];
    srv = json['srv'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['truckDetail'] = truckDetail;
    data['stockStatus'] = stockStatus;
    data['picking'] = picking;
    data['delivery'] = delivery;
    data['srv'] = srv;

    return data;
  }
}

class TruckDetail {
  int? noOfTrucks;
  int? onTime;
  int? delayNotReach;
  int? delayNotLoaded;

  TruckDetail(
      {this.noOfTrucks, this.onTime, this.delayNotReach, this.delayNotLoaded});

  TruckDetail.fromJson(Map<String, dynamic> json) {
    noOfTrucks = json['noOfTrucks'];
    onTime = json['onTime'];
    delayNotReach = json['delayNotReach'];
    delayNotLoaded = json['delayNotLoaded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['noOfTrucks'] = noOfTrucks;
    data['onTime'] = onTime;
    data['delayNotReach'] = delayNotReach;
    data['delayNotLoaded'] = delayNotLoaded;
    return data;
  }
}

class StockStatus {
  int? locationLevel;
  int? inStock;
  int? qcStock;
  int? outStock;

  StockStatus({this.locationLevel, this.inStock, this.qcStock, this.outStock});

  StockStatus.fromJson(Map<String, dynamic> json) {
    locationLevel = json['locationLevel'];
    inStock = json['inStock'];
    qcStock = json['qcStock'];
    outStock = json['outStock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['locationLevel'] = locationLevel;
    data['inStock'] = inStock;
    data['qcStock'] = qcStock;
    data['outStock'] = outStock;
    return data;
  }
}

class Picking {
  int? noOfParts;
  int? onTime;
  int? delayed;

  Picking({this.noOfParts, this.onTime, this.delayed});

  Picking.fromJson(Map<String, dynamic> json) {
    noOfParts = json['noOfParts'];
    onTime = json['onTime'];
    delayed = json['delayed'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['noOfParts'] = noOfParts;
    data['onTime'] = onTime;
    data['delayed'] = delayed;
    return data;
  }
}

class Delivery {
  int? noOfDi;
  int? onTime;
  int? delayed;
  int? revisedDi;

  Delivery({this.noOfDi, this.onTime, this.delayed, this.revisedDi});

  Delivery.fromJson(Map<String, dynamic> json) {
    noOfDi = json['noOfDi'];
    onTime = json['onTime'];
    delayed = json['delayed'];
    revisedDi = json['revisedDi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['noOfDi'] = noOfDi;
    data['onTime'] = onTime;
    data['delayed'] = delayed;
    data['revisedDi'] = revisedDi;
    return data;
  }
}

class SRV {
  int? totalSrv;
  int? onTime;
  int? delayed;
  int? short;

  SRV({this.totalSrv, this.onTime, this.delayed, this.short});

  SRV.fromJson(Map<String, dynamic> json) {
    totalSrv = json['totalSrv'];
    onTime = json['onTime'];
    delayed = json['delayed'];
    short = json['short'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['totalSrv'] = totalSrv;
    data['onTime'] = onTime;
    data['delayed'] = delayed;
    data['short'] = short;
    return data;
  }
}
