// Projects Section
import 'package:flutter/material.dart';
import 'package:shabio/core/asset_constants.dart';
import 'package:shabio/core/colors.dart';

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 768;

    final projects = [
      {
        'title': 'Torus',
        'description':
            """Torus is a feature-rich mobile application built using Flutter, designed to deliver a smooth, scalable, and high-performance user experience. The app focuses on clean UI, efficient state management, and seamless integration with backend services.

I was responsible for end-to-end development, including UI implementation, API integration, performance optimization, and handling platform-specific features using native Android (Kotlin) and iOS (Swift) via Flutter platform channels.

The application follows clean architecture principles, ensuring maintainable and scalable code. Special attention was given to app performance, error handling, and user experience, making the application reliable and production-ready.""",
        'tech': ['Flutter', 'Firebase', 'FlySdk', 'Mixpanel'],
        'gradient': [AppColors.primary, AppColors.secondary],
        'logo': AssetConstants.torus,
      },
      {
        'title': 'NEC Qatar',
        'description':
            """Torus is a feature-rich mobile application built using Flutter, designed to deliver a smooth, scalable, and high-performance user experience. The app focuses on clean UI, efficient state management, and seamless integration with backend services.

I was responsible for end-to-end development, including UI implementation, API integration, performance optimization, and handling platform-specific features using native Android (Kotlin) and iOS (Swift) via Flutter platform channels.

The application follows clean architecture principles, ensuring maintainable and scalable code. Special attention was given to app performance, error handling, and user experience, making the application reliable and production-ready. """,
        'tech': ['Flutter', 'Firebase', 'Cloud Firestore', '.net Core'],
        'gradient': [AppColors.primary, AppColors.secondary],
        'logo': AssetConstants.necqatar,
      },
      {
        'title': 'Wallstreet Kuwait',
        'description':
            'Beautiful weather application with location-based forecasts and detailed weather information.',
        'tech': ['Flutter', 'REST API', 'Location Services'],
        'gradient': [AppColors.primary, AppColors.secondary],
        'logo': AssetConstants.wallstreet,
      },
      {
        'title': 'Gulf Exchange Oman',
        'description':
            'Productivity app with task organization, reminders, and team collaboration features.',
        'tech': ['Flutter', 'SQLite', 'Local Notifications'],
        'gradient': [AppColors.primary, AppColors.secondary],
        'logo': AssetConstants.gulfexchange,
      },
      {
        'title': 'Shopki',
        'description':
            'Productivity app with task organization, reminders, and team collaboration features.',
        'tech': ['Flutter', 'SQLite', 'Local Notifications'],
        'gradient': [AppColors.primary, AppColors.secondary],
        'logo': AssetConstants.torus,
      },
      {
        'title': 'Genskill',
        'description':
            """Torus is a feature-rich mobile application built using Flutter, designed to deliver a smooth, scalable, and high-performance user experience. The app focuses on clean UI, efficient state management, and seamless integration with backend services.

I was responsible for end-to-end development, including UI implementation, API integration, performance optimization, and handling platform-specific features using native Android (Kotlin) and iOS (Swift) via Flutter platform channels.

The application follows clean architecture principles, ensuring maintainable and scalable code. Special attention was given to app performance, error handling, and user experience, making the application reliable and production-ready. """,
        'tech': ['Flutter', 'SQLite', 'Local Notifications'],
        'gradient': [AppColors.primary, AppColors.secondary],
        'logo': AssetConstants.genskill,
      },
    ];

    return Container(
      width: double.infinity,

      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 30 : 80,
        vertical: 120,
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
                    colors: [AppColors.accent, AppColors.primary],
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              const SizedBox(width: 15),
              const Text(
                'Featured Projects',
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
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 1 : 3,
              crossAxisSpacing: 30,
              mainAxisSpacing: 30,
              childAspectRatio: isMobile ? 1.1 : 0.95,
            ),
            itemCount: projects.length,
            itemBuilder: (context, index) {
              final project = projects[index];
              return _ModernProjectCard(
                title: project['title'] as String,
                description: project['description'] as String,
                tech: project['tech'] as List<String>,
                gradient: project['gradient'] as List<Color>,
                logo: project['logo'] as String?,
              );
            },
          ),
        ],
      ),
    );
  }
}

class _ModernProjectCard extends StatefulWidget {
  final String title;
  final String description;
  final List<String> tech;
  final List<Color> gradient;
  final String? logo;

  const _ModernProjectCard({
    required this.title,
    required this.description,
    required this.tech,
    required this.gradient,
    this.logo,
  });

  @override
  State<_ModernProjectCard> createState() => _ModernProjectCardState();
}

class _ModernProjectCardState extends State<_ModernProjectCard>
    with SingleTickerProviderStateMixin {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeOutCubic,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          border: Border.all(color: AppColors.primary.withOpacity(0.25)),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.18),
              blurRadius: 40,
              offset: const Offset(0, 18),
            ),
          ],
          // boxShadow:
          //     _isHovered
          //         ? [
          //           BoxShadow(
          //             color: widget.gradient[0].withValues(alpha: 0.4),
          //             blurRadius: 30,
          //             offset: const Offset(0, 15),
          //           ),
          //         ]
          //         : [
          //           BoxShadow(
          //             color: Colors.black.withValues(alpha: 0.08),
          //             blurRadius: 20,
          //             offset: const Offset(0, 10),
          //           ),
          //         ],
        ),
        transform:
            Matrix4.identity()
              ..scale(_isHovered ? 1.03 : 1.0)
              ..translate(0.0, _isHovered ? -10.0 : 0.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25),
            color: Colors.black,
            border: Border.all(color: AppColors.primary.withOpacity(0.25)),
            //  border: Border.all(color: AppColors.primary.withOpacity(0.25)),
            boxShadow: [
              BoxShadow(
                color: AppColors.primary.withOpacity(0.18),
                blurRadius: 5,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 180,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  color: AppColors.primary.withOpacity(0.25),
                  border: Border.all(
                    color: AppColors.primary.withOpacity(0.25),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primary.withOpacity(0.18),
                      blurRadius: 5,
                      offset: const Offset(0, 0),
                    ),
                  ],
                  image:
                      widget.logo != null
                          ? DecorationImage(
                            image: AssetImage(widget.logo!),
                            fit: BoxFit.fitWidth,
                          )
                          : null,
                ),
                child: Stack(
                  children: [
                    // Positioned.fill(
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //       gradient: LinearGradient(
                    //         begin: Alignment.topLeft,
                    //         end: Alignment.bottomRight,
                    //         colors: [
                    //           widget.gradient[0].withValues(alpha: 0.8),
                    //           widget.gradient[1].withValues(alpha: 0.8),
                    //         ],
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Center(
                    //   child: AnimatedScale(
                    //     scale: _isHovered ? 1.2 : 1.0,
                    //     duration: const Duration(milliseconds: 400),
                    //     child: const Icon(
                    //       Icons.phone_android,
                    //       size: 80,
                    //       color: Colors.white,
                    //     ),
                    //   ),
                    // ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 15),
                    Text(
                      widget.description,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey.shade700,
                        height: 1.6,
                      ),
                    ),

                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children:
                            widget.tech.map((t) {
                              return Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 15,
                                  vertical: 8,
                                ),
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    colors: widget.gradient,
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Text(
                                  t,
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              );
                            }).toList(),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
