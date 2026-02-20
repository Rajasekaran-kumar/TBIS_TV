class DockModel {
  int? warehouseId;
  String? warehouseName;
  List<DockLoadingStatus>? dockLoadingStatus;
  List<DockLoadingDetail>? dockLoadingDetail;
  List<DockHeadingData>? dockHeadingData;

  DockModel(
      {this.warehouseId,
      this.warehouseName,
      this.dockLoadingStatus,
      this.dockLoadingDetail,
      this.dockHeadingData});

  DockModel.fromJson(Map<String, dynamic> json) {
    warehouseId = json['warehouseId'];
    warehouseName = json['warehouseName'];
    if (json['dockLoadingStatus'] != null) {
      dockLoadingStatus = <DockLoadingStatus>[];
      json['dockLoadingStatus'].forEach((v) {
        dockLoadingStatus!.add(DockLoadingStatus.fromJson(v));
      });
    }
    if (json['dockLoadingDetail'] != null) {
      dockLoadingDetail = <DockLoadingDetail>[];
      json['dockLoadingDetail'].forEach((v) {
        dockLoadingDetail!.add(DockLoadingDetail.fromJson(v));
      });
    }
    if (json['dockHeadingData'] != null) {
      dockHeadingData = <DockHeadingData>[];
      json['dockHeadingData'].forEach((v) {
        dockHeadingData!.add(DockHeadingData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['warehouseId'] = warehouseId;
    data['warehouseName'] = warehouseName;
    if (dockLoadingStatus != null) {
      data['dockLoadingStatus'] =
          dockLoadingStatus!.map((v) => v.toJson()).toList();
    }
    if (dockLoadingDetail != null) {
      data['dockLoadingDetail'] =
          dockLoadingDetail!.map((v) => v.toJson()).toList();
    }
    if (dockHeadingData != null) {
      data['dockHeadingData'] =
          dockHeadingData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class DockLoadingStatus {
  String? dockName;
  String? startTime;
  int? status;
  String? vehicleNo;

  DockLoadingStatus({this.dockName, this.startTime, this.status, this.vehicleNo});

  DockLoadingStatus.fromJson(Map<String, dynamic> json) {
    dockName = json['dockName'];
    startTime = json['startTime'];
    status = json['status'];
    vehicleNo = json['vehicleNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['dockName'] = dockName;
    data['startTime'] = startTime;
    data['status'] = status;
    data['vehicleNo'] = vehicleNo;
    return data;
  }
}

class DockLoadingDetail {
  String? startTime;
  String? process;
  String? customerName;
  int? loadingQueue;
  String? dockNo;
  String? status;
  String? vehicleNo;

  DockLoadingDetail(
      {this.startTime,
      this.process,
      this.customerName,
      this.loadingQueue,
      this.dockNo,
      this.status,this.vehicleNo});

  DockLoadingDetail.fromJson(Map<String, dynamic> json) {
    startTime = json['startTime'];
    process = json['process'];
    customerName = json['customerName'];
    loadingQueue = json['loadingQueue'];
    dockNo = json['dockNo'];
    status = json['status'];
    vehicleNo = json['vehicleNo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['startTime'] = startTime;
    data['process'] = process;
    data['customerName'] = customerName;
    data['loadingQueue'] = loadingQueue;
    data['dockNo'] = dockNo;
    data['status'] = status;
    data['vehicleNo'] = vehicleNo;
    return data;
  }
}

class DockHeadingData {
  String? title;
  double? value;
  double? percent;

  DockHeadingData({this.title, this.value, this.percent});

  DockHeadingData.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    value = json['value'];
    percent = json['percent'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['value'] = value;
    data['percent'] = percent;
    return data;
  }
}
