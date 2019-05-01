class MyCategory{
  final String id;
  final String name;

  MyCategory({this.id, this.name});

  /*
  Map<String, dynamic> mapJson = document.data;
new MyObject.fromJson(json.decode(json.encode(mapJson))));
   */


  factory MyCategory.fromJson(Map<String, dynamic> json) {
    return MyCategory(
      //id: json['data'][0]['id'] as String,
      //name: json['data'][0]['name'] as String,
      id: json['id'] as String,
      name: json['name'] as String,
    );
  }

}