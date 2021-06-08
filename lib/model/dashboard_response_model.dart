/// status : 200
/// message : "Success"
/// data : {"banners":[{"category_id":"1","category_image":"http://costinspect.com:32/uploads/2tMYsNbuesfB9gT32meFbV.jpg","name":"Black Friday Mockup SALE"}],"affiliate_websites":[{"name":"Amazon","id":"1","category":[{"category_id":"1","category_image":"http://costinspect.com:32/uploads/2tMYsNbuesfB9gT32meFbV.jpg","name":"Black Friday Mockup SALE"}]},{"name":"Wallmart","id":"2","category":[{"category_id":"1","category_image":"http://costinspect.com:32/uploads/2tMYsNbuesfB9gT32meFbV.jpg","name":"Black Friday Mockup SALE"}]},{"name":"ebay","id":"3","category":[{"category_id":"1","category_image":"http://costinspect.com:32/uploads/2tMYsNbuesfB9gT32meFbV.jpg","name":"Black Friday Mockup SALE"}]},{"name":"AliExpress","id":"4","category":[{"category_id":"1","category_image":"http://costinspect.com:32/uploads/2tMYsNbuesfB9gT32meFbV.jpg","name":"Black Friday Mockup SALE"}]},{"name":"BEST Buy","id":"5","category":[{"category_id":"1","category_image":"http://costinspect.com:32/uploads/2tMYsNbuesfB9gT32meFbV.jpg","name":"Black Friday Mockup SALE"}]}],"categories":[{"name":"Our Latest Collection","category_id":"1","category_image":"http://costinspect.com:32/uploads/2tMYsNbuesfB9gT32meFbV.jpg","products":[{"product_id":"1","product_name":"Colorblock Sneakers","ratings":"4.4","is_wishlisted":false,"product_image":"http://costinspect.com:32/uploads/2ShWq2iaW4PjeL2SSWHmnu.jpg","product_type":"simple","product_description":"Sketchers","product_price":"$ 150.00","store_id":"1"}]},{"name":"FETURED PRODUCTS","category_id":"2","category_image":"http://costinspect.com:32/uploads/2tMYsNbuesfB9gT32meFbV.jpg","products":[{"product_id":"1","product_name":"Colorblock Sneakers","ratings":"4.4","is_wishlisted":false,"product_image":"http://costinspect.com:32/uploads/2ShWq2iaW4PjeL2SSWHmnu.jpg","product_type":"simple","product_description":"Sketchers","product_price":"$ 150.00","store_id":"1"}]},{"name":"WE PICKED FOR YOU","category_id":"3","category_image":"http://costinspect.com:32/uploads/2tMYsNbuesfB9gT32meFbV.jpg","products":[{"product_id":"1","product_name":"Colorblock Sneakers","ratings":"4.4","is_wishlisted":false,"product_image":"http://costinspect.com:32/uploads/2ShWq2iaW4PjeL2SSWHmnu.jpg","product_type":"simple","product_description":"Sketchers","product_price":"$ 150.00","store_id":"1"}]},{"name":"LATEST COLLECETION","category_id":"4","category_image":"http://costinspect.com:32/uploads/2tMYsNbuesfB9gT32meFbV.jpg","products":[{"product_id":"1","product_name":"Colorblock Sneakers","ratings":"4.4","is_wishlisted":false,"product_image":"http://costinspect.com:32/uploads/2ShWq2iaW4PjeL2SSWHmnu.jpg","product_type":"simple","product_description":"Sketchers","product_price":"$ 150.00","store_id":"1"}]}],"other_products":[{"name":"Suggestions for You","category_id":"1","products":[{"product_id":"1","name":"Colorblock Sneakers","price":"$ 150.00","product_image":"http://costinspect.com:32/uploads/2tMYsNbuesfB9gT32meFbV.jpg"}]},{"name":"Popular Products","category_id":"2","products":[{"product_id":"1","name":"Colorblock Sneakers","price":"$ 150.00","product_image":"http://costinspect.com:32/uploads/2tMYsNbuesfB9gT32meFbV.jpg"}]},{"name":"Visited Products","category_id":"3","products":[{"product_id":"1","name":"Colorblock Sneakers","price":"$ 150.00","product_image":"http://costinspect.com:32/uploads/2tMYsNbuesfB9gT32meFbV.jpg"}]}]}

class DashboardResponseModel {
  int _status;
  String _message;
  Data _data;

  int get status => _status;
  String get message => _message;
  Data get data => _data;

  DashboardResponseModel({
      int status, 
      String message, 
      Data data}){
    _status = status;
    _message = message;
    _data = data;
}

  DashboardResponseModel.fromJson(dynamic json) {
    _status = json["status"];
    _message = json["message"];
    _data = json["data"] != null ? Data.fromJson(json["data"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["status"] = _status;
    map["message"] = _message;
    if (_data != null) {
      map["data"] = _data.toJson();
    }
    return map;
  }

}

/// banners : [{"category_id":"1","category_image":"http://costinspect.com:32/uploads/2tMYsNbuesfB9gT32meFbV.jpg","name":"Black Friday Mockup SALE"}]
/// affiliate_websites : [{"name":"Amazon","id":"1","category":[{"category_id":"1","category_image":"http://costinspect.com:32/uploads/2tMYsNbuesfB9gT32meFbV.jpg","name":"Black Friday Mockup SALE"}]},{"name":"Wallmart","id":"2","category":[{"category_id":"1","category_image":"http://costinspect.com:32/uploads/2tMYsNbuesfB9gT32meFbV.jpg","name":"Black Friday Mockup SALE"}]},{"name":"ebay","id":"3","category":[{"category_id":"1","category_image":"http://costinspect.com:32/uploads/2tMYsNbuesfB9gT32meFbV.jpg","name":"Black Friday Mockup SALE"}]},{"name":"AliExpress","id":"4","category":[{"category_id":"1","category_image":"http://costinspect.com:32/uploads/2tMYsNbuesfB9gT32meFbV.jpg","name":"Black Friday Mockup SALE"}]},{"name":"BEST Buy","id":"5","category":[{"category_id":"1","category_image":"http://costinspect.com:32/uploads/2tMYsNbuesfB9gT32meFbV.jpg","name":"Black Friday Mockup SALE"}]}]
/// categories : [{"name":"Our Latest Collection","category_id":"1","category_image":"http://costinspect.com:32/uploads/2tMYsNbuesfB9gT32meFbV.jpg","products":[{"product_id":"1","product_name":"Colorblock Sneakers","ratings":"4.4","is_wishlisted":false,"product_image":"http://costinspect.com:32/uploads/2ShWq2iaW4PjeL2SSWHmnu.jpg","product_type":"simple","product_description":"Sketchers","product_price":"$ 150.00","store_id":"1"}]},{"name":"FETURED PRODUCTS","category_id":"2","category_image":"http://costinspect.com:32/uploads/2tMYsNbuesfB9gT32meFbV.jpg","products":[{"product_id":"1","product_name":"Colorblock Sneakers","ratings":"4.4","is_wishlisted":false,"product_image":"http://costinspect.com:32/uploads/2ShWq2iaW4PjeL2SSWHmnu.jpg","product_type":"simple","product_description":"Sketchers","product_price":"$ 150.00","store_id":"1"}]},{"name":"WE PICKED FOR YOU","category_id":"3","category_image":"http://costinspect.com:32/uploads/2tMYsNbuesfB9gT32meFbV.jpg","products":[{"product_id":"1","product_name":"Colorblock Sneakers","ratings":"4.4","is_wishlisted":false,"product_image":"http://costinspect.com:32/uploads/2ShWq2iaW4PjeL2SSWHmnu.jpg","product_type":"simple","product_description":"Sketchers","product_price":"$ 150.00","store_id":"1"}]},{"name":"LATEST COLLECETION","category_id":"4","category_image":"http://costinspect.com:32/uploads/2tMYsNbuesfB9gT32meFbV.jpg","products":[{"product_id":"1","product_name":"Colorblock Sneakers","ratings":"4.4","is_wishlisted":false,"product_image":"http://costinspect.com:32/uploads/2ShWq2iaW4PjeL2SSWHmnu.jpg","product_type":"simple","product_description":"Sketchers","product_price":"$ 150.00","store_id":"1"}]}]
/// other_products : [{"name":"Suggestions for You","category_id":"1","products":[{"product_id":"1","name":"Colorblock Sneakers","price":"$ 150.00","product_image":"http://costinspect.com:32/uploads/2tMYsNbuesfB9gT32meFbV.jpg"}]},{"name":"Popular Products","category_id":"2","products":[{"product_id":"1","name":"Colorblock Sneakers","price":"$ 150.00","product_image":"http://costinspect.com:32/uploads/2tMYsNbuesfB9gT32meFbV.jpg"}]},{"name":"Visited Products","category_id":"3","products":[{"product_id":"1","name":"Colorblock Sneakers","price":"$ 150.00","product_image":"http://costinspect.com:32/uploads/2tMYsNbuesfB9gT32meFbV.jpg"}]}]

class Data {
  List<Banners> _banners;
  List<Affiliate_websites> _affiliateWebsites;
  List<Categories> _categories;
  List<Other_products> _otherProducts;

  List<Banners> get banners => _banners;
  List<Affiliate_websites> get affiliateWebsites => _affiliateWebsites;
  List<Categories> get categories => _categories;
  List<Other_products> get otherProducts => _otherProducts;

  Data({
      List<Banners> banners, 
      List<Affiliate_websites> affiliateWebsites, 
      List<Categories> categories, 
      List<Other_products> otherProducts}){
    _banners = banners;
    _affiliateWebsites = affiliateWebsites;
    _categories = categories;
    _otherProducts = otherProducts;
}

  Data.fromJson(dynamic json) {
    if (json["banners"] != null) {
      _banners = [];
      json["banners"].forEach((v) {
        _banners.add(Banners.fromJson(v));
      });
    }
    if (json["affiliate_websites"] != null) {
      _affiliateWebsites = [];
      json["affiliate_websites"].forEach((v) {
        _affiliateWebsites.add(Affiliate_websites.fromJson(v));
      });
    }
    if (json["categories"] != null) {
      _categories = [];
      json["categories"].forEach((v) {
        _categories.add(Categories.fromJson(v));
      });
    }
    if (json["other_products"] != null) {
      _otherProducts = [];
      json["other_products"].forEach((v) {
        _otherProducts.add(Other_products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (_banners != null) {
      map["banners"] = _banners.map((v) => v.toJson()).toList();
    }
    if (_affiliateWebsites != null) {
      map["affiliate_websites"] = _affiliateWebsites.map((v) => v.toJson()).toList();
    }
    if (_categories != null) {
      map["categories"] = _categories.map((v) => v.toJson()).toList();
    }
    if (_otherProducts != null) {
      map["other_products"] = _otherProducts.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// name : "Suggestions for You"
/// category_id : "1"
/// products : [{"product_id":"1","name":"Colorblock Sneakers","price":"$ 150.00","product_image":"http://costinspect.com:32/uploads/2tMYsNbuesfB9gT32meFbV.jpg"}]

class Other_products {
  String _name;
  String _categoryId;
  List<Products> _products;

  String get name => _name;
  String get categoryId => _categoryId;
  List<Products> get products => _products;

  Other_products({
      String name, 
      String categoryId, 
      List<Products> products}){
    _name = name;
    _categoryId = categoryId;
    _products = products;
}

  Other_products.fromJson(dynamic json) {
    _name = json["name"];
    _categoryId = json["category_id"];
    if (json["products"] != null) {
      _products = [];
      json["products"].forEach((v) {
        _products.add(Products.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["category_id"] = _categoryId;
    if (_products != null) {
      map["products"] = _products.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// product_id : "1"
/// name : "Colorblock Sneakers"
/// price : "$ 150.00"
/// product_image : "http://costinspect.com:32/uploads/2tMYsNbuesfB9gT32meFbV.jpg"

class Products {
  String _productId;
  String _name;
  String _price;
  String _productImage;

  String get productId => _productId;
  String get name => _name;
  String get price => _price;
  String get productImage => _productImage;

  Products({
      String productId, 
      String name, 
      String price, 
      String productImage}){
    _productId = productId;
    _name = name;
    _price = price;
    _productImage = productImage;
}

  Products.fromJson(dynamic json) {
    _productId = json["product_id"];
    _name = json["name"];
    _price = json["price"];
    _productImage = json["product_image"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["product_id"] = _productId;
    map["name"] = _name;
    map["price"] = _price;
    map["product_image"] = _productImage;
    return map;
  }

}

/// name : "Our Latest Collection"
/// category_id : "1"
/// category_image : "http://costinspect.com:32/uploads/2tMYsNbuesfB9gT32meFbV.jpg"
/// products : [{"product_id":"1","product_name":"Colorblock Sneakers","ratings":"4.4","is_wishlisted":false,"product_image":"http://costinspect.com:32/uploads/2ShWq2iaW4PjeL2SSWHmnu.jpg","product_type":"simple","product_description":"Sketchers","product_price":"$ 150.00","store_id":"1"}]

class Categories {
  String _name;
  String _categoryId;
  String _categoryImage;
  List<Products1> _products;

  String get name => _name;
  String get categoryId => _categoryId;
  String get categoryImage => _categoryImage;
  List<Products1> get products => _products;

  Categories({
      String name, 
      String categoryId, 
      String categoryImage, 
      List<Products1> products}){
    _name = name;
    _categoryId = categoryId;
    _categoryImage = categoryImage;
    _products = products;
}

  Categories.fromJson(dynamic json) {
    _name = json["name"];
    _categoryId = json["category_id"];
    _categoryImage = json["category_image"];
    if (json["products"] != null) {
      _products = [];
      json["products"].forEach((v) {
        _products.add(Products1.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["category_id"] = _categoryId;
    map["category_image"] = _categoryImage;
    if (_products != null) {
      map["products"] = _products.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// product_id : "1"
/// product_name : "Colorblock Sneakers"
/// ratings : "4.4"
/// is_wishlisted : false
/// product_image : "http://costinspect.com:32/uploads/2ShWq2iaW4PjeL2SSWHmnu.jpg"
/// product_type : "simple"
/// product_description : "Sketchers"
/// product_price : "$ 150.00"
/// store_id : "1"

class Products1 {
  String _productId;
  String _productName;
  String _ratings;
  bool _isWishlisted;
  String _productImage;
  String _productType;
  String _productDescription;
  String _productPrice;
  String _storeId;

  String get productId => _productId;
  String get productName => _productName;
  String get ratings => _ratings;
  bool get isWishlisted => _isWishlisted;
  String get productImage => _productImage;
  String get productType => _productType;
  String get productDescription => _productDescription;
  String get productPrice => _productPrice;
  String get storeId => _storeId;

  Products({
      String productId, 
      String productName, 
      String ratings, 
      bool isWishlisted, 
      String productImage, 
      String productType, 
      String productDescription, 
      String productPrice, 
      String storeId}){
    _productId = productId;
    _productName = productName;
    _ratings = ratings;
    _isWishlisted = isWishlisted;
    _productImage = productImage;
    _productType = productType;
    _productDescription = productDescription;
    _productPrice = productPrice;
    _storeId = storeId;
}

  Products1.fromJson(dynamic json) {
    _productId = json["product_id"];
    _productName = json["product_name"];
    _ratings = json["ratings"];
    _isWishlisted = json["is_wishlisted"];
    _productImage = json["product_image"];
    _productType = json["product_type"];
    _productDescription = json["product_description"];
    _productPrice = json["product_price"];
    _storeId = json["store_id"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["product_id"] = _productId;
    map["product_name"] = _productName;
    map["ratings"] = _ratings;
    map["is_wishlisted"] = _isWishlisted;
    map["product_image"] = _productImage;
    map["product_type"] = _productType;
    map["product_description"] = _productDescription;
    map["product_price"] = _productPrice;
    map["store_id"] = _storeId;
    return map;
  }

}

/// name : "Amazon"
/// id : "1"
/// category : [{"category_id":"1","category_image":"http://costinspect.com:32/uploads/2tMYsNbuesfB9gT32meFbV.jpg","name":"Black Friday Mockup SALE"}]

class Affiliate_websites {
  String _name;
  String _id;
  List<Category> _category;

  String get name => _name;
  String get id => _id;
  List<Category> get category => _category;

  Affiliate_websites({
      String name, 
      String id, 
      List<Category> category}){
    _name = name;
    _id = id;
    _category = category;
}

  Affiliate_websites.fromJson(dynamic json) {
    _name = json["name"];
    _id = json["id"];
    if (json["category"] != null) {
      _category = [];
      json["category"].forEach((v) {
        _category.add(Category.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["id"] = _id;
    if (_category != null) {
      map["category"] = _category.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// category_id : "1"
/// category_image : "http://costinspect.com:32/uploads/2tMYsNbuesfB9gT32meFbV.jpg"
/// name : "Black Friday Mockup SALE"

class Category {
  String _categoryId;
  String _categoryImage;
  String _name;

  String get categoryId => _categoryId;
  String get categoryImage => _categoryImage;
  String get name => _name;

  Category({
      String categoryId, 
      String categoryImage, 
      String name}){
    _categoryId = categoryId;
    _categoryImage = categoryImage;
    _name = name;
}

  Category.fromJson(dynamic json) {
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

/// category_id : "1"
/// category_image : "http://costinspect.com:32/uploads/2tMYsNbuesfB9gT32meFbV.jpg"
/// name : "Black Friday Mockup SALE"

class Banners {
  String _categoryId;
  String _categoryImage;
  String _name;

  String get categoryId => _categoryId;
  String get categoryImage => _categoryImage;
  String get name => _name;

  Banners({
      String categoryId, 
      String categoryImage, 
      String name}){
    _categoryId = categoryId;
    _categoryImage = categoryImage;
    _name = name;
}

  Banners.fromJson(dynamic json) {
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