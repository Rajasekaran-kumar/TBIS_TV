class TimelineModel {
  bool? isSuccess;
  String? message;
  TimeLineType? result;

  TimelineModel({this.isSuccess, this.message, this.result});

  TimelineModel.fromJson(Map<String, dynamic> json) {
    isSuccess = json['isSuccess'];
    message = json['message'];
    result =
        json['result'] != null ? TimeLineType.fromJson(json['result']) : null;
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

class TimeLineType {
  TimeLineResult? receiving;
  TimeLineResult? dispatch;

  TimeLineType({this.receiving, this.dispatch});

  TimeLineType.fromJson(Map<String, dynamic> json) {
    receiving = json['receiving'];
    dispatch = json['dispatch'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['receiving'] = receiving;
    data['dispatch'] = dispatch;

    return data;
  }
}

class TimeLineResult {
  int? timeSix;
  int? timeNine;
  int? timeTwelve;
  int? timeFifteen;
  int? timeEighteen;
  int? timeTwentyOne;

  TimeLineResult(
      {this.timeSix,
      this.timeNine,
      this.timeTwelve,
      this.timeFifteen,
      this.timeEighteen,
      this.timeTwentyOne});

  TimeLineResult.fromJson(Map<String, dynamic> json) {
    timeSix = json['timeSix'];
    timeNine = json['timeNine'];
    timeTwelve = json['timeTwelve'];
    timeFifteen = json['timeFifteen'];
    timeEighteen = json['timeEighteen'];
    timeTwentyOne = json['timeTwentyOne'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['timeSix'] = timeSix;
    data['timeNine'] = timeNine;
    data['timeTwelve'] = timeTwelve;
    data['timeFifteen'] = timeFifteen;
    data['timeEighteen'] = timeEighteen;
    data['timeTwentyOne'] = timeTwentyOne;

    return data;
  }
}
