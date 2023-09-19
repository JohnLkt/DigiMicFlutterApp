import 'package:microview/controls.dart';
import 'package:microview/credits.dart';
import 'package:provider/provider.dart';
import 'model.dart';
import 'package:microview/camera.dart';
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
        title: 'MicroView',
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
    final digimicState = Provider.of<DigimicState>(context);

    // Show snackbar when snackBarError changes
    if (digimicState.snackBarError.isNotEmpty) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(digimicState.snackBarError),
          ),
        );
      });
    }
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('MicroView'),
        actions: [
          IconButton(
            icon: const Icon(Icons.copyright),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const CreditsPage(),
                ),
              );
            },
          ),
        ],
      ),
      body: Row(
        children: [
          const Expanded(
            child: CameraWindow(),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.3,
            child: Container(
              height: double.infinity,
              color: Colors.white,
              child: const SingleChildScrollView(
                child: Center(
                  child: Material(
                    color: Colors.white,
                    child: ControlPanel(),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

