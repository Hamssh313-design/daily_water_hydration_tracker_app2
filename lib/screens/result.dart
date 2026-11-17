import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final double litres;
  final int weight;
  final int age;
  final int activityHours;

  const ResultPage({super.key, required this.litres, required this.weight, required this.age, required this.activityHours});

  String get guidance {
    if (litres < 2.0) {
      return ' drink more water';
    } else if (litres <= 3.0) {
      return 'good';
    } else {
      return 'Execellent';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 25),
            const Text('Your Daily Water Intake', style: TextStyle(color: Colors.white, fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFF1D1E33),
                  border: Border.all(color: const Color(0xFF00E5FF), width: 2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Column(
                  children: [
                    const Icon(Icons.water_drop, color: Color(0xFF00E5FF), size: 48),
                    const SizedBox(height: 12),
                    Text('${litres.toStringAsFixed(2)} L / Day', style: const TextStyle(color: Color(0xFF00E5FF), fontSize: 30, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    const Text('Estimated value\n(educational formula)', textAlign: TextAlign.center, style: TextStyle(color: Colors.white60)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),
            const Text('Educational estimate only —\nnot medical advice', textAlign: TextAlign.center, style: TextStyle(color: Colors.white54)),
            const SizedBox(height: 15),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 20), child: Text(guidance, textAlign: TextAlign.center, style: const TextStyle(color: Colors.white70))),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [Text('Weight: $weight kg', style: const TextStyle(color: Colors.white60)), Text('Activity: $activityHours h', style: const TextStyle(color: Colors.white60))]),
                  Align(alignment: Alignment.centerLeft, child: Text('Age: $age years', style: const TextStyle(color: Colors.white60))),
                ],
              ),
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              height: 60,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF00E5FF), shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero)),
                onPressed: () => Navigator.pop(context),
                child: const Text('Re-calculate', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}