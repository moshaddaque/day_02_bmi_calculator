import 'dart:math' as math;

import 'package:flutter/material.dart';

class BMIScaleBar extends StatelessWidget {
  final double bmiValue;

  const BMIScaleBar({Key? key, required this.bmiValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            Container(
              height: 10,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                gradient: const LinearGradient(
                  colors: [
                    Colors.blue, // Underweight
                    Colors.green, // Normal
                    Colors.orange, // Overweight
                    Colors.red, // Obese
                  ],
                ),
              ),
            ),
            const SizedBox(height: 8),
            Stack(
              children: [
                Container(height: 20, width: double.infinity),
                Positioned(
                  left: _calculateIndicatorPosition(
                    bmiValue,
                    constraints.maxWidth,
                  ),
                  child: Container(
                    width: 3,
                    height: 20,
                    decoration: BoxDecoration(
                      color: isDark ? Colors.white : Colors.black,
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '16',
                  style: TextStyle(
                    fontSize: 12,
                    color: isDark ? Colors.white70 : Colors.grey[600],
                  ),
                ),
                Text(
                  '18.5',
                  style: TextStyle(
                    fontSize: 12,
                    color: isDark ? Colors.white70 : Colors.grey[600],
                  ),
                ),
                Text(
                  '25',
                  style: TextStyle(
                    fontSize: 12,
                    color: isDark ? Colors.white70 : Colors.grey[600],
                  ),
                ),
                Text(
                  '30',
                  style: TextStyle(
                    fontSize: 12,
                    color: isDark ? Colors.white70 : Colors.grey[600],
                  ),
                ),
                Text(
                  '35',
                  style: TextStyle(
                    fontSize: 12,
                    color: isDark ? Colors.white70 : Colors.grey[600],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  double _calculateIndicatorPosition(double bmi, double containerWidth) {
    // Normalize BMI to 0-1 range for positioning
    double normalized = math.min(math.max((bmi - 16) / (35 - 16), 0), 1);

    // Calculate position based on actual container width
    // Subtract half the indicator width (1.5) to center it properly
    double position = (normalized * containerWidth) - 1.5;

    // Ensure the indicator stays within bounds
    return math.max(0, math.min(position, containerWidth - 3));
  }
}
