import 'dart:async';

import 'package:costinspect/model/ProductModel.dart';
import 'package:costinspect/screens/FilterProductScreen.dart';
import 'package:costinspect/utils/constant.dart';
import 'package:costinspect/widgets/star_display_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shimmer/shimmer.dart';

import 'SearchProductScreen.dart';
import 'SignupScreen.dart';

class ProductListScreen extends StatefulWidget {
  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {


  bool isLoading = true;
  @override
  Widget build(BuildContext context) {
    /* SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);*/
    Timer timer = Timer(Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });

    return isLoading ? ShimmerList() : DataList(timer);
  }


}



class DataList extends StatefulWidget {
  final Timer timer;

  DataList(this.timer);

  @override
  _DataListState createState() => _DataListState();
}

class _DataListState extends State<DataList> {

  List<ProductModel> FeaturedItemList = [
    new ProductModel(
        title: 'Take A LOOK',
        des: '',
        name: 'The Dream Bag',
        type: 'BAGS',
        price: ""),
    new ProductModel(
        title: 'Take A LOOK',
        des: '',
        name: 'The Dream Bag',
        type: 'BAGS',
        price: ""),
    new ProductModel(
        title: 'Take A LOOK',
        des: '',
        name: 'The Dream Bag',
        type: 'BAGS',
        price: ""),
    new ProductModel(
        title: 'Take A LOOK',
        des: '',
        name: 'The Dream Bag',
        type: 'BAGS',
        price: ""),
    new ProductModel(
        title: 'Take A LOOK',
        des: '',
        name: 'The Dream Bag',
        type: 'BAGS',
        price: ""),
    new ProductModel(
        title: 'Take A LOOK',
        des: '',
        name: 'The Dream Bag',
        type: 'BAGS',
        price: ""),
  ];

  List<ProductModel> lookingItem = [
    new ProductModel(
        title: 'Take A LOOK',
        des: 'TO OUR AMAZING',
        name: 'The Dream Bag',
        type: 'BAGS',
        price: ""),
    new ProductModel(
        title: 'Take A LOOK',
        des: 'TO OUR AMAZING',
        name: 'The Dream Bag',
        type: 'BAGS',
        price: ""),
    new ProductModel(
        title: 'Take A LOOK',
        des: 'TO OUR AMAZING',
        name: 'The Dream Bag',
        type: 'BAGS',
        price: ""),
  ];

  @override
  Widget build(BuildContext context) {
    widget.timer.cancel();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.0,
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: textColorBlue,
        title: Text(
          "BEST SELLERS",
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
                   Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return SearchProductScreen();
                }));
              },
              child: Padding(
                padding: const EdgeInsets.only(right: 20.0),
                child: Image.asset(
                  "assets/images/search_icon.png",
                  height: 20,
                  width: 20,
                ),
              )),
        ],
      ),
      body: Container(
        //color: Colors.green,
        width: size.width,
        height: size.height,
        child: Container(
          child: Column(
            children: [
              Expanded(
                flex:10,
                child:   Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 5.0, right: 5.0, top: 10.0, bottom: 0.0),
                  child: GridView.builder(
                    itemCount: FeaturedItemList.length,
                    itemBuilder: (context, index) {
                      return FeaturedItem(
                        title: FeaturedItemList[index].title,
                        name: FeaturedItemList[index].name,
                        des: FeaturedItemList[index].des,
                        type: FeaturedItemList[index].type,
                        price: FeaturedItemList[index].price,
                      );
                    },
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.65,
                      /*childAspectRatio: 0.99,*/
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                    ),


                  ),
                ),
              ),),
              Expanded(flex:1,
                  child: Container(

                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(1.0, 0.0), //(x,y)
                          blurRadius: 8.0,
                        )
                      ],
                    ),
                    child: Row(
                      children: [

                    Expanded(
                        flex: 1,
                        child:GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .push(MaterialPageRoute(builder: (context) {
                                return FilterProductScreen();
                              }));
                            },
                            child:Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/sortby_icon.png",
                                  height: 18,
                                  alignment: Alignment.centerLeft,
                                ),
                                SizedBox(width: 10,),
                                Text(
                                  "Sort By",
                                  style: TextStyle(
                                      color: Color(0xff090909),
                                      fontSize: 15,
                                      fontFamily: "segoe",
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ))
                    ),

                        Container(
                          width: 1,
                          color: Color(0xffefefef),
                        ),
                        Expanded(
                            flex: 1,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/filter_icon.png",
                                  height: 18,
                                  alignment: Alignment.centerLeft,
                                ),
                                SizedBox(width: 10,),
                                Text(
                                  "Filters",
                                  style: TextStyle(
                                      color: Color(0xff090909),
                                      fontSize: 15,
                                      fontFamily: "segoe",
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )),
                        Container(
                          width: 1,
                          color: Color(0xffefefef),
                        ),
                        Expanded(
                            flex: 1,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/view_icon.png",
                                  height: 18,
                                  alignment: Alignment.centerLeft,
                                ),
                                SizedBox(width: 10,),
                                Text(
                                  "View",
                                  style: TextStyle(
                                      color: Color(0xff090909),
                                      fontSize: 15,
                                      fontFamily: "segoe",
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )),
                      ],
                    ),

                  )),

            ],
          ),
        ),
      ),
    );
  }
}




class FeaturedItem extends StatelessWidget {
  const FeaturedItem({
    Key key,
    @required this.title,
    @required this.name,
    @required this.des,
    @required this.type,
    @required this.price,
  }) : super(key: key);

  final String title;
  final String name;
  final String des;
  final String type;
  final String price;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {
        /* Navigator.of(context).push(MaterialPageRoute(builder: (context)
        {
          return ProductDetailScreen();
        }));*/
      },
      child: Container(
        color: Colors.white,
        margin: EdgeInsets.all(8),
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0.0, 1.0), //(x,y)
                blurRadius: 4.0,
              )
            ],
          ),
          child: ClipRRect(
            child: GridTile(
              child: GestureDetector(
                onTap: () {
                  /*   Navigator.of(context).push(MaterialPageRoute(builder: (context)
                  {
                    return ProductDetailScreen();
                  }));*/
                },
                child: Container(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Row(
                                children: [
                                  StarDisplayWidget(
                                    value: 1,
                                    filledStar: Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 18,
                                    ),
                                    unfilledStar: Icon(
                                      Icons.star,
                                      color: Color(0xffeaeaea),
                                      size: 22,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  Text(
                                    "4.5",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 12,
                                        fontFamily: "segoe",
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            Expanded(
                              flex: 1,
                              child: IconButton(
                                color: Color(0xFFFF5B5B),
                                icon: Icon(Icons.favorite_border_sharp),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, bottom: 8.0),
                        child: Image.asset(
                          "assets/images/shoes_image.png",
                          height: 60,
                          alignment: Alignment.centerLeft,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          padding: const EdgeInsets.only(top: 3.0, right: 0.0),
                          child: Divider(
                            color: Color(0xfff6f3f9),
                            height: 1,
                          )),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, bottom: 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Colorblock Sneakers",
                              style: TextStyle(
                                  color: Color(0XFF090909),
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, bottom: 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("Sketchers",
                              style: TextStyle(
                                  color: Color(0XFFAAAAAA), fontSize: 9)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, bottom: 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text("" + r'$' + " 150.00",
                              style: TextStyle(
                                  color: Color(0XFFFF5B5B),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          /* Navigator.push(context, MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  DashboardScreen()));*/
                        },
                        child: Container(
                          /*margin: EdgeInsets.all(10.0),*/
                          height: 30,
                          alignment: Alignment.center,
                          margin: EdgeInsets.only(
                            left: 10.0,
                            right: 10.0,
                            top: 0.0,
                            bottom: 0.0,
                          ),
                          decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            color: textColorBlue,
                          ),
                          child: Text(
                            "View in Store",
                            style: TextStyle(
                                color: colorWhite,
                                fontSize: 13,
                                fontFamily: "segoe",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ShimmerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    int offset = 0;
    int time = 800;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70.0,
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: textColorBlue,
        title: Text(
          "BEST SELLERS",
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
                child: Image.asset(
                  "assets/images/search_icon.png",
                  height: 20,
                  width: 20,
                ),
              )),
        ],
      ),
      body: Container(
        //color: Colors.green,
        width: size.width,
        height: size.height,
        child: Container(
          child: Column(
            children: [
              Expanded(flex:10,child:   Container(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 5.0, right: 5.0, top: 10.0, bottom: 0.0),
                  child: GridView.builder(
                    itemCount: 6,
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 0.65,
                      /*childAspectRatio: 0.99,*/
                      crossAxisSpacing: 2,
                      mainAxisSpacing: 2,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      offset += 5;
                      time = 800 + offset;

                      print(time);

                      return Padding(
                          padding: EdgeInsets.all(8),
                          child: Shimmer.fromColors(
                            highlightColor: Colors.white,
                            baseColor: Colors.grey[300],
                            child: ShimmerLayout(),
                            period: Duration(milliseconds: time),
                          ));
                    },
                  )

                ),
              ),),
              Expanded(flex:1,
                  child: Container(

                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(1.0, 0.0), //(x,y)
                          blurRadius: 8.0,
                        )
                      ],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/sortby_icon.png",
                                  height: 18,
                                  alignment: Alignment.centerLeft,
                                ),
                                SizedBox(width: 10,),
                                Text(
                                  "Sort By",
                                  style: TextStyle(
                                      color: Color(0xff090909),
                                      fontSize: 15,
                                      fontFamily: "segoe",
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )),
                        Container(
                          width: 1,
                          color: Color(0xffefefef),
                        ),
                        Expanded(
                            flex: 1,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/filter_icon.png",
                                  height: 18,
                                  alignment: Alignment.centerLeft,
                                ),
                                SizedBox(width: 10,),
                                Text(
                                  "Filters",
                                  style: TextStyle(
                                      color: Color(0xff090909),
                                      fontSize: 15,
                                      fontFamily: "segoe",
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )),
                        Container(
                          width: 1,
                          color: Color(0xffefefef),
                        ),
                        Expanded(
                            flex: 1,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/view_icon.png",
                                  height: 18,
                                  alignment: Alignment.centerLeft,
                                ),
                                SizedBox(width: 10,),
                                Text(
                                  "View",
                                  style: TextStyle(
                                      color: Color(0xff090909),
                                      fontSize: 15,
                                      fontFamily: "segoe",
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            )),
                      ],
                    ),

                  )),

            ],
          ),
        ),
      ),
    );
  }
}



class ShimmerLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    return  Container(

      decoration: BoxDecoration(
        shape: BoxShape.rectangle,

        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0.0, 1.0), //(x,y)
            blurRadius: 4.0,
          )
        ],
      ),
      child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 8.0),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        Container(
                          height: 20,
                          width: 20,
                          color: Colors.grey,
                        )
                        ,
                        SizedBox(
                          width: 3,
                        ),
                        Container(
                          height: 25,
                          width: 25,
                          color: Colors.grey,
                        )

                      ],
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child:  Container(
                      height: 30,
                      width: 30,
                      color: Colors.grey,
                    )
                    ,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, right: 8.0, bottom: 8.0, top: 8.0),
              child:  Container(
                height: 80,
                width: size.width,
                color: Colors.grey,
              )

            ),

            Container(
                padding: const EdgeInsets.only(top: 3.0, right: 0.0),
                child: Divider(
                  color: Color(0xfff6f3f9),
                  height: 1,
                )),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, right: 8.0, bottom: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 15,
                  width: size.width,
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, right: 8.0, bottom: 2.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 15,
                  width: 100,
                  color: Colors.grey,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 8.0, right: 8.0, bottom: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  height: 15,
                  width: size.width,
                  color: Colors.grey,
                ),
              ),
            ),

            Container(
              /*margin: EdgeInsets.all(10.0),*/
              height: 30,
              width: size.width,
              color: Colors.grey,
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                left: 8.0,
                right: 8.0,
                top: 0.0,
                bottom: 0.0,
              ),


            ),
          ],
        ),
      ),
    );
  }
}
