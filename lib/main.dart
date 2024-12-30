import 'package:enjoy_plus/pages/tab_bar/tab_bar_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      '/': (context) => const TabBarPage(),
    },
    initialRoute: '/',
  ));
}