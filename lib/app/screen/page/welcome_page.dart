import 'package:basic/app/screen/page/base_page.dart';
import 'package:basic/app/screen/page/view/welcome_view.dart';
import 'package:flutter/material.dart';

class WelcomePage extends BasePage {
  static Route route() {
    return MaterialPageRoute<void>(fullscreenDialog: true, builder: (_) => WelcomePage());
  }
  @override
  Widget build(BuildContext context) {
    return WelcomeView();
  }
}