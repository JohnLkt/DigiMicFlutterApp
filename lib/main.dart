import 'package:digimicapp/controls.dart';
import 'package:provider/provider.dart';
import 'model.dart';
import 'package:digimicapp/camera.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => DigimicState(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Digital Microscope IEEE',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(9),
              ),
            ),
          ),
          sliderTheme: SliderThemeData(
            showValueIndicator: ShowValueIndicator.never,
            tickMarkShape: const RoundSliderTickMarkShape(
              tickMarkRadius: 5
            ),
            activeTickMarkColor: Colors.lightBlueAccent,
            inactiveTickMarkColor: Colors.blueGrey.withOpacity(0.4),
          ),
        ),
        home: const HomePage(),
      )
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Container(
              color: Colors.white,
              height: double.infinity,
              child: const Center(
                child: Material(
                  child: ControlPanel(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
