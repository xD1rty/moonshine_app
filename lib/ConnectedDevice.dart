import 'package:flutter/material.dart';
import 'dart:convert';
import "dart:async";
import 'package:flutter_blue_plus/flutter_blue_plus.dart';

class ConnectedDevice extends StatelessWidget {
  BluetoothDevice device;
  ConnectedDevice(this.device);

  @override
  void initState() {
    device.connect();
  }
  // initState();
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(device.name),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () {

              print(device.discoverServices());
            },
            child: Text("Get data"),
          ),
        ),
      ),
    );
  }
}