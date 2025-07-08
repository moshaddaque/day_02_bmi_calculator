import 'package:day_02_bmi_calculator/providers/bmi_provider.dart';
import 'package:day_02_bmi_calculator/widgets/glassmorphic_button.dart';
import 'package:flutter/material.dart';

class HeaderSection extends StatelessWidget {
  final BmiProvider bmiProvider;
  const HeaderSection({super.key, required this.bmiProvider});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'BMI Calculator',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: bmiProvider.isDarkMode ? Colors.white : Colors.black87,
              ),
            ),

            Text(
              "Track your health journey",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color:
                    bmiProvider.isDarkMode
                        ? Colors.grey[400]
                        : Colors.grey[600],
              ),
            ),
          ],
        ),

        Row(
          children: [
            GlassmorphicButton(
              onPressed: bmiProvider.toggleUnitSystem,
              child: Text(
                bmiProvider.isMetric ? 'KG/CM' : 'LB/IN',
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 12,
                ),
              ),
            ),
            const SizedBox(width: 10),
            GlassmorphicButton(
              onPressed: bmiProvider.toggleTheme,
              child: Icon(
                bmiProvider.isDarkMode ? Icons.light_mode : Icons.dark_mode,
                color: bmiProvider.isDarkMode ? Colors.white : Colors.black87,
                size: 20,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
