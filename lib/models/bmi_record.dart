import 'package:day_02_bmi_calculator/providers/bmi_provider.dart';

class BmiRecord {
  final double bmi;
  final double height;
  final double weight;
  final int age;
  final Gender gender;
  final DateTime date;

  BmiRecord({
    required this.bmi,
    required this.height,
    required this.weight,
    required this.age,
    required this.gender,
    DateTime? date,
  }) : date = date ?? DateTime.now();
}
