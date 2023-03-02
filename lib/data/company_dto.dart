class CompanysData {
  Payload? payload;
  int? totalCount;
  String? code;
  String? description;
  bool? hasErrors;

  CompanysData(
      {this.payload,
      this.totalCount,
      this.code,
      this.description,
      this.hasErrors});

  CompanysData.fromJson(Map<String, dynamic> json) {
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
  int? pageSize;
  int? pageNumber;
  int? totalSize;
  int? totalPages;
  List<Items>? items;

  Payload(
      {this.pageSize,
      this.pageNumber,
      this.totalSize,
      this.totalPages,
      this.items});

  Payload.fromJson(Map<String, dynamic> json) {
    pageSize = json['pageSize'];
    pageNumber = json['pageNumber'];
    totalSize = json['totalSize'];
    totalPages = json['totalPages'];
    if (json['items'] != null) {
      items = <Items>[];
      json['items'].forEach((v) {
        items!.add(Items.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['pageSize'] = pageSize;
    data['pageNumber'] = pageNumber;
    data['totalSize'] = totalSize;
    data['totalPages'] = totalPages;
    if (items != null) {
      data['items'] = items!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Items {
  int? id;
  String? courseTypeName;
  String? description;
  String? dateCreated;
  bool? isActive;
  bool? isDeleted;

  Items(
      {this.id,
      this.courseTypeName,
      this.description,
      this.dateCreated,
      this.isActive,
      this.isDeleted});

  Items.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    courseTypeName = json['courseTypeName'];
    description = json['description'];
    dateCreated = json['dateCreated'];
    isActive = json['isActive'];
    isDeleted = json['isDeleted'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['courseTypeName'] = courseTypeName;
    data['description'] = description;
    data['dateCreated'] = dateCreated;
    data['isActive'] = isActive;
    data['isDeleted'] = isDeleted;
    return data;
  }
}
