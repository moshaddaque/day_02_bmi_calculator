import 'package:day_02_bmi_calculator/providers/bmi_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculateButton extends StatelessWidget {
  final BmiProvider bmiProvider;
  const CalculateButton({super.key, required this.bmiProvider});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        onPressed: () {
          HapticFeedback.mediumImpact();
          bmiProvider.calculateBmi();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF6C63FF),
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            gradient: const LinearGradient(
              colors: [Color(0xFF6C63FF), Color(0xFF8B5FBF)],
            ),
          ),
          child: Center(
            child: Text(
              "Calculate BMI",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
