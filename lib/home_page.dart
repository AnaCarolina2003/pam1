import 'package:flutter/material.dart';
import 'package:vibration/vibration.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 100, right: 100),
        child: Column(  
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            createButton("Vibrar 500ms", simpleVibration),
            createButton("Vibrar 1s", oneSecondVibration),
            createButton("Vibrar mais", alternatedVibration),
          ],
        ),
      ),
    );
  }

  void simpleVibration() => Vibration.vibrate(); // permitido por ter apenas uma linha só
  void oneSecondVibration() => Vibration.vibrate(duration: 1000, intensities: [250]);
  void alternatedVibration() => Vibration.vibrate(
    pattern: [
      500, 1000, 500, 2000, 500, 3000, 500, 4000 // espera 0.5, vibra 1, espera 0.5, vibra 2
      ]
    );

  Widget createButton(String text, VoidCallback action) {
    return SizedBox(
      width: double.maxFinite,
      height: 45,
      child: ElevatedButton(
        onPressed: action,
        child: Text(text),
      ),
    );
  }
}