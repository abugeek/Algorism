import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '/screens/home.dart';
import '/ui/parentcard.dart';

class NavigationDrawerWidget extends StatelessWidget {
  const NavigationDrawerWidget({Key? key}) : super(key: key);
  final padding = const EdgeInsets.symmetric(horizontal: 20);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFFFCA91E),
                Color(0xFFFBC02D),
                Color(0xFFFFC228),
              ],
            ),
          ),
          child: ListView(
            padding: padding,
            children: [
              SizedBox(height: 48.h),
              builMenuItem(
                text: 'GRAPH',
                icon: FontAwesomeIcons.circleNodes,
                onClick: () => selectedItem(context, 0),
              ),
              SizedBox(height: 48.h),
              builMenuItem(
                text: 'SEARCH',
                icon: FontAwesomeIcons.search,
                onClick: () => selectedItem(context, 0),
              ),
              SizedBox(height: 48.h),
              builMenuItem(
                text: 'SORT',
                icon: FontAwesomeIcons.sortAlphaAsc,
                onClick: () => selectedItem(context, 0),
              ),
              SizedBox(height: 48.h),
              builMenuItem(
                text: 'MATHS',
                icon: FontAwesomeIcons.plusMinus,
                onClick: () => selectedItem(context, 0),
              ),
              SizedBox(height: 48.h),
              builMenuItem(
                text: 'DATA STRUCTURES',
                icon: FontAwesomeIcons.database,
                onClick: () => selectedItem(context, 0),
              ),
              SizedBox(height: 48.h),
              builMenuItem(
                text: 'GREEDY',
                icon: FontAwesomeIcons.squareShareNodes,
                onClick: () => selectedItem(context, 0),
              ),
              SizedBox(height: 24.h),
              const Divider(
                color: Colors.black,
              ),
              SizedBox(height: 24.h),
            ],
          ),
        ),
      ),
    );
  }
}

Widget builMenuItem({
  required String text,
  required IconData icon,
  VoidCallback? onClick,
}) {
  final color = Colors.black;

  return ListTile(
    leading: Icon(
      icon,
      color: color,
    ),
    title: Text(
      text,
      style: TextStyle(
        color: color,
      ),
    ),
    onTap: onClick,
  );
}

void selectedItem(BuildContext context, int index) {
  switch (index) {
    case 0:
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => MyApp(),
        ),
      );
  }
}
