import 'package:flutter/material.dart';

class weathericons {
  Widget getweathericon(int code) {
    switch (code) {
      case > 200 && <= 300:
        return Image.asset('assets/we.png');
        case > 200 && <= 300:
        return Image.asset('assets/we.png');
        case > 300 && <= 400:
        return Image.asset('assets/we.png');
        case > 400 && <= 500:
        return Image.asset('assets/we.png');
        case > 500 && <= 600:
        return Image.asset('assets/we.png');
        case > 600 && <= 700:
        return Image.asset('assets/we.png');
        case > 700 && <= 800:
        return Image.asset('assets/we.png');
        case == 800 :
        return Image.asset('assets/we.png');
        case > 800 && <= 804:
        return Image.asset('assets/we.png');
      default:
        return Image.asset("assets/w.png.png");
    }
  }
}
