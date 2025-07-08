import 'package:day_02_bmi_calculator/providers/bmi_provider.dart';
import 'package:day_02_bmi_calculator/widgets/slider_card.dart';
import 'package:flutter/material.dart';

class InputSliders extends StatelessWidget {
  final BmiProvider bmiProvider;
  const InputSliders({super.key, required this.bmiProvider});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SliderCard(
          title: bmiProvider.isMetric ? 'Height (cm)' : 'Height (in)',
          value: bmiProvider.height,
          min: bmiProvider.isMetric ? 100 : 39,
          max: bmiProvider.isMetric ? 220 : 87,
          onChanged: bmiProvider.setHeight,
          unit: bmiProvider.isMetric ? 'cm' : 'in',
        ),
        const SizedBox(height: 20),
        SliderCard(
          title: bmiProvider.isMetric ? 'Weight (kg)' : 'Weight (lbs)',
          value: bmiProvider.weight,
          min: bmiProvider.isMetric ? 30 : 66,
          max: bmiProvider.isMetric ? 150 : 330,
          onChanged: bmiProvider.setWeight,
          unit: bmiProvider.isMetric ? 'kg' : 'lbs',
        ),
        const SizedBox(height: 20),
        SliderCard(
          title: 'Age',
          value: bmiProvider.age.toDouble(),
          min: 1,
          max: 100,
          onChanged: (value) => bmiProvider.setAge(value.round()),
          unit: 'years',
        ),
      ],
    );
  }
}
