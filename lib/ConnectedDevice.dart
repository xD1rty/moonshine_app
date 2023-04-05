import 'package:flutter/material.dart';
import 'dart:convert';
import "dart:async";
import 'package:flutter_blue/flutter_blue.dart';
import 'main.dart';

class ConnectedDevice extends StatefulWidget {
  BluetoothDevice device;
  ConnectedDevice(this.device);


  @override
  _ConnectedDevice createState() => _ConnectedDevice(device);
}

class _ConnectedDevice extends State<ConnectedDevice>{
  BluetoothDevice device;
  _ConnectedDevice(this.device);

  @override
  void initState() {
    super.initState();
    device.connect();
    getCharasteristicData();
  }
  @override
  void dispose() {
    super.dispose();
  }
  // initState();

  var temp;
  var characteristic;
  void getCharasteristicData () async {
    List<BluetoothService> services = await device.discoverServices();
    for (BluetoothService service in services) {
      List<BluetoothCharacteristic> characteristics = service
          .characteristics;
      for (BluetoothCharacteristic characteristic_ in characteristics) {
        if (characteristic_.uuid.toString() == "beb5483e-36e1-4688-b7f5-ea07361b26a8") {
          characteristic = characteristic_;

        }
      }
    }

  }

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(device.name),
        ),
        body: Center(
          child: ElevatedButton(
            onPressed: () async {
              characteristic.read().then((value) {
              print(String.fromCharCodes(value));
              });
              characteristic.value.listen((event) {temp=jsonDecode(String.fromCharCodes(event));});
              print(temp);
            },
            child: Text("Hello"),
          )
        ),
      ),
    );
  }
}