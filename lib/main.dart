import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './pages/home_page.dart';

void main() {
  runApp(DevicePreview(
    enabled: true,
    builder: (BuildContext context) => const HomeApp(),
  ));
}

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ));
    return  const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
      
    );
  }
}
