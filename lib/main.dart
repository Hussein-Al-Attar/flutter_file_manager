import 'package:flutter/material.dart';
import 'package:flutter_file_manager/PermissionApp.dart';
import 'package:flutter_file_manager/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool _isLoding = false;

  @override
  void initState() {
    PermissionApp.getStorgePermission().then((value) {
      if (value == true) {
        _isLoding = value;
        setState(() {});
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("can not open app with out Permission"),
          behavior: SnackBarBehavior.floating,
        ));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _isLoding
          ? Home()
          : Scaffold(
              appBar: AppBar(),
              body: const Center(
                child: CircularProgressIndicator(),
              )),
    );
  }
}
