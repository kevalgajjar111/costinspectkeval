import 'dart:convert';

import 'package:costinspect/model/login_response_model.dart';
import 'package:costinspect/utils/common_functions.dart';
import 'package:costinspect/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:toast/toast.dart';
import 'DashboardScreen.dart';
import 'SigninScreen.dart';

class SignupScreen extends StatefulWidget {
  @override
  _SignupScreenState createState() => _SignupScreenState();
}


class _SignupScreenState extends State<SignupScreen> {
  FocusNode _fnFname,_fnLname,_fnEmail,_fnPassword,_fnConfirmPassword,_fnNumber;
  final _userfirst = TextEditingController();
  final _userlast = TextEditingController();
  final _userEmail = TextEditingController();
  final _password = TextEditingController();
  final _passwordconfirm = TextEditingController();
  final _userMobile = TextEditingController();
  bool isLoading = false;
  @override
  void dispose() {
    super.dispose();
    _fnFname.dispose();
    _fnLname.dispose();
    _fnEmail.dispose();
    _fnPassword.dispose();
    _fnConfirmPassword.dispose();
    _fnNumber.dispose();
  }

  @override
  void initState() {
    super.initState();
    _fnFname = new FocusNode();
    _fnFname.addListener(_onOnFocusNodeEvent);
    _fnLname = new FocusNode();
    _fnLname.addListener(_onOnFocusNodeEvent);
    _fnEmail = new FocusNode();
    _fnEmail.addListener(_onOnFocusNodeEvent);
    _fnPassword = new FocusNode();
    _fnPassword.addListener(_onOnFocusNodeEvent);
    _fnConfirmPassword = new FocusNode();
    _fnConfirmPassword.addListener(_onOnFocusNodeEvent);
    _fnNumber = new FocusNode();
    _fnNumber.addListener(_onOnFocusNodeEvent);
  }

  _onOnFocusNodeEvent() {
    setState(() {
      // Re-renders
    });
  }

  @override
  Widget build(BuildContext context) {
     SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);


    Size size = MediaQuery.of(context).size;
    return Scaffold(
      /*resizeToAvoidBottomInset: false,*/
      body: ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Container(
          //color: Colors.green,
          width: double.infinity,
          height: double.infinity,
          /*decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/login_two_bg.png"),
              fit: BoxFit.fill,
            ),
          ),*/
    /*    padding: EdgeInsets.only(top: 30, right: 10, left: 10, bottom: 10),*/
          child: SingleChildScrollView(
              child: Container(
           /*     margin: EdgeInsets.only(top: 0, right: 10, left: 10, bottom: 0),*/
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
                  child: Column(
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
                        "Sign Up",
                        style: TextStyle(
                            color: textColorBlue,
                            fontSize: 26,
                            fontFamily: "segoe",
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 25),
                      Row(

                        children: [
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [Text(
                                "First Name",
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
                                    color: _getContainerBackgroundColor(_fnFname),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0)),
                                    boxShadow: [
                                      _getContainerBoxShadow(_fnFname),
                                    ],
                                  ),


                                  child:
                                  TextFormField(
                                     controller: _userfirst,
                                    autofocus: true,
                                      focusNode: _fnFname,
                                      decoration: InputDecoration(
                                        hintText: 'Enter First Name',
                                        border: InputBorder.none,

                                      ),
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.text),


                                ),],
                            ),
                          ),
                          SizedBox(width: 20,),
                          Expanded(
                            flex: 1,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [Text(
                                "Last Name",
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
                                    color: _getContainerBackgroundColor(_fnLname),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(15.0)),
                                    boxShadow: [
                                      _getContainerBoxShadow(_fnLname),
                                    ],
                                  ),


                                  child:
                                  TextFormField(
                                    controller: _userlast,
                                      focusNode: _fnLname,
                                      decoration: InputDecoration(
                                        hintText: 'Enter Last Name',
                                        border: InputBorder.none,

                                      ),
                                      textInputAction: TextInputAction.next,
                                      keyboardType: TextInputType.text),


                                ),],
                            ),
                          )
                        ],
                      ),


                      SizedBox(height: 25),
                      Text(
                        "Email Address",
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
                          color: _getContainerBackgroundColor(_fnEmail),
                          borderRadius: BorderRadius.all(
                              Radius.circular(15.0)),
                          boxShadow: [
                            _getContainerBoxShadow(_fnEmail),
                          ],
                        ),


                        child:
                        TextFormField(
                         controller: _userEmail,
                            focusNode: _fnEmail,
                            decoration: InputDecoration(
                              hintText: 'Enter Email Address',
                              border: InputBorder.none,

                            ),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.emailAddress),


                      ),

                      SizedBox(height: 25),
                      Text(
                        "Mobile Number",
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
                          color: _getContainerBackgroundColor(_fnNumber),
                          borderRadius: BorderRadius.all(
                              Radius.circular(15.0)),
                          boxShadow: [
                            _getContainerBoxShadow(_fnNumber),
                          ],
                        ),


                        child:
                        TextFormField(
                         controller: _userMobile,
                            focusNode: _fnNumber,
                            decoration: InputDecoration(
                              hintText: 'Enter Mobile Number',
                              border: InputBorder.none,

                            ),
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number),


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

                        height: 50,
                        padding: EdgeInsets.only(left: 20.0,
                          right: 20.0,
                          top: 0.0,
                          bottom: 0.0,),

                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: _getContainerBackgroundColor(_fnPassword),
                          borderRadius: BorderRadius.all(
                              Radius.circular(15.0)),
                          boxShadow: [
                            _getContainerBoxShadow(_fnPassword),
                          ],
                        ),


                        child:
                        TextFormField(
                           controller: _password,
                            focusNode: _fnPassword,
                            decoration: InputDecoration(
                              hintText: 'Enter Password',
                              border: InputBorder.none,

                            ),
                            obscureText: true,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.text),


                      ),

                      SizedBox(height: 25),
                      Text(
                        "Confirm Password",
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
                          color: _getContainerBackgroundColor(_fnConfirmPassword),
                          borderRadius: BorderRadius.all(
                              Radius.circular(15.0)),
                          boxShadow: [
                            _getContainerBoxShadow(_fnConfirmPassword),
                          ],
                        ),


                        child:
                        TextFormField(
                           controller: _passwordconfirm,
                            focusNode: _fnConfirmPassword,
                            decoration: InputDecoration(
                              hintText: 'Enter Confirm Password',
                              border: InputBorder.none,

                            ),
                            obscureText: true,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.text),


                      ),


                      SizedBox(height: 25),
                  GestureDetector(
                    onTap: () {
                      if(_userfirst.text.isEmpty){
                        Toast.show("Password enter first name", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                      }else if(_userlast.text.isEmpty){
                        Toast.show("Password enter last name", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                      }
                     else if(!CommonFunctions.isEmail(_userEmail.text)){
                        Toast.show("Please enter valid Email", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                      }
                     else if(_userMobile.text.length<8){
                        Toast.show("Please enter valid Mobile Number", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                      }
                      else if(_password.text.isEmpty){
                        Toast.show("Please enter  passowrd", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                      }
                      else if(_passwordconfirm.text.isEmpty){
                        Toast.show("Please enter confirm passowrd", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                      }
                      else if(!(_password.text==_passwordconfirm.text)){
                        Toast.show("Password and Confirm Password not match", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                      }else{
                        print("click");
                        print(_password.text);
                        print(_passwordconfirm.text);
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
                        "Sign Up",
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
                          "Or Sign Up with",
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
                            "Already in Company Name? ",
                            style: TextStyle(
                              color: Color(0xFFAAAAAA),
                              fontSize: 14,
                              fontFamily: "segoe", ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(context, MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      SigninScreen()));
                            },
                            child: Text(
                              "Log In",
                              style: TextStyle(
                                  color: textColorBlue,
                                  fontSize: 14,
                                  fontFamily: "segoe",
                                  fontWeight: FontWeight.bold),
                            ),)

                        ],
                      ),],
                  ),
                )

              ],
            ),
          )),
        ),
      ),
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

    final uri = Uri.parse(Constant.base_url+'/users/register');
    Map<String, String> body = {
      'first_name': _userfirst.text,
      'last_name': _userlast.text,
      'email': _userEmail.text,
      'phone_number': _userMobile.text,
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
