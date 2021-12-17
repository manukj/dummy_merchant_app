import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/bridge/CoreBridge.dart';
import 'package:flutter_app/bridge/NativeBridge.dart';

class CartaReview extends StatelessWidget {
  const CartaReview({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart review screen'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 50),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Map<String, String> data = {};
                data['merchantTransactionId'] = '12344444';
                CoreDSBridge.instance.openCartReview("232343");
              },
              child: Center(
                child: Text('Pay Through Bank'),
              ),
            ),
            Divider(),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.red),
              ),
              onPressed: () {
                Map<String, String> data = {};
                data['merchantTransactionId'] = '12344444';
                data['merchantOrderDetails'] =
                    'https://merchantdummyapp.web.app/#flutterOrderDetails';
                CoreDSBridge.instance.openCartReview(
                    "https://merchantdummyapp.web.app/#flutterOrderDetails");
              },
              child: Center(
                child: Text('Pay through Wallet/ COD'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
