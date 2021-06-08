/// category_id : "1"
/// category_image : "http://costinspect.com:32/uploads/2tMYsNbuesfB9gT32meFbV.jpg"
/// name : "Black Friday Mockup SALE"

class DashboardBannerModel {
  String _categoryId;
  String _categoryImage;
  String _name;

  String get categoryId => _categoryId;
  String get categoryImage => _categoryImage;
  String get name => _name;

  DashboardBannerModel({
      String categoryId, 
      String categoryImage, 
      String name}){
    _categoryId = categoryId;
    _categoryImage = categoryImage;
    _name = name;
}

  DashboardBannerModel.fromJson(dynamic json) {
    _categoryId = json["category_id"];
    _categoryImage = json["category_image"];
    _name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["category_id"] = _categoryId;
    map["category_image"] = _categoryImage;
    map["name"] = _name;
    return map;
  }

}