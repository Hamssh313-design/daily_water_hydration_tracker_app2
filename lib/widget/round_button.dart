import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPress;
  const RoundButton({super.key, required this.icon, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
onTap: onPress,
child: CircleAvatar(
radius: 25,
backgroundColor: Color(0xFF4C4F5E),
child: Icon(icon, color: Colors.white),));
    }
}
/* RawMaterialButton(
      onPressed: onPress,
      constraints: const BoxConstraints.tightFor(width: 45, height: 45),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      child: Icon(icon, color: Colors.white),*/
