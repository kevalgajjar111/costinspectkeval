import 'dart:async';

import 'package:costinspect/model/FiltertitleModel.dart';
import 'package:costinspect/model/ProductModel.dart';
import 'package:costinspect/utils/constant.dart';
import 'package:costinspect/widgets/star_display_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shimmer/shimmer.dart';

import 'SignupScreen.dart';

class AddressListScreen extends StatefulWidget {
  @override
  _AddressListScreenState createState() => _AddressListScreenState();
}

class _AddressListScreenState extends State<AddressListScreen> {


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
        backgroundColor: textColorBlue,
        title: Text(
          "ADDRESS",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        leading: Row(
          children: [
            IconButton(
              icon: Icon(
                Icons.arrow_back_ios_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
          ],
        ),

      ),
      body:  Container(
        //color: Colors.green,
        width: double.infinity,
        height: double.infinity,

        child: Container(

            child: Column(
              children: [
                Expanded(flex:10,
                   child: Container(),  ),
                Expanded(flex:1,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.of(context)
                            .push(
                            MaterialPageRoute(builder: (context) {
                              return AddressListScreen();
                            }));
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

                          boxShadow: [
                            BoxShadow(
                              color: textColorBlue.withOpacity(0.5),
                              offset: Offset(0.0, 9.0), //(x,y)
                              blurRadius: 9.0,
                            ),
                          ],
                        ),
                        child: Text(
                          "Deliver Here",
                          style: TextStyle(
                            color: colorWhite,
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
 
