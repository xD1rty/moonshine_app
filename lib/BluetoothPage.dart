import 'package:flutter/material.dart';
import 'package:flutter_blue/flutter_blue.dart';
import 'ConnectedDevice.dart';

class BluetoothPage extends StatefulWidget {
  @override
  _BluetoothPage createState() => _BluetoothPage();
}

class _BluetoothPage extends State<BluetoothPage> {
  FlutterBlue flutterBlue = FlutterBlue.instance;
  List<ScanResult> scanResults = [];

  @override
  void initState() {
    super.initState();
    flutterBlue.scan().listen((scanResult) {
      setState(() {
        scanResults.add(scanResult);
        print(scanResult);
      });
    });
  }

  @override
  void dispose() {
    flutterBlue.stopScan();
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
