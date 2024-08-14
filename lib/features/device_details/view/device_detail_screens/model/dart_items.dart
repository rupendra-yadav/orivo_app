class DataItems {
  String field;

  DataItems({required this.field});

  factory DataItems.fromJson(Map<String, dynamic> json) {
    return DataItems(
    field : json['field']?? '',
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['field'] = field;
    return data;
  }
}