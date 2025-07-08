import 'package:day_02_bmi_calculator/providers/bmi_provider.dart';
import 'package:day_02_bmi_calculator/widgets/bmi_scale_bar.dart';
import 'package:day_02_bmi_calculator/widgets/glassmorphic_card.dart';
import 'package:flutter/material.dart';

class ResultCard extends StatelessWidget {
  final BmiProvider bmiProvider;
  const ResultCard({super.key, required this.bmiProvider});

  @override
  Widget build(BuildContext context) {
    return GlassmorphicCard(
      padding: const EdgeInsets.all(24),
      child: Column(
        children: [
          Text(
            'Your BMI Result',
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w600,
              color: bmiProvider.isDarkMode ? Colors.white : Colors.black87,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: bmiProvider.getBmiColor().withOpacity(0.1),
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: bmiProvider.getBmiColor().withOpacity(0.3),
                width: 2,
              ),
            ),
            child: Column(
              children: [
                Text(
                  bmiProvider.bmiResult!.toStringAsFixed(1),
                  style: TextStyle(
                    fontSize: 48,
                    fontWeight: FontWeight.bold,
                    color: bmiProvider.getBmiColor(),
                  ),
                ),
                Text(
                  bmiProvider.getBmiCategory(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: bmiProvider.getBmiColor(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          BMIScaleBar(bmiValue: bmiProvider.bmiResult!),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color:
                  bmiProvider.isDarkMode
                      ? Colors.grey[800]?.withOpacity(0.5)
                      : Colors.blue[50],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              children: [
                Icon(
                  Icons.lightbulb,
                  color: bmiProvider.isDarkMode ? Colors.amber : Colors.blue,
                  size: 24,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    bmiProvider.getHealthTips(),
                    style: TextStyle(
                      fontSize: 14,
                      color:
                          bmiProvider.isDarkMode
                              ? Colors.white
                              : Colors.black87,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
