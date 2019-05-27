class Product{
  final String pname;
  final String pphoto;
  final String pprice;
  final String store_uid;
  final String views;
  final String featured;
  final String likes;
  final String store_id;
  final String product_id;
  final String sowner;
  final String like_users;

  Product({this.pname, this.pphoto, this.pprice, this.store_uid, this.views, this.featured, this.likes, this.store_id, this.product_id, this.sowner, this.like_users});

  /*
  Map<String, dynamic> mapJson = document.data;
new MyObject.fromJson(json.decode(json.encode(mapJson))));
   */


  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      //id: json['data'][0]['id'] as String,
      //name: json['data'][0]['name'] as String,
      pname: json['pname'] as String,
      pphoto: json['pphoto'] as String,
      pprice: json['pprice'] as String,
      store_uid: json['store_uid'] as String,
      views: json['views'] as String,
      featured: json['featured'] as String,
      likes: json['likes'] as String,
      store_id: json['store_id'] as String,
      product_id: json['product_id'] as String,
      sowner: json['sowner'] as String,
      like_users: json['like_users'] as String,
    );
  }

}