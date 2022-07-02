import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/screens/home.dart';
import '/palette.dart';

void main() {
  runApp(Home());
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(720, 1440),
        builder: (BuildContext context, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Palette.kToDark,
            ),
            //color: Color(0xFFFDF2EC),
            color: Colors.grey,
            home: MyApp()));
  }
}
