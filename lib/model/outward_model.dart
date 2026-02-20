class OutwardModel {
  int? warehouseId;
  String? warehouseName;
  List<PickingHeader>? pickingHeader;
  List<PickingDetailData>? pickingDetailData;

  OutwardModel(
      {this.warehouseId,
      this.warehouseName,
      this.pickingHeader,
      this.pickingDetailData});

  OutwardModel.fromJson(Map<String, dynamic> json) {
    warehouseId = json['warehouseId'];
    warehouseName = json['warehouseName'];
    if (json['pickingHeader'] != null) {
      pickingHeader = <PickingHeader>[];
      json['pickingHeader'].forEach((v) {
        pickingHeader!.add(PickingHeader.fromJson(v));
      });
    }
    if (json['pickingDetailData'] != null) {
      pickingDetailData = <PickingDetailData>[];
      json['pickingDetailData'].forEach((v) {
        pickingDetailData!.add(PickingDetailData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['warehouseId'] = warehouseId;
    data['warehouseName'] = warehouseName;
    if (pickingHeader != null) {
      data['pickingHeader'] = pickingHeader!.map((v) => v.toJson()).toList();
    }
    if (pickingDetailData != null) {
      data['pickingDetailData'] =
          pickingDetailData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PickingHeader {
  String? title;
  double? value;
  double? percent;

  PickingHeader({this.title, this.value, this.percent});

  PickingHeader.fromJson(Map<String, dynamic> json) {
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

class PickingDetailData {
  int? subLocationId;
  String? subLocationName;
  List<PickingSlots>? pickingSlots;

  PickingDetailData(
      {this.subLocationId, this.subLocationName, this.pickingSlots});

  PickingDetailData.fromJson(Map<String, dynamic> json) {
    subLocationId = json['sublocationId'];
    subLocationName = json['subLocationName'];
    if (json['pickingSlots'] != null) {
      pickingSlots = <PickingSlots>[];
      json['pickingSlots'].forEach((v) {
        pickingSlots!.add(PickingSlots.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['sublocationId'] = subLocationId;
    data['subLocationName'] = subLocationName;
    if (pickingSlots != null) {
      data['pickingSlots'] = pickingSlots!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PickingSlots {
  String? timeTile;
  int? total;
  int? completed;
  int? pending;
  int? progress;
  int? delay;

  PickingSlots(
      {this.timeTile, this.total, this.pending, this.progress, this.delay});

  PickingSlots.fromJson(Map<String, dynamic> json) {
    timeTile = json['timeTile'];
    total = json['total'];
    completed = json['completed'];
    pending = json['pending'];
    progress = json['progress'];
    delay = json['delay'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timeTile'] = timeTile;
    data['total'] = total;
    data['completed'] = completed;
    data['pending'] = pending;
    data['progress'] = progress;
    data['delay'] = delay;
    return data;
  }
}
