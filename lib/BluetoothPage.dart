import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'ConnectedDevice.dart';

class BluetoothPage extends StatefulWidget {
  @override
  _BluetoothPage createState() => _BluetoothPage();
}

class _BluetoothPage extends State<BluetoothPage> {
  FlutterBluePlus flutterBluePlus = FlutterBluePlus.instance;
  List<ScanResult> scanResults = [];

  @override
  void initState() {
    super.initState();
    flutterBluePlus.scan().listen((scanResult) {
      setState(() {
        scanResults.add(scanResult);
      });
    });
  }

  @override
  void dispose() {
    flutterBluePlus.stopScan();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Поиск...'),
        ),
        body: Center(
          child: ListView.builder(
            itemCount: scanResults.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text(scanResults[index].device.name),
                subtitle: Text(scanResults[index].device.id.toString()),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ConnectedDevice(scanResults[index].device)));
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
