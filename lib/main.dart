import 'package:provider/provider.dart';
import 'model.dart';
import 'package:digimicapp/camera.dart';
import 'package:digimicapp/controls.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

/// Example app for Camera Windows plugin.

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(create: (context) => ESPdataState(), child: MaterialApp(
      title: 'Expenses App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    ));
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Digital Microscope IEEE'),
      ),
      body: Row(
        children: [
          const Expanded(
            child: CameraWindow(),
          ),
          Expanded(
            child: Container(
              color: Colors.blue,
              height: double.infinity,
              child: const Center(
                child: Text(
                  'Segment 2',
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}