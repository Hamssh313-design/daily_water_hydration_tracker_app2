import 'package:flutter/material.dart';
import 'result.dart';
import '../widget/gender.dart';
double calculateWaterLitres(
    {required int weightKg, required double activityHours}) {
  int baseMl = weightKg * 35;
  int activityMl = (activityHours * 250).toInt();
  return (baseMl + activityMl) / 1000;
}

class Firstpage extends StatefulWidget {
  const Firstpage({super.key});

  @override
  State<Firstpage> createState() => _FirstpageState();
}

class _FirstpageState extends State<Firstpage> {
  bool isMale = true;
  int weight = 60;
  int age = 20;
  double activityHours = 2;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFF0A0E21),
          appBar: AppBar(
            backgroundColor: const Color(0xFF0A0E21),
            title: const Row(
              children: [
                Icon(Icons.water_drop, color: Color(0xFF00E5FF)),
                SizedBox(width: 8),
                Text('Water Tracker'),
              ],
            ),
          ),
          body: Column(
            children: [
              Row(
                  children: [Expanded(child:
                    Gender(
                    label: 'MALE',
                    icon: Icons.male,
                    isSelected: isMale,
                    onTap: () => setState(() => isMale = true),
                  ),),
                      Expanded(child:Gender(
                        label: 'FEMALE',
                        icon: Icons.female,
                        isSelected: !isMale,
                        onTap: () => setState(() => isMale = false),
                      ),),
                      ],
                    ),




              Container(
                margin: const EdgeInsets.symmetric(horizontal: 12),
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(color: const Color(0xFF1D1E33),
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text('ACTIVITY (hours/day)',
                            style: TextStyle(color: Colors.white54, fontSize: 12)),
                        Text('${activityHours.toInt()} h', style: const TextStyle(
                            color: Color(0xFF00E5FF),
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                      ],

                    ),
                    SizedBox(height: 6,),
                    Slider(
                      value: activityHours,
                      min: 0,
                      max: 8,
                      activeColor: const Color(0xFF00E5FF),
        onChanged: (value) => setState(() => activityHours  = value)

                    ),
                    SizedBox(height: 6,),
                  ],
                ),
              ),
              const SizedBox(height: 12),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                child: Row(
                  children: [
                    Expanded(child: _numberCard('WEIGHT (kg)', weight, () {
                      if (weight > 30) setState(() => weight--);
                    }, () {
                      if (weight < 200) setState(() => weight++);
                    })),
                    const SizedBox(width: 12),
                    Expanded(child: _numberCard('AGE (years)', age, () {
                      if (age > 10) setState(() => age--);
                    }, () {
                      if (age < 100) setState(() => age++);
                    })),
                  ],
                ),
              ),
              SizedBox(height: 80,),
              SizedBox(
                width: double.infinity,
                height: 70,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF00E5FF),
                      shape:  RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(34))),
                  onPressed: () {
                    double litres = calculateWaterLitres(
                        weightKg: weight, activityHours: activityHours);
                    Navigator.push(context, MaterialPageRoute(builder: (context) =>
                        ResultPage(litres: litres,
                            weight: weight,
                            age: age,
                            activityHours: activityHours.toInt())));
                  },
                  child: const Text('Calculate Water Intake', style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
                ),
              ),
            ],
          ),
        ),

    );
  }

  Widget _genderCard(String label, IconData icon, bool selected) {
    return GestureDetector(
      onTap: () => setState(() => isMale = label == 'MALE'),
      child: Container(
        height: 200,
        decoration: BoxDecoration(
          color: selected ? const Color(0xFF1D1E33) : const Color(0xFF111328),
          borderRadius: BorderRadius.circular(10),
          border: selected ? Border.all(
              color: const Color(0xFF00E5FF), width: 2) : null,
        ),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Icon(icon, size: 50, color: Colors.white),
          SizedBox(height: 100,),
          Text(label, style: const TextStyle(color: Colors.white)),
        ]),
      ),
    );
  }

  Widget _numberCard(String label, int value, VoidCallback minus,
      VoidCallback plus) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: const Color(0xFF1D1E33),
          borderRadius: BorderRadius.circular(10)),
      child: Column(children: [
        Text(
            label, style: const TextStyle(color: Colors.white54, fontSize: 11)),
        Text('$value', style: const TextStyle(
            color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold)),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          _roundBtn(Icons.remove, minus),
          const SizedBox(width: 8),
          _roundBtn(Icons.add, plus),
        ])
      ]),
    );
  }

  Widget _roundBtn(IconData icon, VoidCallback onPress) {
    return RawMaterialButton(
      onPressed: onPress,
      constraints: const BoxConstraints.tightFor(width: 40, height: 40),
      shape: const CircleBorder(),
      fillColor: const Color(0xFF4C4F5E),
      child: Icon(icon, size: 18, color: Colors.white),
    );
  }
}