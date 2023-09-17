import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'pages/Home.page.dart';
import 'pages/Other.page.dart';

void main() {
  runApp(GetMaterialApp(
    initialRoute: '/',
    getPages: [
      GetPage(
        name: '/',
        page: () => Home(),
        transition: Transition.cupertinoDialog,
      ),
      GetPage(
        name: '/other',
        page: () => Other(),
        transition: Transition.cupertinoDialog,
      ),
    ],
  ));
}
