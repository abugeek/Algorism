import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/desc/desc.dart';
import '/screens/code.dart';

class Description extends StatelessWidget {
  const Description({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final CodeBD widget;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(24), topRight: Radius.circular(24)),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 40.h,
            left: 35.w,
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: LinearGradient(
                  transform: const GradientRotation(pi / 2),
                  colors: [
                    const Color.fromARGB(255, 2234, 205, 163).withOpacity(0.9),
                    const Color.fromARGB(255, 214, 174, 123).withOpacity(0.9),
                  ],
                  begin: Alignment.bottomRight,
                  end: Alignment.topCenter,
                ),
              ),
              child: SizedBox(
                height: 1150.h,
                width: 650.w,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Scrollbar(
                    child: SingleChildScrollView(
                      child: Text(Desc.code[widget.title],
                          style: GoogleFonts.roboto(fontSize: 18)),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: 35.h,
            child: SizedBox(
              height: 1230.h,
              width: 720.w,
              child: Align(
                alignment: Alignment.topCenter,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      child: Text(
                        "Description",
                        style: GoogleFonts.bebasNeue(
                            fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
