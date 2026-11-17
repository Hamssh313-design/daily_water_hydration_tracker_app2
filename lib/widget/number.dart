import 'package:flutter/material.dart';
import 'round_button.dart';

class Number extends StatelessWidget {
  final String label;
  final int value;
  final VoidCallback onMinus;
  final VoidCallback onPlus;
  const Number({super.key, required this.label, required this.value, required this.onMinus, required this.onPlus});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(color: const Color(0xFF1D1E33), borderRadius: BorderRadius.circular(10)),
      child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(label, style: const TextStyle(color: Colors.white54, fontSize: 12)),
        Text('$value', style: const TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold)),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          RoundButton(icon: Icons.remove, onPress: onMinus),
          const SizedBox(width: 8),
          RoundButton(icon: Icons.add, onPress: onPlus),
        ])
      ]),
    );
  }
}

