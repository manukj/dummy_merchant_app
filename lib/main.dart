import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/bridge/CoreBridge.dart';
import 'package:flutter_app/screen/cart_review.dart';
import 'package:flutter_app/screen/order_details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (setting) {
        switch (setting.name) {
          case 'second':
            return MaterialPageRoute(
              settings: setting, // <--- add
              builder: (context) {
                return CartaReview();
              },
            );
          case 'flutterOrderDetails':
            return MaterialPageRoute(
              settings: setting, // <--- add
              builder: (context) {
                return OrderDetailsScreen();
              },
            );
        }
        return MaterialPageRoute(
          settings: setting, // <--- add
          builder: (context) {
            return HomeScreen();
          },
        );
      },
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String permissionData = '';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    CoreDSBridge.instance.onSSOFlow();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Merchant Home Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          FlutterLogo(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, 'second');
              },
              child: Center(
                child: Text('Go Cart Review'),
              ),
            ),
          ),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }
}
