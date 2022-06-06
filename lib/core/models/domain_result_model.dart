class DomainResultModel {
  List<Results>? result;

  DomainResultModel({
    this.result,
  });

  DomainResultModel.fromJson(Map<String, dynamic> json) {
    if (json['results'] != null) {
      result = <Results>[];
      json['results'].forEach((v) {
        result!.add(Results.fromJson(v));
      });
    }
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (result != null) {
      data['results'] = result!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  String? name;
  String? availability;

  Results({
    this.name,
    this.availability,
  });

  Results.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    availability = json['availability'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['availability'] = availability;
    return data;
  }
}
