// About Section
import 'package:flutter/material.dart';
import 'package:shabio/core/colors.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 30 : 80,
        vertical: 10,
      ),
      color: Colors.black,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                width: 5,
                height: 50,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.primary, AppColors.accent],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(width: 15),
              const Text(
                'About Me',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: -1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 50),
          Container(
            padding: const EdgeInsets.all(40),
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withValues(alpha: 0.1),
                  blurRadius: 30,
                  offset: const Offset(0, 15),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'I am a passionate Flutter developer with expertise in building cross-platform mobile and web applications. With a strong foundation in Dart programming and Flutter framework, I create beautiful, performant, and user-friendly applications.',
                  style: TextStyle(
                    fontSize: isMobile ? 16 : 18,
                    color: AppColors.light,
                    height: 1.8,
                  ),
                ),
                const SizedBox(height: 25),
                Text(
                  'My experience includes developing responsive UI/UX, implementing state management solutions, integrating REST APIs, and deploying applications to both Android and iOS platforms. I am always eager to learn new technologies and improve my skills.',
                  style: TextStyle(
                    fontSize: isMobile ? 16 : 18,
                    color: AppColors.light,
                    height: 1.8,
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
