import 'package:flutter/material.dart';
import '../animalItem.dart';

class SecondApp extends StatelessWidget {
  final List<Animal>? list;
  SecondApp({Key? key, this.list}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text('두번째 페이지'),
        ),
      ),
    );
  }
}
