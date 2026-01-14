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
            "Building scalable Flutter applications, crafting complex UI systems, implementing native platform channels, and optimizing performance for production use.",
      ),
      Experience(
        role: "Mobile Application Engineer",
        company: "Cinque Technologies, Cochin",
        period: "2022 – 2025",
        description:
            "Developed cross-platform mobile applications, integrated REST APIs and Firebase services, and delivered stable production-ready apps.",
      ),
      Experience(
        role: "Software Engineer",
        company: "Hamon Technologies",
        period: "2021 – 2022",
        description:
            "Worked on mobile and backend fundamentals, database design, APIs, and followed clean architecture principles.",
      ),
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 80, vertical: 120),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// HEADER
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
          const SizedBox(height: 90),

          /// TIMELINE
          Stack(
            children: [
              Positioned(
                left: 14,
                top: 0,
                bottom: 0,
                child: Container(
                  width: 2,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        AppColors.primary.withOpacity(0.05),
                        AppColors.primary.withOpacity(0.35),
                        AppColors.primary.withOpacity(0.05),
                      ],
                    ),
                  ),
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
   TIMELINE ROW
   =========================================================== */

class TimelineRow extends StatelessWidget {
  final Experience exp;

  const TimelineRow({super.key, required this.exp});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 70),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// TIMELINE DOT
          Container(
            width: 30,
            margin: const EdgeInsets.only(top: 28),
            alignment: Alignment.center,
            child: Container(
              width: 12,
              height: 12,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.primary,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.6),
                    blurRadius: 16,
                  ),
                ],
              ),
            ),
          ),

          /// CARD
          Expanded(child: ExperienceCard(exp: exp)),
        ],
      ),
    );
  }
}

/* ===========================================================
   EXPERIENCE CARD (REFINED)
   =========================================================== */

class ExperienceCard extends StatelessWidget {
  final Experience exp;

  const ExperienceCard({super.key, required this.exp});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      decoration: BoxDecoration(
        color: const Color(0xFF0F141F),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primary.withOpacity(0.18)),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.12),
            blurRadius: 32,
            offset: const Offset(0, 16),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// ROLE
          Text(
            exp.role,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 6),

          /// COMPANY + PERIOD
          Text(
            "${exp.company} • ${exp.period}",
            style: TextStyle(
              fontSize: 14,
              color: AppColors.primary.withOpacity(0.9),
              fontWeight: FontWeight.w500,
            ),
          ),

          const SizedBox(height: 18),

          /// DESCRIPTION
          Text(
            exp.description,
            style: const TextStyle(
              fontSize: 14.5,
              height: 1.8,
              color: Colors.white60,
            ),
          ),
        ],
      ),
    );
  }
}

/* ===========================================================
   MODEL
   =========================================================== */

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
