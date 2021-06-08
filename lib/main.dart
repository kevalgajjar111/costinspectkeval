import 'package:costinspect/screens/DashboardScreen.dart';
import 'package:costinspect/screens/SigninScreen.dart';
import 'package:costinspect/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
 //await Firebase.initializeApp();
  Constant.prefs  = await SharedPreferences.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return /*MaterialApp(
      //title: 'Flutter Demo',
      theme: ThemeData(fontFamily: 'poppins'),

      home:  SigninScreen(),
        // Constant.prefs.getBool("loggedIn")==true?DashboardScreen():LoginScreen(),

       // LoginScreen(),
    );*/
 AnnotatedRegion(
        value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    child: MaterialApp(
      //title: 'Flutter Demo',


      home:  Constant.prefs.getBool("loggedIn")==true?DashboardScreen():SigninScreen(),

    ),);
  }
}