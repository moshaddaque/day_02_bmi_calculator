import 'package:day_02_bmi_calculator/providers/bmi_provider.dart';
import 'package:day_02_bmi_calculator/widgets/calculate_button.dart';
import 'package:day_02_bmi_calculator/widgets/gender_selection.dart';
import 'package:day_02_bmi_calculator/widgets/header_section.dart'
    show HeaderSection;
import 'package:day_02_bmi_calculator/widgets/input_sliders.dart';
import 'package:day_02_bmi_calculator/widgets/result_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BmiCalculatorScreen extends StatefulWidget {
  const BmiCalculatorScreen({super.key});

  @override
  State<BmiCalculatorScreen> createState() => _BmiCalculatorScreenState();
}

class _BmiCalculatorScreenState extends State<BmiCalculatorScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _fadeAnimation;
  late Animation<Offset> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, 0.5),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.elasticOut),
    );
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BmiProvider>(
        builder: (context, bmiProvider, child) {
          return Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors:
                    bmiProvider.isDarkMode
                        ? [const Color(0xFF1A1A1A), const Color(0xFF2D2D2D)]
                        : [const Color(0xFFF5F7FA), const Color(0xFFE8F0FE)],
              ),
            ),

            child: SafeArea(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20.0),
                child: FadeTransition(
                  opacity: _fadeAnimation,
                  child: SlideTransition(
                    position: _slideAnimation,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HeaderSection(bmiProvider: bmiProvider),
                        const SizedBox(height: 30),
                        GenderSelection(bmiProvider: bmiProvider),
                        const SizedBox(height: 25),
                        InputSliders(bmiProvider: bmiProvider),
                        const SizedBox(height: 30),
                        CalculateButton(bmiProvider: bmiProvider),

                        if (bmiProvider.bmiResult != null) ...[
                          const SizedBox(height: 30),
                          ResultCard(bmiProvider: bmiProvider),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
