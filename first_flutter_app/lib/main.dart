import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    print('createState');
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  var switchValue = false;
  String test = 'hello';
  Color _color = Colors.blue;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      darkTheme: ThemeData.light(),
      home: Scaffold(
        body: Center(
          child: ElevatedButton(
            child: Text(test),
            style:
                ButtonStyle(backgroundColor: MaterialStateProperty.all(_color)),
            onPressed: () {
              if (_color == Colors.blue) {
                setState(() {
                  test = 'flutter';
                  _color = Colors.amber;
                });
              } else {
                setState(() {
                  test = 'flutter';
                  _color = Colors.blue;
                });
              }
            },
          ),
        ),
        // body: Center(
        //   child: Switch(
        //       value: switchValue,
        //       onChanged: (value) {
        //         setState(() {
        //           print(value);
        //           switchValue = value;
        //         });
        //       }),
      ),
    );
  }
}
