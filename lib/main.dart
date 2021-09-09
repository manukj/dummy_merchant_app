import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/bridge/CoreBridge.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(permissionData),
          Divider(),
          FlatButton(
            onPressed: () {
              CoreDSBridge.instance.onSSOFlow();
            },
            child: Text('SSO Login'),
          ),
          Divider(),
          FlatButton(
            onPressed: () async {
              setState(() {
                permissionData = 'asking for permission';
              });
              bool data =
                  await CoreDSBridge.instance.onPermissionRequest('Camera');
              _onPermissionGrant(data, 'Camera');
            },
            child: Text('Camera ...  Permission'),
          ),
          FlatButton(
            onPressed: () async {
              setState(() {
                permissionData = 'asking for permission';
              });
              _onPermissionGrant(
                  await CoreDSBridge.instance.onPermissionRequest('File'),
                  'File');
            },
            child: Text('File Permission'),
          ),
          Divider(),
          FlatButton(
            onPressed: () {
              Map<String, String> data = {};
              data['transactionID'] = '12344444';
              CoreDSBridge.instance.openCartReview(jsonEncode(data));
            },
            child: Text('Cart Review'),
          ),
          SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }

  void _onPermissionGrant(bool grant, String permission) {
    print('----- in call back flutter $permission $grant');
    String data = '$permission denied';
    if (grant) {
      data = '$permission Granted';
    }
    setState(() {
      print('----- inside set state $permission $grant');
      permissionData = data;
    });
  }
}
