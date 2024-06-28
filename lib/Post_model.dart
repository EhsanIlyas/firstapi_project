class PostModel {
  num _userId;
  num _id;
  String _title;
  String _body;

  PostModel({
    required num userId,
    required num id,
    required String title,
    required String body,
  })  : _userId = userId,
        _id = id,
        _title = title,
        _body = body;

  PostModel.fromJson(Map<String, dynamic> json)
      : _userId = json['userId'] as num,
        _id = json['id'] as num,
        _title = json['title'] as String,
        _body = json['body'] as String;

  num get userId => _userId;
  num get id => _id;
  String get title => _title;
  String get body => _body;

  PostModel copyWith({
    num? userId,
    num? id,
    String? title,
    String? body,
  }) => PostModel(
    userId: userId ?? _userId,
    id: id ?? _id,
    title: title ?? _title,
    body: body ?? _body,
  );

  Map<String, dynamic> toJson() {
    return {
      'userId': _userId,
      'id': _id,
      'title': _title,
      'body': _body,
    };
  }
}
