// Hero Section with Animated Background
import 'package:flutter/material.dart';
import 'package:shabio/core/asset_constants.dart';
import 'package:shabio/core/colors.dart';
import 'package:shabio/tech_icons_painter.dart';
import 'package:shabio/web_utils_stub.dart' as web_utils;
import 'package:shabio/widgets/animated_txt.dart';
import 'package:shabio/widgets/fade_animated_widget.dart';
import 'package:shabio/widgets/gradient_btn.dart';
import 'package:shabio/widgets/outline_btn.dart';

class HeroSection extends StatelessWidget {
  final AnimationController animationController;

  const HeroSection({super.key, required this.animationController});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return Container(
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(color: Colors.black),
      child: Stack(
        children: [
          // Animated Background Tech Icons
          if (!isMobile)
            AnimatedBuilder(
              animation: animationController,
              builder: (context, child) {
                return CustomPaint(
                  painter: AnimatedTechIconsPainter(
                    animation: animationController.value,
                  ),
                  size: Size.infinite,
                );
              },
            ),
          // Content
          Center(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: isMobile ? 30 : 80),
              child:
                  isMobile
                      ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildProfileCircle(isMobile: true),
                          const SizedBox(height: 40),
                          _buildHeroContent(isMobile: true),
                        ],
                      )
                      : Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(child: _buildHeroContent(isMobile: false)),
                          const SizedBox(width: 60),
                          _buildProfileCircle(isMobile: false),
                        ],
                      ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCircle({required bool isMobile}) {
    return FadeInAnimated(
      child: Center(
        child: Container(
          width: isMobile ? 190 : 340,
          height: isMobile ? 190 : 340,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withValues(alpha: 0.98),
            image: DecorationImage(
              image: AssetImage(AssetConstants.profile),
              fit: BoxFit.scaleDown,
            ),
            border: Border.all(
              // color: AppColors.primary.withValues(alpha: 0.9),
              width: 5,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeroContent({required bool isMobile}) {
    return Column(
      crossAxisAlignment:
          isMobile ? CrossAxisAlignment.center : CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        AnimatedText(
          text: 'Hello, I\'m',
          fontSize: isMobile ? 20 : 28,
          color: Colors.white.withValues(alpha: 0.9),
          delay: 0,
        ),
        const SizedBox(height: 15),
        ShaderMask(
          shaderCallback:
              (bounds) => const LinearGradient(
                colors: [Colors.white, Colors.white70],
              ).createShader(bounds),
          child: AnimatedText(
            text: 'Navas Shareef',
            fontSize: isMobile ? 42 : 72,
            color: Colors.white,
            fontWeight: FontWeight.bold,
            delay: 200,
          ),
        ),
        const SizedBox(height: 25),
        AnimatedText(
          text:
              'Creating beautiful, performant cross-platform mobile and web applications with Flutter & Dart.',
          fontSize: isMobile ? 16 : 20,
          color: AppColors.light,
          delay: 400,
        ),
        const SizedBox(height: 50),
        Wrap(
          alignment: isMobile ? WrapAlignment.center : WrapAlignment.start,
          spacing: 20,
          runSpacing: 20,
          children: [
            GradientButton(
              label: 'View Projects',
              icon: Icons.arrow_forward,
              onTap: () => web_utils.openUrl('https://github.com', 'github'),
              delay: 600,
            ),
            OutlineBtn(
              label: 'Contact Me',
              icon: Icons.email,
              onTap: () => web_utils.openEmail('developer@example.com'),
              delay: 800,
            ),
          ],
        ),
      ],
    );
  }
}
