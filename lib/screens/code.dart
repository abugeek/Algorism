import 'package:flutter/material.dart';
import 'package:backdrop/backdrop.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '/code/cpp.dart';
import '/ui/code.dart';
import '/ui/desc.dart';
import '/ui/NavigationDrawerWidget.dart';

class CodeBD extends StatefulWidget {
  String title;
  CodeBD(this.title, {Key? key}) : super(key: key);

  @override
  _CodeBDState createState() => _CodeBDState();
}

class _CodeBDState extends State<CodeBD> {
  @override
  Widget build(BuildContext context) {
    // ScreenUtil.init(
    //   BoxConstraints(minHeight: 1440, minWidth: 720),
    // );
    return DefaultTabController(
      length: 3,
      child: BackdropScaffold(
        frontLayerBorderRadius: const BorderRadius.only(
          topLeft: Radius.circular(19),
          topRight: Radius.circular(40),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.content_copy),
            onPressed: () {
              Clipboard.setData(ClipboardData(text: CPP.code[widget.title]));
              Fluttertoast.showToast(
                  msg: "Copied code to clipboard", fontSize: 16.0);
            },
          ),
          const BackdropToggleButton(
            icon: AnimatedIcons.list_view,
            color: Colors.black,
          ),
        ],
        headerHeight: 100.h,
        iconPosition: BackdropIconPosition.none,
        drawer: const NavigationDrawerWidget(),
        backLayer: Code(widget: widget),
        frontLayer: Description(widget: widget),
      ),
    );
  }
}
