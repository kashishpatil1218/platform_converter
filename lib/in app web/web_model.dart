class WebModel {
  int? id;
  String? webName, web;

  WebModel({
    required this.id,
    required this.web,
    required this.webName,
  });

  factory WebModel.fromMap(Map m1) => WebModel(
        id: m1['id'],
        web: m1['web'],
        webName: m1['webName'],
      );
}
