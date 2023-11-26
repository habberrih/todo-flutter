import 'package:flutter/material.dart';
import '../utils/colors.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorBG,
        elevation: 0,
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              const Icon(
                Icons.menu,
                color: colorBlack,
                size: 30,
              ),
              SizedBox(
                height: 40,
                width: 40,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20.0),
                  child: Image.asset(''),
                ),
              )
            ],
          ),
        ),
        centerTitle: true,
        titleSpacing: 1.0,
      ),
    );
  }
}
