class TBISError {
  String message = "";
  String errorCode = "";

  TBISError({required this.message, required this.errorCode});

  TBISError.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    errorCode = json['errorcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['message'] = message;
    data['errorcode'] = errorCode;
    return data;
  }
}
