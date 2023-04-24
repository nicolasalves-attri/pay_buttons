import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter/services.dart';
import 'package:pay_buttons/pay_buttons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: AdaptivePayButton(
            applePayButton: ApplePayButton(
              style: ApplePayButtonStyle.white,
              type: ApplePayButtonType.subscribe,
              onPressed: () {
                print('onPressed!!');
              },
            ),
            googlePayButton: GooglePayButton(
              style: GooglePayButtonStyle.white,
              type: GooglePayButtonType.subscribe,
              onPressed: () {
                print('onPressed!!');
              },
            ),
          ),
        ),
      ),
    );
  }
}
