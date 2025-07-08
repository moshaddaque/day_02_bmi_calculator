import 'package:day_02_bmi_calculator/providers/bmi_provider.dart';
import 'package:day_02_bmi_calculator/widgets/gender_card.dart';
import 'package:flutter/material.dart';

class GenderSelection extends StatelessWidget {
  final BmiProvider bmiProvider;
  const GenderSelection({super.key, required this.bmiProvider});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: GenderCard(
            gender: Gender.male,
            isSelected: bmiProvider.selectedGender == Gender.male,
            onTap: () => bmiProvider.setGender(Gender.male),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: GenderCard(
            gender: Gender.female,
            isSelected: bmiProvider.selectedGender == Gender.female,
            onTap: () => bmiProvider.setGender(Gender.female),
          ),
        ),
      ],
    );
  }
}
