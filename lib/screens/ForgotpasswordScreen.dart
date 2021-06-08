import 'dart:convert';

import 'package:costinspect/model/login_response_model.dart';
import 'package:costinspect/screens/SigninScreen.dart';
import 'package:costinspect/utils/common_functions.dart';
import 'package:costinspect/utils/constant.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:http/http.dart' as http;
import 'package:toast/toast.dart';


class ForgotpasswordScreen extends StatefulWidget {
  @override
  _ForgotpasswordScreenState createState() => _ForgotpasswordScreenState();
}


class _ForgotpasswordScreenState extends State<ForgotpasswordScreen> {
  FocusNode _focusNode;
  FocusNode _focusNodePassword;
  final _userEmail = TextEditingController();
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

        child: Container(
          //color: Colors.green,
          width: double.infinity,
          height: double.infinity,
        /*  decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/login_two_bg.png"),
              fit: BoxFit.fill,
            ),
          ),*/

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
                          top: -90,
                          left: -100,
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
                      GestureDetector(
                      onTap: () {
                        Navigator.pop(context,true);
                },
                  child:Image.asset("assets/images/ic_back.png",height: 20 ,width: 20,),),

                      SizedBox(height: 100),
                      Text(
                        "Forgot Password?",
                        style: TextStyle(
                            color: textColorBlue,
                            fontSize: 26,
                            fontFamily: "segoe",
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Enter your email to receive \npassword ecovery link",
                        style: TextStyle(
                            color: Color(0xFFAAAAAA),
                            fontSize: 16,
                            fontFamily: "segoe"),
                      ),

                      SizedBox(height: 40),
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
                            /*style: TextStyle(
                            color: Color(0xFF2F4858),
                            fontSize: 16,
                            fontFamily: "segoe",
                            fontWeight: FontWeight.bold),*/
                            decoration: InputDecoration(
                              hintText: 'Enter Email',
                              border: InputBorder.none,
                              hintStyle: TextStyle(
                                color: Color(0xFF2F4858),
                                fontSize: 16,
                                fontFamily: "segoe",),

                            ),

                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.emailAddress),


                      ),



                      SizedBox(height: 40),

                      GestureDetector(
                        onTap: () {
                          if(!CommonFunctions.isEmail(_userEmail.text)){
                            Toast.show("Please enter valid Email", context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
                          }
                          else{
                            setState(() {
                              isLoading = true;
                              postForgotRequest();
                            });
                          }
                        },

                child: Container(
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
                            "Get New Password",
                            style: TextStyle(
                                color: colorWhite,
                                fontSize: 16,
                                fontFamily: "segoe",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      SizedBox(height: 25),


                    ],
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
  Future<http.Response> postForgotRequest () async {

    final uri = Uri.parse(Constant.base_url+'/users/forget_password');
    Map<String, String> body = {
      'email': _userEmail.text,
    };
    await  http.post(uri,
        /* headers: {"Content-Type": "application/json"},*/
        body: body
    ).then((http.Response response)
    {
      final jsonData = json.decode(response.body);
      print(jsonData);
      setState(() {
        isLoading = false;
      });
      if(response.statusCode==200){

        Toast.show(jsonData['message'], context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
        Navigator.pop(context,true);
      }

      else{
        print(jsonData['message'] as String);
        Toast.show(jsonData['message'], context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);
      }

    }

    );
  }

}
