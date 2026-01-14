import 'package:flutter/material.dart';
import 'package:shabio/core/colors.dart';

class AnimatedNavButton extends StatefulWidget {
  final String label;
  final VoidCallback onTap;

  const AnimatedNavButton({
    super.key,
    required this.label,
    required this.onTap,
  });

  @override
  State<AnimatedNavButton> createState() => AnimatedNavButtonState();
}

class AnimatedNavButtonState extends State<AnimatedNavButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: InkWell(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Text(
            widget.label,
            style: TextStyle(
              color:
                  _isHovered
                      ? AppColors.primary
                      : const Color.fromARGB(255, 255, 255, 255),
              fontWeight: _isHovered ? FontWeight.w600 : FontWeight.w500,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
