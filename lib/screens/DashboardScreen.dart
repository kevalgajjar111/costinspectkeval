import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:costinspect/model/ProductModel.dart';
import 'package:costinspect/model/dashboard_banner_model.dart';
import 'package:costinspect/model/dashboard_response_model.dart';
import 'package:costinspect/screens/AddDeliveryAddressScreen.dart';
import 'package:costinspect/screens/MenuScreen.dart';
import 'package:costinspect/utils/constant.dart';
import 'package:costinspect/widgets/star_display_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:toast/toast.dart';

import 'ProductListScreen.dart';
import 'package:http/http.dart' as http;

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int currentPos = 0;
  List<String> listPaths = [
    'https://i.pinimg.com/736x/03/46/3b/03463b27733852b0bde82f705caa0de2.jpg',
    'https://i.pinimg.com/736x/03/46/3b/03463b27733852b0bde82f705caa0de2.jpg',
  ];
  bool isLoading = false;

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

  List<Banners> bannerList =  new List<Banners>();
  List<Categories> categoryList =  new List<Categories>();
  List<Other_products> OtherProductList =  new List<Other_products>();

  @override
  void initState() {
    super.initState();
    isLoading =true;
    print("11");

    setState(() {
      getDashboardRequest();
    });

  }

  @override
  Widget build(BuildContext context) {
     SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
     print("22");
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        toolbarHeight: 70.0,
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: textColorBlue,
        title: Text(
          "COST INSPECT",
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        leading: Row(
          children: [
            IconButton(
              icon: Image.asset(
                "assets/images/menu_icon.png",
                color: Colors.white,
                height: 20,
                width: 20,
              ),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return MenuScreen();
                }));
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
                  "assets/images/user.png",
                  height: 25,
                  width: 25,
                ),
              )),
        ],
      ),
      body: isLoading
        ? Center(
        child: CircularProgressIndicator(),
      )
          : ModalProgressHUD(
        inAsyncCall: isLoading,
        child: Container(
          color: Colors.white,
          width: double.infinity,
          height: double.infinity,
          child: SingleChildScrollView(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 50,
                      margin: EdgeInsets.only(
                        left: 15.0,
                        right: 15.0,
                        top: 15.0,
                        bottom: 0.0,
                      ),
                      padding: EdgeInsets.only(
                        left: 0.0,
                        right: 20.0,
                        top: 0.0,
                        bottom: 0.0,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(20.0)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            offset: Offset(0.0, 0.0), //(x,y)
                            blurRadius: 6.0,
                          )
                        ],
                      ),
                      child: TextFormField(
                          decoration: InputDecoration(
                            hintText: 'I want to buy.....',
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
                          keyboardType: TextInputType.text),
                    ),
                    CarouselSlider.builder(
                      itemCount: bannerList.length,
                      options: CarouselOptions(
                          height: 230,
                          autoPlay: true,
                          viewportFraction: 1.0,
                          aspectRatio: 2.0,
                          onPageChanged: (index, reason) {
                            setState(() {
                              currentPos = index;
                            });
                          }),
                      itemBuilder: (context, index) {
                        return BannerImage(bannerList[index].categoryImage);
                      },
                    ),
                    Container(
                      height: 0,
                      child: Stack(
                        overflow: Overflow.visible,
                        alignment: AlignmentDirectional.center,
                        children: <Widget>[
                          Positioned(
                            top: -50,
                            child: Column(
                              children: [
                                Row(
                                  children: bannerList.map((url) {
                                    int index = bannerList.indexOf(url);
                                    return Container(
                                      width: 8.0,
                                      height: 8.0,
                                      margin: EdgeInsets.symmetric(
                                          vertical: 10.0, horizontal: 2.0),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: currentPos == index
                                            ? textColorBlue
                                            : Colors.black12,
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0, bottom: 15.0),
                      child: Text(
                        "Affiliate Websites",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                            fontFamily: "segoe",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, bottom: 10.0),
                      child: Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: Image.asset(
                                "assets/images/amazon_icon.png",
                                height: 50,
                                alignment: Alignment.centerRight,
                              )),
                          SizedBox(width: 15),
                          Expanded(
                              flex: 1,
                              child: Image.asset(
                                "assets/images/walmart_icon.png",
                                height: 50,
                                alignment: Alignment.centerLeft,
                              )),
                          SizedBox(width: 15),
                          Expanded(
                              flex: 1,
                              child: Image.asset(
                                "assets/images/ebay_icon.png",
                                height: 50,
                                alignment: Alignment.centerLeft,
                              )),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 15.0, right: 15.0, bottom: 15.0),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(),
                          ),
                          SizedBox(width: 10),
                          Expanded(
                              flex: 2,
                              child: Image.asset(
                                "assets/images/aliexpress_icon.png",
                                height: 50,
                                alignment: Alignment.centerRight,
                              )),
                          SizedBox(width: 15),
                          Expanded(
                              flex: 2,
                              child: Image.asset(
                                "assets/images/bestbuy_icon.png",
                                height: 50,
                                alignment: Alignment.centerLeft,
                              )),
                          SizedBox(width: 10),
                          Expanded(
                            flex: 1,
                            child: Container(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(
                        left: 15.0,
                        right: 15.0,
                        top: 25.0,
                        bottom: 15.0,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: Color(0xFFF6F6F6),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                      ),
                      child: Column(
                        children: [
                          Container(
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: categoryList.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return categoryItem(
                                    categories: categoryList[index],
                                    index: index,
                                );
                              },
                            ),
                          ),

                          Container(
                            child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              itemCount: OtherProductList.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return OtherProductItem(
                                  otherProduct: OtherProductList[index],
                                  index: index,
                                );
                              },
                            ),
                          ),





                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ),
      ),
    );
  }

  Future<http.Response> getDashboardRequest () async {

    final uri = Uri.parse(Constant.base_url+'/categories/get_home_page');

    await  http.get(uri,
      /* headers: {"Content-Type": "application/json"},*/
    ).then((http.Response response) {
      final jsonData = json.decode(response.body);
      print(jsonData);
      setState(() {
        isLoading = false;
      });
      if(response.statusCode==200){
        var map = Map<String, dynamic>.from(jsonData);
         var modelData = DashboardResponseModel.fromJson(map);
         Data data = modelData.data;
        // List<Banners> banners = data.banners;
        //  print(user.data.email);
        bannerList = modelData.data.banners;
        categoryList = modelData.data.categories;
        OtherProductList = modelData.data.otherProducts;
        print("other product size:  "+OtherProductList.length.toString());
        // Toast.show(jsonData['message'], context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);

      }
      else{
        print(jsonData['message'] as String);
        Toast.show(jsonData['message'], context, duration: Toast.LENGTH_LONG, gravity:  Toast.BOTTOM);

      }
    }
    );
  }
}

class BannerImage extends StatelessWidget {
  String imgPath;

  BannerImage(this.imgPath);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.only(
        left: 15.0,
        right: 15.0,
        top: 15.0,
        bottom: 15.0,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        boxShadow: [
          BoxShadow(
            color: textColorBlue.withOpacity(0.5),
            offset: Offset(0.0, 0.0), //(x,y)
            blurRadius: 2.0,
          ),
        ],
        image: DecorationImage(
          image: NetworkImage(imgPath),
          fit: BoxFit.fill,
        ),
      ),

    );
  }
}

class CategoryProductItem extends StatelessWidget {
  const CategoryProductItem({
    Key key,
    @required this.categoryProduct,
    @required this.index,
  }) : super(key: key);

  final Products1 categoryProduct;
  final int index;

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
                                    categoryProduct.ratings,
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
                            left: 8.0, right: 8.0, bottom: 0.0),
                        child: Image.network(
                          categoryProduct.productImage,
                          height: 70,
                          width: double.infinity,

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
                          child: Text(categoryProduct.productName,
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
                          child: Text(categoryProduct.productDescription,
                              style: TextStyle(
                                  color: Color(0XFFAAAAAA), fontSize: 9)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, bottom: 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(categoryProduct.productPrice,
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

class LookingItem extends StatelessWidget {
  const LookingItem({
    Key key,
    @required this.otherProducts,
    @required this.index,
  }) : super(key: key);

  final Products otherProducts;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {},
      child: Container(
        margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(width: 5,),
                Container(
                  height: 100,
                  width: 110,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.rectangle,
                    color: Colors.white,
                    /* borderRadius: BorderRadius.all(Radius.circular(20.0)),*/
                    boxShadow: [
                      BoxShadow(
                        color: textColorBlue.withOpacity(0.5),
                        offset: Offset(0.0, 0.0), //(x,y)
                        blurRadius: 4.0,
                      ),
                    ],
                  ),
                  child: Image.network(otherProducts.productImage),
                ),
                SizedBox(width: 30,),
                Expanded(
                  flex: 2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 0.0, right: 8.0, bottom: 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(otherProducts.name,
                              style: TextStyle(
                                  color: Color(0XFF090909),
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 0.0, right: 8.0, bottom: 8.0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(otherProducts.price,
                              style: TextStyle(
                                  color: Color(0XFFFF5B5B),
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),

            Container(
              height: 1,
              color: Color(0xffcdcdcd),
            ),
          ],
        ),
      ),
    );
  }
}

class categoryItem extends StatelessWidget {
  const categoryItem({
    Key key,
    @required this.categories,
    @required this.index,
  }) : super(key: key);

  final Categories categories;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {},
      child: Container(
        margin: EdgeInsets.only(top: 0.0, bottom: 0.0),
        child: Column(
          children: [
            Container(
              alignment: Alignment.center,
              height: 180,
              padding: EdgeInsets.only(
                  left: 15.0, right: 15.0, top: 15.0, bottom: 0.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.grey, width: 0.5),
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(
                          MaterialPageRoute(builder: (context) {
                            return ProductListScreen();
                          }));
                    },
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Text(
                            categories.name.toUpperCase(),

                            style: TextStyle(
                                color: textColorBlue,
                                fontSize: 14,
                                fontFamily: "segoe",
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        Expanded(
                            flex: 1,
                            child: Image.asset(
                              "assets/images/arrow_right_circle.png",
                              height: 30,
                              alignment: Alignment.centerRight,
                            ))
                      ],
                    ),),

                  SizedBox(
                    height: 20,
                  ),
                  Image.network(categories.categoryImage,
                    height: 100,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    alignment: Alignment.centerRight,
                  )
                ],
              ),
            ), //our latest collection
            Container(
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 0.0, right: 0.0, top: 15.0, bottom: 15.0),
                child: GridView.builder(
                  itemCount: categories.products.length,
                  itemBuilder: (context, index) {
                    return CategoryProductItem(
                      categoryProduct: categories.products[index],
                      index: index,
                    );
                  },
                  gridDelegate:
                  SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.61,
                    /*childAspectRatio: 0.99,*/
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 2,
                  ),
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
class OtherProductItem extends StatelessWidget {
  const OtherProductItem({
    Key key,
    @required this.otherProduct,
    @required this.index,
  }) : super(key: key);

  final Other_products otherProduct;
  final int index;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () async {},
      child: Container(
        margin: EdgeInsets.only(top: 0.0, bottom: 0.0),
        child: Column(
          children: [
            Container(
              height: 2,
              width: double.infinity,
              color: Color(0xffcdcdcd),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: Text(
                    otherProduct.name,
                    style: TextStyle(
                        color: Color(0xff090909),
                        fontSize: 18,
                        fontFamily: "segoe",
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ProductListScreen()));
                    },
                    child: Container(
                      /*margin: EdgeInsets.all(10.0),*/
                      height: 30,
                      alignment: Alignment.center,
                      padding: EdgeInsets.only(
                        left: 10.0,
                        right: 10.0,
                        top: 0.0,
                        bottom: 0.0,
                      ),
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        color: textColorBlue,
                        borderRadius:
                        BorderRadius.all(Radius.circular(20.0)),
                      ),
                      child: Text(
                        "View All",
                        style: TextStyle(
                            color: colorWhite,
                            fontSize: 13,
                            fontFamily: "segoe",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                )
              ],
            ), //suggections for you
            SizedBox(
              height: 20,
            ),
            Container(
              height: 400.0,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: otherProduct.products.length,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return LookingItem(
                    otherProducts: otherProduct.products[index],
                    index: index,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
