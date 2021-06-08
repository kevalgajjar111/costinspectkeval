/// status : 200
/// message : "login token generated."
/// data : {"phone_number":"9713037142","loginToken":"fTUv756KMhGrQOslgegUdBBrkM5qTrwklEe7fF5irzO","_id":"60b9cb7d136dab072dbee539","first_name":"ritu","last_name":"soni","email":"ritu97130@gmail.com","password":"1271a84a1864614d29bdaeac1e5535b2:cdb6c0d97639","accessToken":"AxPPezIAK3OM5XwpE06iknAC26OV0clMofxiwb3urZq","createdAt":"2021-06-04T06:43:09.467Z","updatedAt":"2021-06-04T06:43:09.467Z","__v":0}

class LoginResponseModel {
  int _status;
  String _message;
  Data _data;

  int get status => _status;
  String get message => _message;
  Data get data => _data;

  LoginResponseModel({
      int status, 
      String message, 
      Data data}){
    _status = status;
    _message = message;
    _data = data;
}

  LoginResponseModel.fromJson(dynamic json) {
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

/// phone_number : "9713037142"
/// loginToken : "fTUv756KMhGrQOslgegUdBBrkM5qTrwklEe7fF5irzO"
/// _id : "60b9cb7d136dab072dbee539"
/// first_name : "ritu"
/// last_name : "soni"
/// email : "ritu97130@gmail.com"
/// password : "1271a84a1864614d29bdaeac1e5535b2:cdb6c0d97639"
/// accessToken : "AxPPezIAK3OM5XwpE06iknAC26OV0clMofxiwb3urZq"
/// createdAt : "2021-06-04T06:43:09.467Z"
/// updatedAt : "2021-06-04T06:43:09.467Z"
/// __v : 0

class Data {
  String _phoneNumber;
  String _loginToken;
  String _id;
  String _firstName;
  String _lastName;
  String _email;
  String _password;
  String _accessToken;
  String _createdAt;
  String _updatedAt;
  int _v;

  String get phoneNumber => _phoneNumber;
  String get loginToken => _loginToken;
  String get id => _id;
  String get firstName => _firstName;
  String get lastName => _lastName;
  String get email => _email;
  String get password => _password;
  String get accessToken => _accessToken;
  String get createdAt => _createdAt;
  String get updatedAt => _updatedAt;
  int get v => _v;

  Data({
      String phoneNumber, 
      String loginToken, 
      String id, 
      String firstName, 
      String lastName, 
      String email, 
      String password, 
      String accessToken, 
      String createdAt, 
      String updatedAt, 
      int v}){
    _phoneNumber = phoneNumber;
    _loginToken = loginToken;
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _password = password;
    _accessToken = accessToken;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _v = v;
}

  Data.fromJson(dynamic json) {
    _phoneNumber = json["phone_number"];
    _loginToken = json["loginToken"];
    _id = json["_id"];
    _firstName = json["first_name"];
    _lastName = json["last_name"];
    _email = json["email"];
    _password = json["password"];
    _accessToken = json["accessToken"];
    _createdAt = json["createdAt"];
    _updatedAt = json["updatedAt"];
    _v = json["__v"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["phone_number"] = _phoneNumber;
    map["loginToken"] = _loginToken;
    map["_id"] = _id;
    map["first_name"] = _firstName;
    map["last_name"] = _lastName;
    map["email"] = _email;
    map["password"] = _password;
    map["accessToken"] = _accessToken;
    map["createdAt"] = _createdAt;
    map["updatedAt"] = _updatedAt;
    map["__v"] = _v;
    return map;
  }

}