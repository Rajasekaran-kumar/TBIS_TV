class CustDashboardModel {
  String? available;
  String? fgStock;
  String? holdStock;
  String? ngStock;
  String? totalStock;
  String? todaySupply;
  String? nextDaySupply;
  String? abnormality;
  String? totalInwardVehicle;
  String? totalOutwardVehicle;

  CustDashboardModel(
      {this.available,
      this.fgStock,
      this.holdStock,
      this.ngStock,
      this.totalStock,
      this.todaySupply,
      this.nextDaySupply,
      this.abnormality,
      this.totalInwardVehicle,
      this.totalOutwardVehicle});

  CustDashboardModel.fromJson(Map<String, dynamic> json) {
    available = json['available'];
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['available'] = available;
    data['fgStock'] = fgStock;
    data['holdStock'] = holdStock;
    data['ngStock'] = ngStock;
    data['totalStock'] = totalStock;
    data['todaySupply'] = todaySupply;
    data['nextDaySupply'] = nextDaySupply;
    data['abnormality'] = abnormality;
    data['totalInwardVehicle'] = totalInwardVehicle;
    data['totalOutwardVehicle'] = totalOutwardVehicle;
    return data;
  }
}

class CustListModel {
  String? customerId;
  String? customerName;
  String? stockIn;
  String? fgStock;
  String? holdStock;
  String? ngStock;
  String? totalStock;
  String? todaySupply;
  String? nextDaySupply;
  String? abnormality;
  String? totalInwardVehicle;
  String? totalOutwardVehicle;

  CustListModel(
      {this.customerId,
      this.customerName,
      this.stockIn,
      this.fgStock,
      this.holdStock,
      this.ngStock,
      this.totalStock,
      this.todaySupply,
      this.nextDaySupply,
      this.abnormality,
      this.totalInwardVehicle,
      this.totalOutwardVehicle});

  CustListModel.fromJson(Map<String, dynamic> json) {
    customerId = json['customerId'];
    customerName = json['customerName'];
    stockIn = json['stockIn'];
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customerId'] = customerId;
    data['customerName'] = customerName;
    data['stockIn'] = stockIn;
    data['fgStock'] = fgStock;
    data['holdStock'] = holdStock;
    data['ngStock'] = ngStock;
    data['totalStock'] = totalStock;
    data['todaySupply'] = todaySupply;
    data['nextDaySupply'] = nextDaySupply;
    data['abnormality'] = abnormality;
    data['totalInwardVehicle'] = totalInwardVehicle;
    data['totalOutwardVehicle'] = totalOutwardVehicle;
    return data;
  }
}

class BIAreaModel {
  List<BIAreaResult>? result;

  BIAreaModel({this.result});

  BIAreaModel.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = <BIAreaResult>[];
      json['result'].forEach((v) {
        result!.add(BIAreaResult.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BIAreaResult {
  int? lineSpacePartConfigId;
  String? partSpaceName;
  int? partId;
  int? subLocationId;
  int? fromLineSpaceId;
  int? toLineSpaceId;
  String? fromLineSpaceName;
  String? toLineSpaceName;
  int? fromLineNo;
  int? toLineNo;
  int? fromCol;
  int? toCol;
  int? allocatedBins;
  int? usedSpace;
  int? fifoOrder;
  int? lineRackId;
  Null? lineRackCode;
  int? lineRackCompartmentId;
  Null? lineRackCompartmentName;
  int? lineUsageId;
  String? lineUsageName;
  int? spaceOccupation;
  int? lastFilledSpace;
  int? pNoOfStack;
  int? stock;

  BIAreaResult(
      {this.lineSpacePartConfigId,
      this.partSpaceName,
      this.partId,
      this.subLocationId,
      this.fromLineSpaceId,
      this.toLineSpaceId,
      this.fromLineSpaceName,
      this.toLineSpaceName,
      this.fromLineNo,
      this.toLineNo,
      this.fromCol,
      this.toCol,
      this.allocatedBins,
      this.usedSpace,
      this.fifoOrder,
      this.lineRackId,
      this.lineRackCode,
      this.lineRackCompartmentId,
      this.lineRackCompartmentName,
      this.lineUsageId,
      this.lineUsageName,
      this.spaceOccupation,
      this.lastFilledSpace,
      this.pNoOfStack,
      this.stock});

  BIAreaResult.fromJson(Map<String, dynamic> json) {
    lineSpacePartConfigId = json['lineSpacePartConfigId'];
    partSpaceName = json['partSpaceName'];
    partId = json['partId'];
    subLocationId = json['subLocationId'];
    fromLineSpaceId = json['fromLineSpaceId'];
    toLineSpaceId = json['toLineSpaceId'];
    fromLineSpaceName = json['fromLineSpaceName'];
    toLineSpaceName = json['toLineSpaceName'];
    fromLineNo = json['fromLineNo'];
    toLineNo = json['toLineNo'];
    fromCol = json['fromCol'];
    toCol = json['toCol'];
    allocatedBins = json['allocatedBins'];
    usedSpace = json['usedSpace'];
    fifoOrder = json['fifoOrder'];
    lineRackId = json['lineRackId'];
    lineRackCode = json['lineRackCode'];
    lineRackCompartmentId = json['lineRackCompartmentId'];
    lineRackCompartmentName = json['lineRackCompartmentName'];
    lineUsageId = json['lineUsageId'];
    lineUsageName = json['lineUsageName'];
    spaceOccupation = json['spaceOccupation'];
    lastFilledSpace = json['lastFilledSpace'];
    pNoOfStack = json['pNoOfStack'];
    stock = json['stock'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lineSpacePartConfigId'] = lineSpacePartConfigId;
    data['partSpaceName'] = partSpaceName;
    data['partId'] = partId;
    data['subLocationId'] = subLocationId;
    data['fromLineSpaceId'] = fromLineSpaceId;
    data['toLineSpaceId'] = toLineSpaceId;
    data['fromLineSpaceName'] = fromLineSpaceName;
    data['toLineSpaceName'] = toLineSpaceName;
    data['fromLineNo'] = fromLineNo;
    data['toLineNo'] = toLineNo;
    data['fromCol'] = fromCol;
    data['toCol'] = toCol;
    data['allocatedBins'] = allocatedBins;
    data['usedSpace'] = usedSpace;
    data['fifoOrder'] = fifoOrder;
    data['lineRackId'] = lineRackId;
    data['lineRackCode'] = lineRackCode;
    data['lineRackCompartmentId'] = lineRackCompartmentId;
    data['lineRackCompartmentName'] = lineRackCompartmentName;
    data['lineUsageId'] = lineUsageId;
    data['lineUsageName'] = lineUsageName;
    data['spaceOccupation'] = spaceOccupation;
    data['lastFilledSpace'] = lastFilledSpace;
    data['pNoOfStack'] = pNoOfStack;
    data['stock'] = stock;
    return data;
  }
}

class FGAreaModel {
  int? lineSpacePartConfigId;
  String? partSpaceName;
  int? partId;
  int? subLocationId;
  int? fromLineSpaceId;
  int? toLineSpaceId;
  String? fromLineSpaceName;
  String? toLineSpaceName;
  int? fromLineNo;
  int? toLineNo;
  int? fromCol;
  int? toCol;
  int? allocatedBins;
  int? usedSpace;
  int? fifoOrder;
  int? lineRackId;
  String? lineRackCode;
  int? lineRackCompartmentId;
  String? lineRackCompartmentName;
  int? lineUsageId;
  String? lineUsageName;
  int? spaceOccupation;
  int? lastFilledSpace;
  int? pNoOfStack;
  int? stock;
  List<SpaceDetails>? spaceDetails;

  FGAreaModel(
      {this.lineSpacePartConfigId,
      this.partSpaceName,
      this.partId,
      this.subLocationId,
      this.fromLineSpaceId,
      this.toLineSpaceId,
      this.fromLineSpaceName,
      this.toLineSpaceName,
      this.fromLineNo,
      this.toLineNo,
      this.fromCol,
      this.toCol,
      this.allocatedBins,
      this.usedSpace,
      this.fifoOrder,
      this.lineRackId,
      this.lineRackCode,
      this.lineRackCompartmentId,
      this.lineRackCompartmentName,
      this.lineUsageId,
      this.lineUsageName,
      this.spaceOccupation,
      this.lastFilledSpace,
      this.pNoOfStack,
      this.stock,
      this.spaceDetails});

  FGAreaModel.fromJson(Map<String, dynamic> json) {
    lineSpacePartConfigId = json['lineSpacePartConfigId'];
    partSpaceName = json['partSpaceName'];
    partId = json['partId'];
    subLocationId = json['subLocationId'];
    fromLineSpaceId = json['fromLineSpaceId'];
    toLineSpaceId = json['toLineSpaceId'];
    fromLineSpaceName = json['fromLineSpaceName'];
    toLineSpaceName = json['toLineSpaceName'];
    fromLineNo = json['fromLineNo'];
    toLineNo = json['toLineNo'];
    fromCol = json['fromCol'];
    toCol = json['toCol'];
    allocatedBins = json['allocatedBins'];
    usedSpace = json['usedSpace'];
    fifoOrder = json['fifoOrder'];
    lineRackId = json['lineRackId'];
    lineRackCode = json['lineRackCode'];
    lineRackCompartmentId = json['lineRackCompartmentId'];
    lineRackCompartmentName = json['lineRackCompartmentName'];
    lineUsageId = json['lineUsageId'];
    lineUsageName = json['lineUsageName'];
    spaceOccupation = json['spaceOccupation'];
    lastFilledSpace = json['lastFilledSpace'];
    pNoOfStack = json['pNoOfStack'];
    stock = json['stock'];
    if (json['spaceDetails'] != null) {
      spaceDetails = <SpaceDetails>[];
      json['spaceDetails'].forEach((v) {
        spaceDetails!.add(new SpaceDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lineSpacePartConfigId'] = lineSpacePartConfigId;
    data['partSpaceName'] = partSpaceName;
    data['partId'] = partId;
    data['subLocationId'] = subLocationId;
    data['fromLineSpaceId'] = fromLineSpaceId;
    data['toLineSpaceId'] = toLineSpaceId;
    data['fromLineSpaceName'] = fromLineSpaceName;
    data['toLineSpaceName'] = toLineSpaceName;
    data['fromLineNo'] = fromLineNo;
    data['toLineNo'] = toLineNo;
    data['fromCol'] = fromCol;
    data['toCol'] = toCol;
    data['allocatedBins'] = allocatedBins;
    data['usedSpace'] = usedSpace;
    data['fifoOrder'] = fifoOrder;
    data['lineRackId'] = lineRackId;
    data['lineRackCode'] = lineRackCode;
    data['lineRackCompartmentId'] = lineRackCompartmentId;
    data['lineRackCompartmentName'] = lineRackCompartmentName;
    data['lineUsageId'] = lineUsageId;
    data['lineUsageName'] = lineUsageName;
    data['spaceOccupation'] = spaceOccupation;
    data['lastFilledSpace'] = lastFilledSpace;
    data['pNoOfStack'] = pNoOfStack;
    data['stock'] = stock;
    if (spaceDetails != null) {
      data['spaceDetails'] = spaceDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SpaceDetails {
  int? lineSpacePartConfigId;
  String? partSpaceName;
  int? partId;
  int? subLocationId;
  int? fromLineSpaceId;
  int? toLineSpaceId;
  String? fromLineSpaceName;
  String? toLineSpaceName;
  int? fromLineNo;
  int? toLineNo;
  int? fromCol;
  int? toCol;
  int? allocatedBins;
  int? usedSpace;
  int? fifoOrder;
  int? lineRackId;
  String? lineRackCode;
  int? lineRackCompartmentId;
  String? lineRackCompartmentName;
  int? lineUsageId;
  String? lineUsageName;
  int? spaceOccupation;
  int? lastFilledSpace;
  int? pNoOfStack;
  int? stock;
  List<SpaceDetails>? spaceDetails;

  SpaceDetails(
      {this.lineSpacePartConfigId,
      this.partSpaceName,
      this.partId,
      this.subLocationId,
      this.fromLineSpaceId,
      this.toLineSpaceId,
      this.fromLineSpaceName,
      this.toLineSpaceName,
      this.fromLineNo,
      this.toLineNo,
      this.fromCol,
      this.toCol,
      this.allocatedBins,
      this.usedSpace,
      this.fifoOrder,
      this.lineRackId,
      this.lineRackCode,
      this.lineRackCompartmentId,
      this.lineRackCompartmentName,
      this.lineUsageId,
      this.lineUsageName,
      this.spaceOccupation,
      this.lastFilledSpace,
      this.pNoOfStack,
      this.stock,
      this.spaceDetails});

  SpaceDetails.fromJson(Map<String, dynamic> json) {
    lineSpacePartConfigId = json['lineSpacePartConfigId'];
    partSpaceName = json['partSpaceName'];
    partId = json['partId'];
    subLocationId = json['subLocationId'];
    fromLineSpaceId = json['fromLineSpaceId'];
    toLineSpaceId = json['toLineSpaceId'];
    fromLineSpaceName = json['fromLineSpaceName'];
    toLineSpaceName = json['toLineSpaceName'];
    fromLineNo = json['fromLineNo'];
    toLineNo = json['toLineNo'];
    fromCol = json['fromCol'];
    toCol = json['toCol'];
    allocatedBins = json['allocatedBins'];
    usedSpace = json['usedSpace'];
    fifoOrder = json['fifoOrder'];
    lineRackId = json['lineRackId'];
    lineRackCode = json['lineRackCode'];
    lineRackCompartmentId = json['lineRackCompartmentId'];
    lineRackCompartmentName = json['lineRackCompartmentName'];
    lineUsageId = json['lineUsageId'];
    lineUsageName = json['lineUsageName'];
    spaceOccupation = json['spaceOccupation'];
    lastFilledSpace = json['lastFilledSpace'];
    pNoOfStack = json['pNoOfStack'];
    stock = json['stock'];
    if (json['spaceDetails'] != null) {
      spaceDetails = <SpaceDetails>[];
      json['spaceDetails'].forEach((v) {
        spaceDetails!.add(SpaceDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['lineSpacePartConfigId'] = lineSpacePartConfigId;
    data['partSpaceName'] = partSpaceName;
    data['partId'] = partId;
    data['subLocationId'] = subLocationId;
    data['fromLineSpaceId'] = fromLineSpaceId;
    data['toLineSpaceId'] = toLineSpaceId;
    data['fromLineSpaceName'] = fromLineSpaceName;
    data['toLineSpaceName'] = toLineSpaceName;
    data['fromLineNo'] = fromLineNo;
    data['toLineNo'] = toLineNo;
    data['fromCol'] = fromCol;
    data['toCol'] = toCol;
    data['allocatedBins'] = allocatedBins;
    data['usedSpace'] = usedSpace;
    data['fifoOrder'] = fifoOrder;
    data['lineRackId'] = lineRackId;
    data['lineRackCode'] = lineRackCode;
    data['lineRackCompartmentId'] = lineRackCompartmentId;
    data['lineRackCompartmentName'] = lineRackCompartmentName;
    data['lineUsageId'] = lineUsageId;
    data['lineUsageName'] = lineUsageName;
    data['spaceOccupation'] = spaceOccupation;
    data['lastFilledSpace'] = lastFilledSpace;
    data['pNoOfStack'] = pNoOfStack;
    data['stock'] = stock;
    if (spaceDetails != null) {
      data['spaceDetails'] = spaceDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
