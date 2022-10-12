



import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hexcolor/hexcolor.dart';


import 'layout/home_layot.dart';





void main() {

  runApp(MyApp());
}
class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // theme: ThemeData(
      //   floatingActionButtonTheme: FloatingActionButtonThemeData(
      //       backgroundColor: Colors.deepOrange
      //   ),
      //   scaffoldBackgroundColor: Colors.white,
      //   appBarTheme: AppBarTheme(
      //       backgroundColor: Colors.white,
      //       elevation: 0,
      //       backwardsCompatibility: false,
      //       systemOverlayStyle: SystemUiOverlayStyle(
      //         statusBarColor: Colors.white,
      //         statusBarIconBrightness: Brightness.dark,
      //       ),
      //       titleTextStyle: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),
      //       iconTheme: IconThemeData(
      //           color: Colors.black
      //       )
      //   ),
      //   bottomNavigationBarTheme: BottomNavigationBarThemeData(
      //       type: BottomNavigationBarType.fixed,
      //       selectedItemColor: Colors.deepOrange,
      //       elevation: 20
      //   ),
      //   textTheme: TextTheme(
      //       bodyText1: TextStyle(
      //           fontSize: 18,
      //           fontWeight: FontWeight.w600,
      //           color: Colors.black
      //       )
      //   ),
      // ),
      // darkTheme: ThemeData(
      //   floatingActionButtonTheme: FloatingActionButtonThemeData(
      //       backgroundColor: Colors.deepOrange
      //   ),
      //   scaffoldBackgroundColor: HexColor("333739"),
      //   appBarTheme: AppBarTheme(
      //       backgroundColor: HexColor("333739"),
      //       elevation: 0,
      //       backwardsCompatibility: false,
      //       systemOverlayStyle: SystemUiOverlayStyle(
      //         statusBarColor:HexColor("333739"),
      //         statusBarIconBrightness: Brightness.light,
      //       ),
      //       titleTextStyle: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.bold),
      //       iconTheme: IconThemeData(
      //           color: Colors.white
      //       )
      //   ),
      //   bottomNavigationBarTheme: BottomNavigationBarThemeData(
      //     type: BottomNavigationBarType.fixed,
      //     selectedItemColor: Colors.deepOrange,
      //     unselectedItemColor: Colors.grey,
      //     elevation: 20,
      //     backgroundColor: HexColor("333739"),
      //   ),
      //   textTheme: TextTheme(
      //       bodyText1: TextStyle(
      //           fontSize: 18,
      //           fontWeight: FontWeight.w600,
      //           color: Colors.white
      //       )
      //   ),
      //
      // ),
      themeMode: ThemeMode.dark,

      debugShowCheckedModeBanner: false,
      home:HomeLayout(),
    );
  }
}