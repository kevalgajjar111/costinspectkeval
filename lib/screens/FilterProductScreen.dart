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

class FilterProductScreen extends StatefulWidget {
  @override
  _FilterProductScreenState createState() => _FilterProductScreenState();
}

class _FilterProductScreenState extends State<FilterProductScreen> {
  List<FiltertitleModel> filterNameList = [
    new FiltertitleModel(
      title: 'Price',
      position: '1',
      selected: true,
    ),
    new FiltertitleModel(
      title: 'Brands',
      position: '2',
      selected: false,
    ),
    new FiltertitleModel(
      title: 'Size',
      position: '3',
      selected: false,
    ),
    new FiltertitleModel(
      title: 'Color',
      position: '4',
      selected: false,
    ),
    new FiltertitleModel(
      title: 'Discount',
      position: '5',
      selected: false,
    ),
    new FiltertitleModel(
      title: 'Available',
      position: '6',
      selected: false,
    ),
    new FiltertitleModel(
      title: 'Style',
      position: '7',
      selected: false,
    ),
  ];List<FiltertitleModel> PriceList = [
    new FiltertitleModel(
      title: '150.00',
      position: '250.00',
      selected: true,
    ),
    new FiltertitleModel(
      title: '250.00',
      position: '350.00',
      selected: false,
    ),
    new FiltertitleModel(
      title: '350.00',
      position: '450.00',
      selected: false,
    ),
    new FiltertitleModel(
      title: '450.00',
      position: '550.00',
      selected: false,
    ),
    new FiltertitleModel(
      title: '550.00',
      position: '650.00',
      selected: false,
    ),
  ];

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
          "SEARCH BY FILTERS",
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
        actions: [
          GestureDetector(
              onTap: () {
                /*   Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return ProfileScreen();
                }));*/
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Center(
                  child: Text(
                    "Clear All",
                    style: TextStyle(color: Colors.white, fontSize: 12),
                  ),
                ),
              )),
        ],
      ),
      body: Container(
        //color: Colors.green,
        width: size.width,
        height: size.height,
        child: Row(
          children: [
            Expanded(
                flex: 2,
                child: Container(
                  alignment: Alignment.topLeft,
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    itemCount: filterNameList.length,
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      Container contianer;
                      if (filterNameList[index].selected) {
                        contianer = Container(
                          width: size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: size.width,
                                color: Color(0xff122D4B),
                                margin: EdgeInsets.only(top: 0.0, bottom: 0.0),
                                padding: EdgeInsets.only(
                                    left: 15.0, top: 15.0, bottom: 15.0),
                                child: Text(
                                  filterNameList[index].title,
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                              Container(
                                height: 1,
                                color: Color(0xffefefef),
                              )
                            ],
                          ),
                        );
                      } else {
                        contianer = Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                /* color: Color(0xff122D4B),*/
                                margin: EdgeInsets.only(top: 1.0, bottom: 0.0),
                                padding: EdgeInsets.only(
                                    left: 15.0, top: 15.0, bottom: 15.0),
                                child: Text(
                                  filterNameList[index].title,
                                  style: TextStyle(
                                      color: Color(0xff090909),
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
                                ),
                              ),
                              Container(
                                height: 1,
                                color: Color(0xffefefef),
                              )
                            ],
                          ),
                        );
                      }

                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            for (var i = 0; i < filterNameList.length; i++) {
                              if (i == index) {
                                filterNameList[i].selected = true;
                              } else {
                                filterNameList[i].selected = false;
                              }
                            }
                            print(
                                "OnClick :  ${filterNameList[index].selected}");
                          });
                        },
                        child: contianer,
                      );
                    },
                  ),
                )),
            Expanded(flex: 3,
                child: Container(
                  color: Color(0xFFF6F6F6),
                  alignment: Alignment.topLeft,
                child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: PriceList.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return FilterItem(
                        title: PriceList[index].title,
                        title2: PriceList[index].position,
                      selected: PriceList[index].selected,
                    );
                  },
                ),


                )),
          ],
        ),
      ),
    );
  }
}

class FilterItem extends StatefulWidget {
  const FilterItem({
    Key key,
    @required this.title,
    @required this.title2,
    @required this.selected,
  }) : super(key: key);

  final String title;
  final String title2;
  final bool selected;

  @override
  _FilterItemState createState() => _FilterItemState();
}


class _FilterItemState extends State<FilterItem> {
  bool _value = false;
  @override
  Widget build(BuildContext context) {

    return InkWell(
      onTap: () {

        setState(() {
          print("on click");
          _value = !_value;

        });
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
           /* decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.blue),*/
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: _value
                  ? Image.asset(
                "assets/images/checkbox_selected.png",
                height: 20,
                alignment: Alignment.center,
              )
                  : Image.asset(
                "assets/images/checkbox_unselected.png",
                height: 20,
                alignment: Alignment.center,
              ),
            ),
          ),
          Container(
            /* color: Color(0xff122D4B),*/
            margin: EdgeInsets.only(top: 1.0, bottom: 0.0),
            padding: EdgeInsets.only(left: 10.0, top: 10.0, bottom: 15.0),
            child: Text(
              "" + r'$ ' +widget.title+" to "+r'$ '+widget.title2,
              style: TextStyle(
                  color: Color(0xff090909),
                  fontFamily: "segoesemibold",
                  fontSize: 14),
            ),
          ),

        ],
      ),
    );
  }
}
