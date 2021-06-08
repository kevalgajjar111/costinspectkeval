import 'dart:async';

import 'package:costinspect/model/FiltertitleModel.dart';
import 'package:costinspect/model/ProductModel.dart';
import 'package:costinspect/screens/SigninScreen.dart';
import 'package:costinspect/utils/constant.dart';
import 'package:costinspect/widgets/star_display_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shimmer/shimmer.dart';

import 'SignupScreen.dart';

class MenuScreen extends StatefulWidget {
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {


  @override
  Widget build(BuildContext context) {
    /* SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);*/

    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.0,
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Text(
          "MENU",
          style: TextStyle(
              color: textColorBlue  , fontWeight: FontWeight.bold, fontSize: 18),
        ),
        leading: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.close,
                color: textColorBlue,
                size: 35,
              ),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
          ],
        ),

      ),
      body:  Container(
        color: Colors.white,
        width: double.infinity,
        height: double.infinity,

        child: Container(

            child: Column(
              children: [
                Expanded(flex:10,
                   child: Container(
                     alignment: Alignment.topLeft,
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         Container(
                           height: 1,
                           width: double.infinity,
                           color: textColorBlue,
                         ),
                         Padding(
                           padding: EdgeInsets.only(
                             left: 20.0,
                             right: 20.0,
                             top: 20.0,
                             bottom: 0.0,
                           ),
                           child: Text(
                             "My Profile",
                             style: TextStyle(
                               color: textColorBlue,
                               fontSize: 18,
                               fontFamily: "segoesemibold", ),
                           ),
                         ),
                         Padding(
                           padding: EdgeInsets.only(
                             left: 20.0,
                             right: 20.0,
                             top: 20.0,
                             bottom: 0.0,
                           ),
                           child: Text(
                             "Account Address",
                             style: TextStyle(
                               color: textColorBlue,
                               fontSize: 18,
                               fontFamily: "segoesemibold", ),
                           ),
                         ),
                         Padding(
                           padding: EdgeInsets.only(
                             left: 20.0,
                             right: 20.0,
                             top: 20.0,
                             bottom: 0.0,
                           ),
                           child: Text(
                             "Payment Methods",
                             style: TextStyle(
                               color: textColorBlue,
                               fontSize: 18,
                               fontFamily: "segoesemibold", ),
                           ),
                         ),
                         Padding(
                           padding: EdgeInsets.only(
                             left: 20.0,
                             right: 20.0,
                             top: 20.0,
                             bottom: 0.0,
                           ),
                           child: Text(
                             "Orders",
                             style: TextStyle(
                               color: textColorBlue,
                               fontSize: 18,
                               fontFamily: "segoesemibold", ),
                           ),
                         ),
                         Padding(
                           padding: EdgeInsets.only(
                             left: 20.0,
                             right: 20.0,
                             top: 20.0,
                             bottom: 0.0,
                           ),
                           child: Text(
                             "Wishlist",
                             style: TextStyle(
                               color: textColorBlue,
                               fontSize: 18,
                               fontFamily: "segoesemibold", ),
                           ),
                         ),
                         Padding(
                           padding: EdgeInsets.only(
                             left: 20.0,
                             right: 20.0,
                             top: 20.0,
                             bottom: 0.0,
                           ),
                           child: Text(
                             "Notifications",
                             style: TextStyle(
                               color: textColorBlue,
                               fontSize: 18,
                               fontFamily: "segoesemibold", ),
                           ),
                         ),
                         Padding(
                           padding: EdgeInsets.only(
                             left: 20.0,
                             right: 20.0,
                             top: 20.0,
                             bottom: 0.0,
                           ),
                           child: Text(
                             "Support",
                             style: TextStyle(
                               color: textColorBlue,
                               fontSize: 18,
                               fontFamily: "segoesemibold", ),
                           ),
                         ),
                    /* GestureDetector(
                       onTap: () {
                         Navigator.of(context)
                             .pushReplacement(MaterialPageRoute(builder: (context) {
                           return SigninScreen();
                         }));
                            },
                       child:Padding(
                         padding: EdgeInsets.only(
                           left: 20.0,
                           right: 20.0,
                           top: 20.0,
                           bottom: 0.0,
                         ),
                         child: Text(
                           "Login",
                           style: TextStyle(
                             color: textColorBlue,
                             fontSize: 18,
                             fontFamily: "segoesemibold", ),
                         ),
                       ),)*/
                       ],
                     ),
                   ),  ),
                Expanded(flex:1,
                  child: GestureDetector(
                      onTap: () {
                        Constant.prefs.setBool("loggedIn", false);

                        Navigator.pushAndRemoveUntil<dynamic>(
                          context,
                          MaterialPageRoute<dynamic>(
                            builder: (BuildContext context) => SigninScreen(),
                          ),
                              (route) => false,//if you want to disable back feature set to false
                        );

                      },
                      child:Container(
                        /*margin: EdgeInsets.all(10.0),*/
                        height: 50,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(
                          left: 20.0,
                          right: 20.0,
                          top: 0.0,
                          bottom: 0.0,
                        ),
                        decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          color: Colors.white,

                          boxShadow: [
                            BoxShadow(
                              color: textColorBlue.withOpacity(0.5),
                              offset: Offset(0.0, 9.0), //(x,y)
                              blurRadius: 9.0,
                            ),
                          ],
                        ),
                        child: Text(
                          "LOG OUT",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 18,
                            fontFamily: "segoesemibold", ),
                        ),
                      )) ),

              ],
            )
        ),
      ),
    );
  }
}
 
