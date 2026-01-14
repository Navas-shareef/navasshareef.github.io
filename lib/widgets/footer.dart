import 'package:flutter/material.dart';
import 'package:shabio/core/colors.dart';

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 40),
      decoration: BoxDecoration(color: AppColors.dark),
      child: Center(
        child: RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 14, color: Colors.grey.shade400),
            children: const [
              TextSpan(text: '© 2024 Flutter Developer Portfolio. Built with '),
              TextSpan(
                text: 'Flutter 💙',
                style: TextStyle(
                  color: Color(0xFF2196F3),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
