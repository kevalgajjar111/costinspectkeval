import 'dart:async';

import 'package:costinspect/model/FiltertitleModel.dart';
import 'package:costinspect/model/ProductModel.dart';
import 'package:costinspect/utils/constant.dart';
import 'package:costinspect/widgets/star_display_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:shimmer/shimmer.dart';

import 'SignupScreen.dart';

class SearchProductScreen extends StatefulWidget {
  @override
  _SearchProductScreenState createState() => _SearchProductScreenState();
}

class _SearchProductScreenState extends State<SearchProductScreen> {
  List<FiltertitleModel> filterNameList = [
    new FiltertitleModel(
      title: 'Mobiles',
      position: '1',
      selected: true,
    ),
    new FiltertitleModel(
      title: 'Headphones',
      position: '2',
      selected: false,
    ),
    new FiltertitleModel(
      title: 'Speakers',
      position: '3',
      selected: false,
    ),
    new FiltertitleModel(
      title: 'LED TV',
      position: '4',
      selected: false,
    ),
    new FiltertitleModel(
      title: 'Accesories',
      position: '5',
      selected: false,
    ),
    new FiltertitleModel(
      title: 'Sneakers',
      position: '6',
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

      body: Container(
        color: Color(0xFFF6F6F6),
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            Container(
              height: 90,
             /* margin: EdgeInsets.only(
                left: 15.0,
                right: 15.0,
                top: 15.0,
                bottom: 0.0,
              ),*/
              padding: EdgeInsets.only(
                left: 5.0,
                right: 20.0,
                top: 0.0,
                bottom: 0.0,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
               // borderRadius: BorderRadius.all(Radius.circular(20.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0.0, 0.0), //(x,y)
                    blurRadius: 6.0,
                  )
                ],
              ),
              alignment: Alignment.bottomLeft,
              child: Row(
                children: [
                  Expanded(
                      flex: 3,
                      child: TextFormField(

                          decoration: InputDecoration(
                            hintText: 'Search....',
                            prefixIcon: Icon(
                              Icons.search,
                              size: 30,
                              color: Colors.black,
                            ),
                            border: InputBorder.none,
                            hintStyle: TextStyle(
                              color: Color(0xFFAAAAAA),
                              fontSize: 15,
                              fontFamily: "segoe",
                            ),
                          ),
                          textInputAction: TextInputAction.done,
                          keyboardType: TextInputType.text),),
                  Expanded(
                      flex: 1,
                      child: Image.asset(
                        "assets/images/filter_icon.png",
                        height: 25,
                        alignment: Alignment.centerRight,
                      ),),


                ],
              ),
            ),
            SizedBox(height: 15,),
            Container(
height: 150,
              width: size.width,
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(
                left: 5.0,
                right: 20.0,
                top: 0.0,
                bottom: 0.0,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                color: Colors.white,
                // borderRadius: BorderRadius.all(Radius.circular(20.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    offset: Offset(0.0, 0.0), //(x,y)
                    blurRadius: 6.0,
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:10.0,top:10.0),
                    child: Text(
                      "Discover To",
                      style: TextStyle(
                          color: Color(0xff090909),
                          fontSize: 15,
                          fontFamily: "segoesemibold",),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:10.0,right:10.0),
                    child: Wrap(
                      children: [
                        MyChip('Mobiles'),
                        MyChip('Headphones'),
                        MyChip('Speakers'),
                        MyChip('LED TV'),
                        MyChip('Accesories'),
                        MyChip('Sneakers'),
                      ],
                    ),
                  ),

                ],
              ),
            )
          ],
        ),

      ),
    );
  }

  Widget MyChip(String category) {
    return Flexible(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Color(0xff4B9AF1)),
          borderRadius: BorderRadius.all(
              Radius.circular(8.0) //                 <--- border radius here
          ),

        ),

        margin: EdgeInsets.only(top: 12.0, right: 8.0),
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0,right: 8, top: 5.0, bottom: 5.0),
          child: Text(category,
            style: TextStyle(
                color: Color(0xff090909),
                fontSize: 14,
              fontFamily: "segoesemibold"

            ),
          ),
        ),
      ),
    );
  }
}


class FilterItem extends StatefulWidget {
  const FilterItem({
    Key key,
    @required this.title,
  }) : super(key: key);

  final String title;

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
      child: Container(
        /* color: Color(0xff122D4B),*/
        decoration: BoxDecoration(
          border: Border.all(color: textColorBlue),
          borderRadius: BorderRadius.all(
              Radius.circular(10.0) //                 <--- border radius here
          ),

        ),
        alignment: Alignment.center,
        margin: EdgeInsets.only(top: 0.0, bottom: 0.0),
        padding: EdgeInsets.only(left: 10.0, top: 0.0, bottom: 0.0),
        child: Text(widget.title,
          style: TextStyle(
              color: Color(0xff090909),
              fontWeight: FontWeight.bold,
              fontSize: 14),
        ),
      ),
    );
  }
}
