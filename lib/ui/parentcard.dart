import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '/ui/childcard.dart';

class ParentCard extends StatefulWidget {
  const ParentCard({
    Key? key,
    required this.database,
    required this.listText,
    required this.numbers,
    required this.index,
    required this.leadingIcons,
    required this.isOpen,
  }) : super(key: key);

  final Map database;
  final List listText;
  final List numbers;
  final int index;
  final List leadingIcons;
  final List isOpen;
  @override
  _ParentCardState createState() => _ParentCardState();
}

class _ParentCardState extends State<ParentCard> {
  void changeIsOpen(int index) {
    setState(() {
      widget.isOpen[index] = widget.isOpen[index] ? false : true;
    });
  }

  @override
  Widget build(BuildContext context) {
    widget.numbers.shuffle();
    return Column(
      children: [
        // Padding(padding: EdgeInsets.only(top: 20)),
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24),
                gradient: LinearGradient(
                  transform: const GradientRotation(pi / 2),
                  colors: [
                    const Color.fromARGB(255, 64, 58, 62).withOpacity(0.9),
                    const Color.fromARGB(255, 190, 88, 105).withOpacity(0.9),
                  ],
                  begin: Alignment.bottomRight,
                  end: Alignment.topCenter,
                ),
              ),
              margin: const EdgeInsets.fromLTRB(19, 10, 19, 6),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 17, horizontal: 14.0),
                    child: Image.asset(
                      widget.leadingIcons[widget.index],
                      height: 98.h,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(8.0, 0, 0, 0),
                    child: Text(
                      widget.listText[widget.index],
                      style: GoogleFonts.poppins(fontSize: 30),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(19, 10, 19, 6),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(24),
                child: MaterialButton(
                  child: SizedBox(height: 161.h, width: 637.w),
                  onPressed: () {
                    HapticFeedback.lightImpact();
                    changeIsOpen(widget.index);
                    // print(isOpen);
                  },
                ),
              ),
            ),
          ],
        ),
        widget.isOpen[widget.index]
            ? ChildCard(
                database: widget.database,
                listText: widget.listText,
                numbers: widget.numbers,
                index: widget.index,
              )
            : Container()
      ],
    );
  }
}
