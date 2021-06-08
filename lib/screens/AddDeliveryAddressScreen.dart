import 'dart:async';

import 'package:costinspect/model/FiltertitleModel.dart';
import 'package:costinspect/model/ProductModel.dart';
import 'package:costinspect/screens/AddressListScreen.dart';
import 'package:costinspect/utils/constant.dart';
import 'package:costinspect/widgets/star_display_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shimmer/shimmer.dart';

import 'SignupScreen.dart';

class AddDeliveryAddressScreen extends StatefulWidget {
  @override
  _AddDeliveryAddressScreenState createState() =>
      _AddDeliveryAddressScreenState();
}

class _AddDeliveryAddressScreenState extends State<AddDeliveryAddressScreen> {
  FocusNode fnName,
      fnPhoneNo,
      fnAltPhone,
      fnPincode,
      fnCity,
      fnState,
      fnAdd1,
      fnAdd2,
      fnLandmark;

  @override
  void dispose() {
    super.dispose();
    fnName.dispose();
    fnPhoneNo.dispose();
    fnAltPhone.dispose();
    fnPincode.dispose();
    fnCity.dispose();
    fnAdd1.dispose();
    fnAdd2.dispose();
    fnLandmark.dispose();
    fnState.dispose();
  }

  @override
  void initState() {
    super.initState();
    fnName = new FocusNode();
    fnName.addListener(_onOnFocusNodeEvent);
    fnPhoneNo = new FocusNode();
    fnPhoneNo.addListener(_onOnFocusNodeEvent);
    fnAltPhone = new FocusNode();
    fnAltPhone.addListener(_onOnFocusNodeEvent);
    fnPincode = new FocusNode();
    fnPincode.addListener(_onOnFocusNodeEvent);
    fnCity = new FocusNode();
    fnCity.addListener(_onOnFocusNodeEvent);
    fnAdd1 = new FocusNode();
    fnAdd1.addListener(_onOnFocusNodeEvent);
    fnAdd2 = new FocusNode();
    fnAdd2.addListener(_onOnFocusNodeEvent);
    fnLandmark = new FocusNode();
    fnLandmark.addListener(_onOnFocusNodeEvent);
    fnState = new FocusNode();
    fnState.addListener(_onOnFocusNodeEvent);
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
    var bottom = MediaQuery.of(context).viewInsets.bottom;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      /*resizeToAvoidBottomInset: false,*/
      appBar: AppBar(
        toolbarHeight: 70.0,
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: textColorBlue,
        title: Text(
          "ADD DELIVERY ADDRESS",
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
      body: Container(
        //color: Colors.green,
        width: double.infinity,
        height: double.infinity,

        child: Container(

          child: Column(
        children: [
          Expanded(flex:1,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.only(right: 10, left: 10, bottom: 10),
                      margin: EdgeInsets.only(top: 0, right: 10, left: 10, bottom: 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 25),
                          Text(
                            "Full Name",
                            style: TextStyle(
                                color: Color(0xFF2F4858),
                                fontSize: 13,
                                fontFamily: "segoesemibold",
                                fontWeight: FontWeight.bold),
                          ), //full name
                          SizedBox(height: 5),
                          Container(
                            height: 50,
                            padding: EdgeInsets.only(
                              left: 20.0,
                              right: 20.0,
                              top: 0.0,
                              bottom: 0.0,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: _getContainerBackgroundColor(fnName),
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              boxShadow: [
                                _getContainerBoxShadow(fnName),
                              ],
                            ),
                            child: TextFormField(
                              // controller: userNameEditTextController,
                                focusNode: fnName,
                                style: TextStyle(
                                    fontFamily: "segoeregular",
                                    fontSize: 14,
                                    color: Color(0xff191847)
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Enter Full Name',
                                  border: InputBorder.none,
                                ),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text),
                          ),
                          SizedBox(height: 25),
                          Text(
                            "Phone Number",
                            style: TextStyle(
                                color: Color(0xFF2F4858),
                                fontSize: 13,
                                fontFamily: "segoesemibold",
                                fontWeight: FontWeight.bold),
                          ), //phone number
                          SizedBox(height: 5),
                          Container(
                            height: 50,
                            padding: EdgeInsets.only(
                              left: 20.0,
                              right: 20.0,
                              top: 0.0,
                              bottom: 0.0,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: _getContainerBackgroundColor(fnPhoneNo),
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              boxShadow: [
                                _getContainerBoxShadow(fnPhoneNo),
                              ],
                            ),
                            child: TextFormField(
                              // controller: userNameEditTextController,
                                focusNode: fnPhoneNo,
                                style: TextStyle(
                                    fontFamily: "segoeregular",
                                    fontSize: 14,
                                    color: Color(0xff191847)
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Enter Phone Number',
                                  border: InputBorder.none,
                                ),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number),
                          ),
                          SizedBox(height: 25),

                          Text(
                            "Alternate Phone Number",
                            style: TextStyle(
                                color: Color(0xFF2F4858),
                                fontSize: 13,
                                fontFamily: "segoesemibold",
                                fontWeight: FontWeight.bold),
                          ), //alternet phone number
                          SizedBox(height: 5),
                          Container(
                            height: 50,
                            padding: EdgeInsets.only(
                              left: 20.0,
                              right: 20.0,
                              top: 0.0,
                              bottom: 0.0,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: _getContainerBackgroundColor(fnAltPhone),
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              boxShadow: [
                                _getContainerBoxShadow(fnAltPhone),
                              ],
                            ),
                            child: TextFormField(
                              // controller: userNameEditTextController,
                                focusNode: fnAltPhone,
                                style: TextStyle(
                                    fontFamily: "segoeregular",
                                    fontSize: 14,
                                    color: Color(0xff191847)
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Enter Alternate Phone Number',
                                  border: InputBorder.none,
                                ),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number),
                          ),
                          SizedBox(height: 25),

                          Text(
                            "Pin Code",
                            style: TextStyle(
                                color: Color(0xFF2F4858),
                                fontSize: 13,
                                fontFamily: "segoesemibold",
                                fontWeight: FontWeight.bold),
                          ), //pin code
                          SizedBox(height: 5),
                          Container(
                            height: 50,
                            padding: EdgeInsets.only(
                              left: 20.0,
                              right: 20.0,
                              top: 0.0,
                              bottom: 0.0,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: _getContainerBackgroundColor(fnPincode),
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              boxShadow: [
                                _getContainerBoxShadow(fnPincode),
                              ],
                            ),
                            child: TextFormField(
                              // controller: userNameEditTextController,
                                focusNode: fnPincode,
                                style: TextStyle(
                                    fontFamily: "segoeregular",
                                    fontSize: 14,
                                    color: Color(0xff191847)
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Enter Area Code',
                                  border: InputBorder.none,
                                ),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.number),
                          ),
                          SizedBox(height: 25),

                          Text(
                            "City",
                            style: TextStyle(
                                color: Color(0xFF2F4858),
                                fontSize: 13,
                                fontFamily: "segoesemibold",
                                fontWeight: FontWeight.bold),
                          ), //city
                          SizedBox(height: 5),
                          Container(
                            height: 50,
                            padding: EdgeInsets.only(
                              left: 20.0,
                              right: 20.0,
                              top: 0.0,
                              bottom: 0.0,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: _getContainerBackgroundColor(fnCity),
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              boxShadow: [
                                _getContainerBoxShadow(fnCity),
                              ],
                            ),
                            child: TextFormField(
                              // controller: userNameEditTextController,
                                focusNode: fnCity,
                                style: TextStyle(
                                    fontFamily: "segoeregular",
                                    fontSize: 14,
                                    color: Color(0xff191847)
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Enter City Name',
                                  border: InputBorder.none,
                                ),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text),
                          ),
                          SizedBox(height: 25),

                          Text(
                            "State",
                            style: TextStyle(
                                color: Color(0xFF2F4858),
                                fontSize: 13,
                                fontFamily: "segoesemibold" ),
                          ), //state
                          SizedBox(height: 5),
                          Container(
                            height: 50,
                            padding: EdgeInsets.only(
                              left: 20.0,
                              right: 0.0,
                              top: 0.0,
                              bottom: 0.0,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: _getContainerBackgroundColor(fnState),
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              boxShadow: [
                                _getContainerBoxShadow(fnState),
                              ],
                            ),
                            child: TextFormField(
                              // controller: userNameEditTextController,
                                focusNode: fnState,
                                style: TextStyle(
                                    fontFamily: "segoeregular",
                                    fontSize: 14,
                                    color: Color(0xff191847)
                                ),
                                decoration: InputDecoration(
                                    hintText: 'Select State',
                                    border: InputBorder.none,
                                    suffixIcon: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: Colors.black,
                                      size: 40,
                                    )),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text),
                          ),
                          SizedBox(height: 25),

                          Text(
                            "House / Office No., Building Name",
                            style: TextStyle(
                                color: Color(0xFF2F4858),
                                fontSize: 13,
                                fontFamily: "segoesemibold" ),
                          ), //add1
                          SizedBox(height: 5),
                          Container(
                            height: 50,
                            padding: EdgeInsets.only(
                              left: 20.0,
                              right: 20.0,
                              top: 0.0,
                              bottom: 0.0,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: _getContainerBackgroundColor(fnAdd1),
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              boxShadow: [
                                _getContainerBoxShadow(fnAdd1),
                              ],
                            ),
                            child: TextFormField(
                              // controller: userNameEditTextController,
                                focusNode: fnAdd1,
                                style: TextStyle(
                                    fontFamily: "segoeregular",
                                    fontSize: 14,
                                    color: Color(0xff191847)
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Enter Address 1',
                                  border: InputBorder.none,
                                ),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text),
                          ),
                          SizedBox(height: 25),

                          Text(
                            "Road Name, Area, Colony",
                            style: TextStyle(
                                color: Color(0xFF2F4858),
                                fontSize: 13,
                                fontFamily: "segoesemibold" ),
                          ), //add2
                          SizedBox(height: 5),
                          Container(
                            height: 50,
                            padding: EdgeInsets.only(
                              left: 20.0,
                              right: 20.0,
                              top: 0.0,
                              bottom: 0.0,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: _getContainerBackgroundColor(fnAdd2),
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              boxShadow: [
                                _getContainerBoxShadow(fnAdd2),
                              ],
                            ),
                            child: TextFormField(
                              // controller: userNameEditTextController,
                                focusNode: fnAdd2,
                                style: TextStyle(
                                    fontFamily: "segoeregular",
                                    fontSize: 14,
                                    color: Color(0xff191847)
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Enter Address 2',
                                  border: InputBorder.none,
                                ),
                                textInputAction: TextInputAction.next,
                                keyboardType: TextInputType.text),
                          ),
                          SizedBox(height: 25),

                          Text(
                            "Landmark",
                            style: TextStyle(
                                color: Color(0xFF2F4858),
                                fontSize: 13,
                                fontFamily: "segoesemibold" ),
                          ), //landmark
                          SizedBox(height: 5),
                          Container(
                            height: 50,
                            padding: EdgeInsets.only(
                              left: 20.0,
                              right: 20.0,
                              top: 0.0,
                              bottom: 0.0,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.rectangle,
                              color: _getContainerBackgroundColor(fnLandmark),
                              borderRadius: BorderRadius.all(Radius.circular(15.0)),
                              boxShadow: [
                                _getContainerBoxShadow(fnLandmark),
                              ],
                            ),
                            child: TextFormField(
                              // controller: userNameEditTextController,
                                focusNode: fnLandmark,
                                style: TextStyle(
                                    fontFamily: "segoeregular",
                                    fontSize: 14,
                                    color: Color(0xff191847)
                                ),
                                decoration: InputDecoration(
                                  hintText: 'Enter Landmark',
                                  border: InputBorder.none,
                                ),
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.text),
                          ),
                          SizedBox(height: 25),

                          Text(
                            "Type of Address",
                            style: TextStyle(
                                color: Color(0xFF2F4858),
                                fontSize: 13,
                                fontFamily: "segoesemibold" ),
                          ), //type of address
                          SizedBox(height: 5),
                          Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                    /*margin: EdgeInsets.all(10.0),*/
                                    height: 45,
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

                                    ),
                                    child: Text(
                                      "Home",
                                      style: TextStyle(
                                        color: colorWhite,
                                        fontSize: 14,
                                        fontFamily: "segoeregular",),
                                    ),
                                  )),
                              SizedBox(width: 10),
                              Expanded(
                                  flex: 2,
                                  child: Container(
                                    /*margin: EdgeInsets.all(10.0),*/
                                    height: 45,
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.only(
                                      left: 20.0,
                                      right: 20.0,
                                      top: 0.0,
                                      bottom: 0.0,
                                    ),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.rectangle,
                                      color: textColorBlue.withOpacity(0.2),
                                      borderRadius: BorderRadius.all(Radius.circular(15.0)),

                                    ),
                                    child: Text(
                                      "Work",
                                      style: TextStyle(
                                        color: Color(0xff191847),
                                        fontSize: 14,
                                        fontFamily: "segoeregular",),
                                    ),
                                  )),
                              Expanded(flex: 3, child: Container())
                            ],
                          ),

                          SizedBox(height: 25),

                        ],
                      ),
                    ),
            GestureDetector(
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
                  "Save Address",
                  style: TextStyle(
                    color: colorWhite,
                    fontSize: 18,
                    fontFamily: "segoesemibold", ),
                ),
              ))

                  ],
                ),
              )),

        ],
          )
        ),
      ),
    );
  }

  Color _getContainerBackgroundColor(FocusNode node) {
    return node.hasFocus ? Colors.white : textColorBlue.withOpacity(0.2);
  }

  BoxShadow _getContainerBoxShadow(FocusNode node) {
    return node.hasFocus
        ? BoxShadow(
            color: Colors.black26,
            offset: Offset(0.0, 0.0), //(x,y)
            blurRadius: 14.0,
          )
        : BoxShadow(
            color: Colors.transparent,
            offset: Offset(0.0, 0.0), //(x,y)
            blurRadius: 0.0,
          );
  }
}
