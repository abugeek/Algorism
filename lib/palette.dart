//palette.dart
// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';

class Palette {
  static const MaterialColor kToDark = const MaterialColor(
    0xffFDF2EC, // 0% comes in here, this will be color picked if no shade is selected when defining a Color property which doesn’t require a swatch.
    const <int, Color>{
      50: const Color(0xffe4dad4), //10%
      100: const Color(0xffcac2bd), //20%
      200: const Color(0xffb1a9a5), //30%
      300: const Color(0xff98918e), //40%
      400: const Color(0xff7f7976), //50%
      500: const Color(0xff65615e), //60%
      600: const Color(0xff4c4947), //70%
      700: const Color(0xff33302f), //80%
      800: const Color(0xff191818), //90%
      900: const Color(0xff000000), //100%
    },
  );
} // y
