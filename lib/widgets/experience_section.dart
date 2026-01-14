import 'package:flutter/material.dart';
import 'package:shabio/core/colors.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({super.key});

  @override
  Widget build(BuildContext context) {
    final experiences = [
      Experience(
        role: "Flutter Developer",
        company: "BranchX, Bangalore",
        period: "2025 – Nov 2025",
        description:
            "Building scalable Flutter apps, complex UI systems, platform channels, and performance optimization.",
      ),
      Experience(
        role: "Mobile Application Engineer",
        company: "Cinque Technologies, Cochin",
        period: "2022 – 2025",
        description:
            "Developed cross-platform apps, integrated REST APIs, Firebase, and delivered production apps.",
      ),
      Experience(
        role: "Software Engineer",
        company: "Hamon Technologies",
        period: "2021 – 2022",
        description:
            "Worked on mobile & backend fundamentals, databases, and clean architecture.",
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              Container(
                width: 5,
                height: 48,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [AppColors.primary, AppColors.accent],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(width: 16),
              const Text(
                "Experience",
                style: TextStyle(
                  fontSize: 44,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 80),

          // Timeline
          Stack(
            children: [
              Positioned(
                left: 00,
                top: 0,
                bottom: 0,
                child: Container(
                  width: 2,
                  color: AppColors.primary.withValues(alpha: 0.25),
                ),
              ),
              Column(
                children: experiences.map((e) => TimelineRow(exp: e)).toList(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

/* ===========================================================
   TIMELINE ROW (THIS IS THE KEY)
   =========================================================== */

class TimelineRow extends StatelessWidget {
  final Experience exp;

  const TimelineRow({super.key, required this.exp});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        // 🌿 CONNECTOR
        Container(
          margin: const EdgeInsets.only(top: 40, left: 2),
          width: 40,
          height: 2,
          decoration: BoxDecoration(color: AppColors.primary.withOpacity(0.18)),
        ),

        const SizedBox(width: 1),

        // 🧾 CARD
        ExperienceCard(exp: exp),
      ],
    );
  }
}

/* ===========================================================
   EXPERIENCE CARD
   =========================================================== */

class ExperienceCard extends StatelessWidget {
  final Experience exp;

  const ExperienceCard({super.key, required this.exp});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 520,
      margin: const EdgeInsets.only(bottom: 60),
      padding: const EdgeInsets.all(28),
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(color: AppColors.primary.withOpacity(0.25)),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.18),
            blurRadius: 40,
            offset: const Offset(0, 18),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            exp.role,
            style: const TextStyle(
              fontSize: 21,
              fontWeight: FontWeight.w700,
              color: Colors.white70,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            "${exp.company} • ${exp.period}",
            style: TextStyle(
              fontSize: 14,
              color: AppColors.primary.withOpacity(0.85),
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            exp.description,
            style: TextStyle(fontSize: 14, height: 1.7, color: Colors.white30),
          ),
        ],
      ),
    );
  }
}

class Experience {
  final String role;
  final String company;
  final String period;
  final String description;

  Experience({
    required this.role,
    required this.company,
    required this.period,
    required this.description,
  });
}
