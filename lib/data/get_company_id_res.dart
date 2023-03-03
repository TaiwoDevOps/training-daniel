class GetCompanyIdResponse {
  Payload? payload;
  int? totalCount;
  String? code;
  String? description;
  bool? hasErrors;

  GetCompanyIdResponse(
      {this.payload,
      this.totalCount,
      this.code,
      this.description,
      this.hasErrors});

  GetCompanyIdResponse.fromJson(Map<String, dynamic> json) {
    payload =
        json['payload'] != null ? Payload.fromJson(json['payload']) : null;
    totalCount = json['totalCount'];
    code = json['code'];
    description = json['description'];

    hasErrors = json['hasErrors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (payload != null) {
      data['payload'] = payload!.toJson();
    }
    data['totalCount'] = totalCount;
    data['code'] = code;
    data['description'] = description;
    data['hasErrors'] = hasErrors;
    return data;
  }
}

class Payload {
  int? id;
  String? courseTypeName;
  String? dateCreated;
  bool? isActive;
  bool? isDeleted;

  Payload(
      {this.id,
      this.courseTypeName,
      this.dateCreated,
      this.isActive,
      this.isDeleted});

  Payload.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseTypeName = json['courseTypeName'];
    dateCreated = json['dateCreated'];
    isActive = json['isActive'];
    isDeleted = json['isDeleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['courseTypeName'] = courseTypeName;
    data['dateCreated'] = dateCreated;
    data['isActive'] = isActive;
    data['isDeleted'] = isDeleted;
    return data;
  }
}
