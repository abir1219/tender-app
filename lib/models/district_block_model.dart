class DistrictBlockModel {
  String? name;
  List<String>? blocks;

  DistrictBlockModel({this.name, this.blocks});

  DistrictBlockModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    blocks = json['blocks'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['blocks'] = blocks;
    return data;
  }
}