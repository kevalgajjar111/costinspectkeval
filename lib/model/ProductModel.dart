class ProductModel {
  String title;
  String name;
  String des;
  String type;
  String price;

  ProductModel({this.title, this.name, this.des, this.type, this.price});

  ProductModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    name = json['name'];
    des = json['des'];
    type = json['type'];
    price = json['price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['name'] = this.name;
    data['des'] = this.des;
    data['type'] = this.type;
    data['price'] = this.price;
    return data;
  }
}
