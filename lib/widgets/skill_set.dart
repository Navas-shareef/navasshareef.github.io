// Skills Section
import 'package:flutter/material.dart';
import 'package:shabio/core/colors.dart';

class SkillsSection extends StatelessWidget {
  const SkillsSection({super.key});

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
      decoration: BoxDecoration(color: Colors.black),
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
                    colors: [AppColors.secondary, AppColors.accent],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(width: 15),
              const Text(
                'Skills',
                style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: -1,
                ),
              ),
            ],
          ),
          const SizedBox(height: 60),
          SkillsTreeSection(),
        ],
      ),
    );
  }
}

class SkillsTreeSection extends StatelessWidget {
  const SkillsTreeSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 900;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        vertical: 120,
        horizontal: isMobile ? 24 : 200,
      ),
      decoration: const BoxDecoration(
        gradient: RadialGradient(
          center: Alignment.topCenter,
          radius: 1.2,
          colors: [Color(0xFF0E1A3A), Color(0xFF050914)],
        ),
      ),
      child: Column(
        children: [
          _CenterNode(title: "MY SKILLS"),
          const SizedBox(height: 80),
          _MobileSkills(),
          // isMobile
          //     ? _MobileSkills()
          //     : Row(
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: const [
          //         Expanded(child: _SkillColumnLeft()),
          //         SizedBox(width: 120),
          //         Expanded(child: _SkillColumnRight()),
          //       ],
          //     ),
        ],
      ),
    );
  }
}

/* ================= CENTER NODE ================= */

class _CenterNode extends StatelessWidget {
  final String title;
  const _CenterNode({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: Colors.blueAccent.withOpacity(0.6)),
        boxShadow: [
          BoxShadow(color: Colors.blueAccent.withOpacity(0.35), blurRadius: 25),
        ],
        color: const Color(0xFF050914),
      ),
      child: Text(
        title,
        style: const TextStyle(
          letterSpacing: 1.2,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
    );
  }
}

/* ================= LEFT COLUMN ================= */

class _SkillColumnLeft extends StatelessWidget {
  const _SkillColumnLeft();

  @override
  Widget build(BuildContext context) {
    return _SkillGroup(
      title: "Frontend",
      skills: const [
        "HTML",
        "CSS",
        "JavaScript",
        "React",
        "Next.js",
        "Flutter",
        "Tailwind CSS",
        "Framer Motion",
        "UI/UX Design",
        "Figma",
      ],
    );
  }
}

/* ================= RIGHT COLUMN ================= */

class _SkillColumnRight extends StatelessWidget {
  const _SkillColumnRight();

  @override
  Widget build(BuildContext context) {
    return _SkillGroup(
      title: "Backend",
      skills: const [
        "Node.js",
        "Express",
        "REST API",
        "Firebase",
        "JWT / OAuth",
        "SQL",
        "Postgres",
        "Prisma ORM",
        "Git & GitHub",
        "Linux",
      ],
    );
  }
}

/* ================= SKILL GROUP ================= */

class _SkillGroup extends StatelessWidget {
  final String title;
  final List<String> skills;

  const _SkillGroup({required this.title, required this.skills});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title.toUpperCase(),
          style: TextStyle(
            fontSize: 14,
            letterSpacing: 1.1,
            color: Colors.blueAccent.withOpacity(0.8),
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 20),
        Wrap(
          spacing: 12,
          runSpacing: 12,
          children: skills.map((s) => SkillChip(label: s)).toList(),
        ),
      ],
    );
  }
}

/* ================= SKILL CHIP ================= */

class SkillChip extends StatefulWidget {
  final String label;
  const SkillChip({super.key, required this.label});

  @override
  State<SkillChip> createState() => _SkillChipState();
}

class _SkillChipState extends State<SkillChip> {
  bool _hover = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _hover = true),
      onExit: (_) => setState(() => _hover = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color:
                _hover
                    ? Colors.cyanAccent
                    : Colors.blueAccent.withOpacity(0.35),
          ),
          color: const Color(0xFF081028),
          boxShadow:
              _hover
                  ? [
                    BoxShadow(
                      color: Colors.cyanAccent.withOpacity(0.35),
                      blurRadius: 14,
                    ),
                  ]
                  : [],
        ),
        child: Text(
          widget.label,
          style: const TextStyle(
            fontSize: 13,
            color: Colors.white,
            letterSpacing: 0.4,
          ),
        ),
      ),
    );
  }
}

/* ================= MOBILE FALLBACK ================= */

class _MobileSkills extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final allSkills = [
      "Flutter",
      "Dart",
      "Git Version Control",
      "C#",
      "Android Studio",
      "Xcode",
      "Jira",
      "SQL Server",
      "Clean Architecture",
      "Web API",
      "Firebase",
      "REST API",
      ".netCore",
      "HTML",
      "CSS",
      "Python",
      "Django",
      "SQL",
      "GitHub",
      "UI/UX",
    ];

    return Wrap(
      spacing: 12,
      runSpacing: 12,
      alignment: WrapAlignment.center,
      children: allSkills.map((e) => SkillChip(label: e)).toList(),
    );
  }
}
