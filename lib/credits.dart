import 'package:flutter/material.dart';

class CreditsPage extends StatelessWidget {
  const CreditsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Credits Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'MicroView',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Developed by:',
              style: TextStyle(
                fontSize: 16,
              ),
            ), 

            const Text(
              'John Lukito, Adyatma Dwiki Damardjati, Ady Wijaya, Alvin, Johan Yapson',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ), 
            const Text(
              'IEEE SB Binus University',
              style: TextStyle(
                fontSize: 18,
              ),
            ), 
            const SizedBox(height: 8),
            const Text(
              'Version: 1.0.0',
              style: TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'Special thanks to:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  child: Image.asset('assets/BinusHR.png', width: 240),
                ),
                SizedBox(
                  child: Image.asset('assets/IEEESBBinus.png', width: 240),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
