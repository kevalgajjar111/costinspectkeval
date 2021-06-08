import 'dart:convert';

import 'package:costinspect/model/login_response_model.dart';
import 'package:costinspect/utils/common_functions.dart';
import 'package:costinspect/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:toast/toast.dart';
import 'DashboardScreen.dart';
import 'ForgotpasswordScreen.dart';
import 'SignupScreen.dart';
import 'package:http/http.dart' as http;

class SigninScreen extends StatefulWidget {
  @override
  _SigninScreenState createState() => _SigninScreenState();
}


class _SigninScreenState extends State<SigninScreen> {
  FocusNode _focusNode;
  FocusNode _focusNodePassword;
  final _userEmail = TextEditingController();
  final _password = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
    _focusNodePassword.dispose();
  }

  @override
  void initState() {
    super.initState();
    _focusNode = new FocusNode();
    _focusNode.addListener(_onOnFocusNodeEvent);
    _focusNodePassword = new FocusNode();
    _focusNodePassword.addListener(_onOnFocusNodeEvent);
  }

  _onOnFocusNodeEvent() {
    setState(() {
      // Re-renders
    });
  }

  @override
  Widget build(BuildContext context) {
    /* SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);*/

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child:
            Container(
              //color: Colors.green,
              width: double.infinity,
              height: double.infinity,
             child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          width: 200,
                          height: 30,
                          child: Stack(
                            overflow: Overflow.visible,
                            alignment: AlignmentDirectional.centerStart,
                            children: <Widget>[
                              Positioned(
                                  top: -70,
                                  left: -40,
                                  child: Container(
                                    width: 200,
                                    height: 200,
                                    decoration: BoxDecoration(
                                      shape: BoxShape. circle,
                                      color: textColorBlue,
                                    ),

                                  )
                              ),
                            ],
                          ),
                        ),

                        Container(
                          padding: EdgeInsets.only(right: 10, left: 10, bottom: 10),
                          margin: EdgeInsets.only(top: 0, right: 10, left: 10, bottom: 0),
                          child:  Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "COST\nINSPECT",
                                style: TextStyle(
                                    color: colorWhite,
                                    fontSize: 24,
                                    fontFamily: "segoe",
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 70),
                              Text(
                                "Login",
                                style: TextStyle(
                                    color: textColorBlue,
                                    fontSize: 26,
                                    fontFamily: "segoe",
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "Email",
                                style: TextStyle(
                                    color: Color(0xFF2F4858),
                                    fontSize: 16,
                                    fontFamily: "segoe",
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),

                              Container(

                                height: 50,
                                padding: EdgeInsets.only(left: 20.0,
                                  right: 20.0,
                                  top: 0.0,
                                  bottom: 0.0,),

                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: _getContainerBackgroundColor(_focusNode),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(15.0)),
                                  boxShadow: [
                                    _getContainerBoxShadow(_focusNode),
                                  ],
                                ),


                                child:
                                TextFormField(
                                    controller: _userEmail,
                                    autofocus: true,
                                    focusNode: _focusNode,
                                    decoration: InputDecoration(
                                      hintText: 'Enter Email',

                                      border: InputBorder.none,
                                      hintStyle: TextStyle(
                                        color: Color(0xFF2F4858),
                                        fontSize: 16,
                                        fontFamily: "segoe",),

                                    ),

                                    textInputAction: TextInputAction.next,

                                    keyboardType: TextInputType.emailAddress),



                              ),

                              SizedBox(height: 25),
                              Text(
                                "Password",
                                style: TextStyle(
                                    color: Color(0xFF2F4858),
                                    fontSize: 16,
                                    fontFamily: "segoe",
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(height: 5),
                              Container(
                                /*margin: EdgeInsets.all(10.0),*/
                                padding: EdgeInsets.only(
                                  left: 20.0,
                                  right: 20.0,
                                  top: 0.0,
                                  bottom: 0.0,
                                ),
                                decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: _getContainerBackgroundColor(_focusNodePassword),
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(15.0)),
                                  boxShadow: [
                                    _getContainerBoxShadow(_focusNodePassword),
                                  ],
                                ),
                                child: Row(
                                  children: [
                                    Expanded(
                                      flex: 3,
                                      child: TextFormField(
                                          controller: _password,
                                          focusNode: _focusNodePassword,
                                          decoration: InputDecoration(
                                            hintText: 'Enter Password',
                                            border: InputBorder.none,
                                          ),
                                          obscureText: true,
                                          textInputAction: TextInputAction.done,
                                          keyboardType: TextInputType.visiblePassword),
                                    ),
                                    Expanded(
                                        flex: 1,
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.push(context, MaterialPageRoute(
                                                builder: (BuildContext context) =>
                                                    ForgotpasswordScreen()));
                                          },
                                          child:Text(
                                            "Forgot?",
                                            textAlign: TextAlign.end,
                                            style: TextStyle(
                                                color: textColorBlue,
                                                fontSize: 16,
                                                fontFamily: "segoe",
                                                fontWeight: FontWeight.bold),
                                          ),
                                        )



                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(height: 25),
                              GestureDetector(
                                  onTap: () {
                                    if(!CommonFunctions.isEmail(_userEmail.text)){
                                      Toast.show("Please enter valid Email", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                                    }
                                    else  if(_password.text.isEmpty){
                                      Toast.show("Password cannot be empty", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                                    }else{
                                      setState(() {
                                        isLoading = true;
                                        postLoginRequest();
                                      });
                                    }
                                  },
                                  child:Container(
                                    /*margin: EdgeInsets.all(10.0),*/
                                    height: 50,
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.only(
                                      left: 20.0,
                                      right: 20.0,
                                      top: 0.0,
                                      bottom: 0.0,
                                    ),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: textColorBlue,
                                      borderRadius: BorderRadius.all(Radius.circular(15.0)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: textColorBlue.withOpacity(0.5),
                                          offset: Offset(0.0, 9.0), //(x,y)
                                          blurRadius: 9.0,
                                        ),
                                      ],
                                    ),
                                    child: Text(
                                      "Login",
                                      style: TextStyle(
                                          color: colorWhite,
                                          fontSize: 16,
                                          fontFamily: "segoe",
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),),


                              SizedBox(height: 25),
                              Center(
                                child: Text(
                                  "Or login with",
                                  style: TextStyle(
                                      color: Color(0xFFAAAAAA),
                                      fontSize: 14,
                                      fontFamily: "segoe"),
                                ),
                              ),
                              SizedBox(height: 25),

                              Row(
                                children: [
                                  Expanded(
                                      flex: 1,
                                      child:  Image.asset("assets/images/fb_icon.png",height: 50 ,alignment: Alignment.centerRight,)
                                  ),
                                  SizedBox(width: 25),
                                  Expanded(
                                      flex: 1,
                                      child:  Image.asset("assets/images/g_icon.png",height: 50 ,alignment: Alignment.centerLeft, )
                                  ),
                                ],
                              ),

                              SizedBox(height: 50),

                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "New to Company name? ",
                                    style: TextStyle(
                                      color: Color(0xFFAAAAAA),
                                      fontSize: 14,
                                      fontFamily: "segoe", ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.pushReplacement(context, MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              SignupScreen()));
                                    },
                                    child: Text(
                                      "Sign Up",
                                      style: TextStyle(
                                          color: textColorBlue,
                                          fontSize: 14,
                                          fontFamily: "segoe",
                                          fontWeight: FontWeight.bold),
                                    ),)

                                ],
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )),
            ),
        )



    );
  }

  Color _getContainerBackgroundColor(FocusNode node) {
    return node.hasFocus ? Colors.white : textColorBlue.withOpacity(0.2);
  }
  BoxShadow _getContainerBoxShadow(FocusNode node) {
    return node.hasFocus ? BoxShadow(
      color: Colors.black26,
      offset: Offset(0.0, 0.0), //(x,y)
      blurRadius: 14.0,
    ) : BoxShadow(
      color: Colors.transparent,
      offset: Offset(0.0, 0.0), //(x,y)
      blurRadius: 0.0,
    );
  }


  Future<http.Response> postLoginRequest () async {

    final uri = Uri.parse(Constant.base_url+'/users/login');
    Map<String, String> body = {
      'email': _userEmail.text,
      'password': _password.text,
    };
    await  http.post(uri,
       /* headers: {"Content-Type": "application/json"},*/
        body: body
    ).then((http.Response response) {
      final jsonData = json.decode(response.body);
      print(jsonData);
      setState(() {
        isLoading = false;
      });
      if(response.statusCode==200){
        var map = Map<String, dynamic>.from(jsonData);
        //List<LoginModel> datas = map['data'];
        var user = LoginResponseModel.fromJson(map);
        print(user.data.email);
        Constant.prefs.setBool("loggedIn", true);
        Toast.show(jsonData['message'], context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
        Navigator.pushReplacement(context, MaterialPageRoute(
            builder: (BuildContext context) =>
                DashboardScreen()));
      }
      else{
        print(jsonData['message'] as String);
        Toast.show(jsonData['message'], context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
      }

    }

    );
  }
}
