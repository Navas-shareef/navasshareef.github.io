import 'package:flutter/material.dart';
import 'package:shabio/core/colors.dart';
import 'package:shabio/widgets/about_section.dart';
import 'package:shabio/widgets/animated_cursor.dart';
import 'package:shabio/widgets/contact_section.dart';
import 'package:shabio/widgets/experience_section.dart';
import 'package:shabio/widgets/fade_animated_widget.dart';
import 'package:shabio/widgets/footer.dart';
import 'package:shabio/widgets/profile_section.dart';
import 'package:shabio/widgets/project_section.dart';
import 'package:shabio/widgets/sectiontitle.dart';
import 'package:shabio/widgets/skill_set.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Developer Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true, fontFamily: 'Inter'),
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({super.key});

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome>
    with SingleTickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _skillsKey = GlobalKey();
  final GlobalKey _projectsKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  late AnimationController _animationController;
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    )..repeat(reverse: true);

    _scrollController.addListener(() {
      setState(() {
        _isScrolled =
            _homeKey.currentContext!.size!.height < _scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 1000),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    return SplashCursor(
      child: Scaffold(
        backgroundColor: Colors.black,
        extendBodyBehindAppBar: true,
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 90),
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: EdgeInsets.symmetric(
              horizontal: isMobile ? 20 : 60,
              vertical: isMobile ? 0 : 10,
            ),
            decoration: BoxDecoration(
              color: _isScrolled ? Colors.black : Colors.transparent,
              boxShadow:
                  _isScrolled
                      ? [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 20,
                          offset: const Offset(0, 5),
                        ),
                      ]
                      : null,
            ),
            child: SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [AppColors.primary, AppColors.secondary],
                          ),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.primary.withValues(alpha: 0.3),
                              blurRadius: 15,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: const Text(
                          'NS',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      if (!isMobile) ...[
                        const SizedBox(width: 15),
                        const Text(
                          'Flutter Developer',
                          style: TextStyle(
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ],
                  ),
                  if (isMobile)
                    IconButton(
                      icon: const Icon(Icons.menu, color: AppColors.dark),
                      onPressed: () => _showMobileMenu(context),
                    )
                  else
                    Row(
                      children: [
                        AnimatedNavButton(
                          label: 'Home',
                          onTap: () => _scrollToSection(_homeKey),
                        ),
                        AnimatedNavButton(
                          label: 'About',
                          onTap: () => _scrollToSection(_aboutKey),
                        ),
                        AnimatedNavButton(
                          label: 'Skills',
                          onTap: () => _scrollToSection(_skillsKey),
                        ),
                        AnimatedNavButton(
                          label: 'Projects',
                          onTap: () => _scrollToSection(_projectsKey),
                        ),
                        AnimatedNavButton(
                          label: 'Contact',
                          onTap: () => _scrollToSection(_contactKey),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        ),
        body: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              HeroSection(
                key: _homeKey,
                animationController: _animationController,
              ),
              FadeInSection(key: _aboutKey, child: const AboutSection()),
              FadeInSection(child: const ExperienceSection()),
              FadeInSection(key: _skillsKey, child: const SkillsSection()),
              FadeInSection(key: _projectsKey, child: const ProjectsSection()),
              FadeInSection(key: _contactKey, child: const ContactSection()),
              const FooterSection(),
            ],
          ),
        ),
      ),
    );
  }

  void _showMobileMenu(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      builder:
          (context) => Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
            ),
            padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _MobileMenuItem(
                  label: 'Home',
                  onTap: () {
                    Navigator.pop(context);
                    _scrollToSection(_homeKey);
                  },
                ),
                _MobileMenuItem(
                  label: 'About',
                  onTap: () {
                    Navigator.pop(context);
                    _scrollToSection(_aboutKey);
                  },
                ),
                _MobileMenuItem(
                  label: 'Skills',
                  onTap: () {
                    Navigator.pop(context);
                    _scrollToSection(_skillsKey);
                  },
                ),
                _MobileMenuItem(
                  label: 'Projects',
                  onTap: () {
                    Navigator.pop(context);
                    _scrollToSection(_projectsKey);
                  },
                ),
                _MobileMenuItem(
                  label: 'Contact',
                  onTap: () {
                    Navigator.pop(context);
                    _scrollToSection(_contactKey);
                  },
                ),
              ],
            ),
          ),
    );
  }
}

class _MobileMenuItem extends StatelessWidget {
  final String label;
  final VoidCallback onTap;

  const _MobileMenuItem({required this.label, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        label,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: AppColors.dark,
        ),
      ),
      onTap: onTap,
    );
  }
}
