class Meta {
  int statusCode = 0;
  String statusMsg = "";
  String? error;
  Map<String, dynamic> response = <String, dynamic>{};

  Meta({this.statusCode = 0, this.statusMsg = ""});

  Meta.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    statusMsg = json['statusMsg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['statusCode'] = statusCode;
    data['statusMsg'] = statusMsg;
    return data;
  }
}
