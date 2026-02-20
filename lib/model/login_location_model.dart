class LocationMaster {
  List<LocationModel>? locationModel;

  LocationMaster({this.locationModel});

  LocationMaster.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      locationModel = <LocationModel>[];
      json['data'].forEach((v) {
        locationModel!.add(LocationModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (locationModel != null) {
      data['data'] = locationModel!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class LocationModel {
  String? locationId;
  String? locationName;
  String? warehouseId;
  String? warehouseName;
  String? subLocationId;
  String? subLocationName;
  String? udcId;
  String? udcName;

  LocationModel(
      {this.locationId,
      this.locationName,
      this.warehouseId,
      this.warehouseName,
      this.subLocationId,
      this.subLocationName,
      this.udcId,
      this.udcName});

  LocationModel.fromJson(Map<String, dynamic> json) {
    locationId = json['locationid'];
    locationName = json['locationname'];
    warehouseId = json['warehousid'];
    warehouseName = json['warehousename'];
    subLocationId = json['sublocationid'];
    subLocationName = json['sublocationname'];
    udcId = json['udc_id'];
    udcName = json['udcname'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['locationid'] = locationId;
    data['locationname'] = locationName;
    data['warehousid'] = warehouseId;
    data['warehousename'] = warehouseName;
    data['sublocationid'] = subLocationId;
    data['sublocationname'] = subLocationName;
    data['udc_id'] = udcId;
    data['udcname'] = udcName;
    return data;
  }
}
