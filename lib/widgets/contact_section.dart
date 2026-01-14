// Contact Section
import 'package:flutter/material.dart';
import 'package:shabio/core/colors.dart';
import 'package:shabio/web_utils_stub.dart' as web_utils;
import 'package:shabio/widgets/contact_btn.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 30 : 80,
        vertical: 120,
      ),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [AppColors.gradientStart, AppColors.gradientEnd],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Get In Touch',
            style: TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.white,
              letterSpacing: -1,
            ),
          ),
          const SizedBox(height: 20),
          Container(
            width: 100,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 50),
          Text(
            'I\'m always open to discussing new projects, creative ideas, or opportunities to be part of your visions.',
            style: TextStyle(
              fontSize: isMobile ? 16 : 20,
              color: Colors.white.withValues(alpha: 0.9),
              height: 1.6,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 60),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 25,
            runSpacing: 25,
            children: [
              ContactButton(
                icon: Icons.email,
                label: 'Email',
                gradient: [AppColors.primary, AppColors.secondary],
                onTap: () => web_utils.openEmail('developer@example.com'),
              ),
              ContactButton(
                icon: Icons.link,
                label: 'LinkedIn',
                gradient: [AppColors.secondary, AppColors.accent],
                onTap:
                    () => web_utils.openUrl('https://linkedin.com', 'linkedin'),
              ),
              ContactButton(
                icon: Icons.code,
                label: 'GitHub',
                gradient: [AppColors.accent, AppColors.primary],
                onTap: () => web_utils.openUrl('https://github.com', 'github'),
              ),
              ContactButton(
                icon: Icons.article,
                label: 'Blog',
                gradient: [const Color(0xFFFFA726), const Color(0xFFFF6F00)],
                onTap: () => web_utils.openUrl('https://medium.com', 'blog'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
