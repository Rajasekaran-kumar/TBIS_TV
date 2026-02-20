class LoginMaster {
  bool? isSuccess;
  String? message;
  LoginModel? result;

  LoginMaster({this.isSuccess, this.message, this.result});

  LoginMaster.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    result =
        json['result'] != null ? LoginModel.fromJson(json['result']) : null;
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

class LoginModel {
  String? userName;
  int? userId;
  String? mobileNo;
  String? emailId;
  int? accessMobileSite;
  int? roleId;
  String? token;
  String? profileImage;
  String? name;

  LoginModel(
      {this.userName,
      this.userId,
      this.mobileNo,
      this.emailId,
      this.accessMobileSite,
      this.roleId,
      this.token,
      this.profileImage,
      this.name});

  LoginModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    userId = json['userId'];
    mobileNo = json['mobileNo'];
    emailId = json['emailId'];
    accessMobileSite = json['accessMobileSite'];
    roleId = json['roleId'];
    token = json['token'];
    profileImage = json['profileImage'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userName'] = userName;
    data['userId'] = userId;
    data['mobileNo'] = mobileNo;
    data['emailId'] = emailId;
    data['accessMobileSite'] = accessMobileSite;
    data['roleId'] = roleId;
    data['token'] = token;
    data['profileImage'] = profileImage;
    data['name'] = name;
    return data;
  }
}
