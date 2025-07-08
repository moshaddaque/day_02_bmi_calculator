import 'package:day_02_bmi_calculator/providers/bmi_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GenderCard extends StatelessWidget {
  final Gender gender;
  final bool isSelected;
  final VoidCallback onTap;
  const GenderCard({
    super.key,
    required this.gender,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: () {
        HapticFeedback.lightImpact();
        onTap();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color:
              isSelected
                  ? const Color(0xFF6C63FF).withOpacity(0.1)
                  : (isDark
                      ? Colors.white.withOpacity(0.05)
                      : Colors.white.withOpacity(0.7)),
          border: Border.all(
            color:
                isSelected
                    ? const Color(0xFF6C63FF)
                    : (isDark
                        ? Colors.white.withOpacity(0.1)
                        : Colors.white.withOpacity(0.3)),
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color:
                  isSelected
                      ? const Color(0xFF6C63FF).withOpacity(0.3)
                      : (isDark
                          ? Colors.black.withOpacity(0.1)
                          : Colors.black.withOpacity(0.05)),
              blurRadius: 10,
              offset: const Offset(0, 5),
            ),
          ],
        ),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              gender == Gender.male ? Icons.male : Icons.female,
              size: 40,
              color:
                  isSelected
                      ? const Color(0xFF6C63FF)
                      : (isDark ? Colors.white70 : Colors.grey[600]),
            ),

            const SizedBox(height: 8),
            Text(
              gender == Gender.male ? 'Male' : 'Female',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color:
                    isSelected
                        ? const Color(0xFF6C63FF)
                        : (isDark ? Colors.white70 : Colors.grey[600]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
