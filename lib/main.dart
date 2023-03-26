import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'BluetoothPage.dart';
import 'ConnectedDevice.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      routes: {
        '/': (context) => HomePage(),
        '/connect': (context) => BluetoothPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("MoonShine"),
        ),
        body: Center(
          child: ElevatedButton(
            child: const Text("Присоединиться"),
            onPressed: () {
              //right way: use context in below level tree with MaterialApp
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => BluetoothPage()));
            },
          ),
        ),
      ),
    );
  }
}