import 'package:day_02_bmi_calculator/models/bmi_record.dart';
import 'package:flutter/material.dart';

enum Gender { male, female }

class BmiProvider extends ChangeNotifier {
  double _height = 170.0; // Default height in cm
  double _weight = 70.0; // Default weight in kg
  int _age = 25; // Default age
  Gender _selectedGender = Gender.male; // Default gender
  bool _isDarkMode = false; // Default theme mode
  bool _isMetric = true; // Default unit system
  double? _bmiResult; // BMI result
  List<BmiRecord> _history = []; // List to store BMI records

  // Getters
  double get height => _height;
  double get weight => _weight;
  int get age => _age;
  Gender get selectedGender => _selectedGender;
  bool get isDarkMode => _isDarkMode;
  bool get isMetric => _isMetric;
  double? get bmiResult => _bmiResult;
  List<BmiRecord> get history => _history;

  // Setters
  void setHeight(double value) {
    _height = value;
    notifyListeners();
  }

  void setWeight(double value) {
    _weight = value;
    notifyListeners();
  }

  void setAge(int value) {
    _age = value;
    notifyListeners();
  }

  void setGender(Gender value) {
    _selectedGender = value;
    notifyListeners();
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }

  void toggleUnitSystem() {
    _isMetric = !_isMetric;
    if (_isMetric) {
      _height = _height * 2.54; // Convert cm to inches
      _weight = _weight * 0.453592; // Convert kg to pounds
    } else {
      _height = _height / 2.54; // Convert inches to cm
      _weight = _weight / 0.453592; // Convert pounds to kg
    }
    notifyListeners();
  }

  void calculateBmi() {
    if (_height > 0 && _weight > 0) {
      double heightInMeters = _height / 100; // Convert cm to meters
      _bmiResult = _weight / (heightInMeters * heightInMeters);
      _bmiResult = double.parse(
        _bmiResult!.toStringAsFixed(2),
      ); // Round to 2 decimal places
      _addToHistory();
    } else {
      _bmiResult = null; // Reset BMI result if height or weight is invalid
    }
    notifyListeners();
  }

  void _addToHistory() {
    if (_bmiResult != null) {
      _history.add(
        BmiRecord(
          height: _height,
          weight: _weight,
          age: _age,
          gender: _selectedGender,
          bmi: _bmiResult!,
        ),
      );
    }
    notifyListeners();
  }

  String getBmiCategory() {
    if (_bmiResult == null) return 'N/A';
    if (_bmiResult! < 18.5) {
      return 'Underweight';
    } else if (_bmiResult! < 25) {
      return 'Normal weight';
    } else if (_bmiResult! < 30) {
      return 'Overweight';
    } else {
      return 'Obesity';
    }
  }

  Color getBmiColor() {
    if (_bmiResult == null) return Colors.grey;
    if (_bmiResult! < 18.5) {
      return Colors.blue; // Underweight
    } else if (_bmiResult! < 25) {
      return Colors.green; // Normal weight
    } else if (_bmiResult! < 30) {
      return Colors.orange; // Overweight
    } else {
      return Colors.red; // Obesity
    }
  }

  String getHealthTips() {
    if (_bmiResult == null) return 'Please calculate your BMI first.';
    if (_bmiResult! < 18.5) {
      return 'Consider a balanced diet with more calories and strength training.';
    } else if (_bmiResult! < 25) {
      return 'Maintain a balanced diet and regular exercise to stay healthy.';
    } else if (_bmiResult! < 30) {
      return 'Focus on a balanced diet and increase physical activity.';
    } else {
      return 'Consult a healthcare provider for personalized advice on weight management.';
    }
  }
}
