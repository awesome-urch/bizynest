// Created using https://app.quicktype.io/


// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);



import 'dart:convert';

Post postFromJson(String str) {
  final jsonData = json.decode(str);
  return Post.fromJson(jsonData);
}

String postToJson(Post data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}


List<Post> allPostsFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<Post>.from(jsonData.map((x) => Post.fromJson(x)));
}

String allPostsToJson(List<Post> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class Post {
  String request;
  String email;

  Post({
    this.request,
    this.email,
  });

  factory Post.fromJson(Map<String, dynamic> json) => new Post(
    request: json["request"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "request": request,
    "email": email,
  };
}



class ApiResponse {
  final int error;
  final String data;

  ApiResponse(this.error, this.data);

  ApiResponse.fromJson(Map<String, dynamic> json)
      : error = json['error'],
        data = json['data'];

  Map<String, dynamic> toJson() =>
      {
        'error': error,
        'data': data,
      };
}

class ApiResponseLogin {
  final int error;
  final String data;

  ApiResponseLogin(this.error, this.data);

  ApiResponseLogin.fromJson(Map<String, dynamic> json)
      : error = json['error'],
        data = json['data'];

  Map<String, dynamic> toJson() =>
      {
        'error': error,
        'data': data,
      };
}

class LoginObj{
  final String merchnat_id;

  LoginObj(this.merchnat_id);

  LoginObj.fromJson(Map<String, dynamic> json)
      : merchnat_id = json['merchnat_id'];

  Map<String, dynamic> toJson() =>
      {
        'merchnat_id' : merchnat_id,
      };
}