import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:shabio/core/colors.dart';

class SplashCursor extends StatefulWidget {
  final Widget child;
  final bool isMobileDevice;
  const SplashCursor({
    super.key,
    required this.child,
    required this.isMobileDevice,
  });

  @override
  State<SplashCursor> createState() => _SplashCursorState();
}

class _SplashCursorState extends State<SplashCursor>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  Offset _cursor = Offset.zero;
  Offset _target = Offset.zero;
  double _speed = 0;

  final List<_Splash> _splashes = [];

  @override
  void initState() {
    super.initState();
    if (widget.isMobileDevice) return;
    _controller =
        AnimationController(
            vsync: this,
            duration: const Duration(milliseconds: 16),
          )
          ..addListener(_tick)
          ..repeat();
  }

  void _tick() {
    setState(() {
      _cursor = Offset.lerp(_cursor, _target, 0.22)!;
      _speed = (_cursor - _target).distance;

      for (final s in _splashes) {
        s.life += 0.025;
      }
      _splashes.removeWhere((s) => s.life >= 1);
    });
  }

  void _spawnSplash(Offset p, {bool burst = false}) {
    final count = burst ? 3 : 1;
    for (int i = 0; i < count; i++) {
      _splashes.add(
        _Splash(
          position: p,
          life: 0,
          seed: Random().nextDouble() * pi * 2,
          strength: burst ? 1.6 : 1.0,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.isMobileDevice
        ? widget.child
        : Listener(
          behavior: HitTestBehavior.translucent, // 🔥 REQUIRED
          onPointerDown: (_) => _spawnSplash(_cursor, burst: true),
          child: MouseRegion(
            cursor: SystemMouseCursors.none,
            onHover: (e) {
              _target = e.position;
              _spawnSplash(_target);
            },
            child: Stack(
              children: [
                widget.child,
                IgnorePointer(
                  child: CustomPaint(
                    size: MediaQuery.of(context).size,
                    painter: _LiquidPainter(
                      cursor: _cursor,
                      speed: _speed,
                      splashes: _splashes,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

/* ================= DATA ================= */

class _Splash {
  Offset position;
  double life;
  double seed;
  double strength;

  _Splash({
    required this.position,
    required this.life,
    required this.seed,
    required this.strength,
  });
}

/* ================= PAINTER ================= */

class _LiquidPainter extends CustomPainter {
  final Offset cursor;
  final double speed;
  final List<_Splash> splashes;

  _LiquidPainter({
    required this.cursor,
    required this.speed,
    required this.splashes,
  });

  @override
  void paint(Canvas canvas, Size size) {
    _drawCursorBlob(canvas);
    for (final s in splashes) {
      _drawSplash(canvas, s);
    }
  }

  /* 🔵 MAIN CURSOR */
  /* 🟢 SIMPLE POINTER DOT */
  void _drawCursorBlob(Canvas canvas) {
    final double radius = 4 + speed * 0.05;

    final paint =
        Paint()
          ..color = Colors.white
          ..style = PaintingStyle.fill;

    // Soft shadow
    final shadowPaint =
        Paint()
          ..color = Colors.black.withOpacity(0.25)
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);

    // Shadow
    canvas.drawCircle(cursor.translate(0, 1.5), radius + 1, shadowPaint);

    // Dot
    canvas.drawCircle(cursor, radius, paint);
  }

  /* 💥 SPLASH RINGS */
  void _drawSplash(Canvas canvas, _Splash s) {
    final p = s.life;
    final radius = lerpDouble(22, 140 * s.strength, p)!;

    final paint =
        Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = lerpDouble(4.5, 1.2, p)!
          ..shader = SweepGradient(
            colors: const [AppColors.primary, AppColors.secondary],
            transform: GradientRotation(p * pi * 2),
          ).createShader(Rect.fromCircle(center: s.position, radius: radius))
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8)
          ..color = Colors.white.withOpacity(1 - p);

    canvas.drawPath(_liquidPath(s.position, radius, s.seed + p * 4), paint);
  }

  /* 🌊 LIQUID SHAPE */
  Path _liquidPath(Offset center, double radius, double time) {
    const int points = 48;
    final path = Path();

    for (int i = 0; i <= points; i++) {
      final a = (i / points) * pi * 2;
      final wave = sin(a * 3 + time * 4) * 3.5 + sin(a * 6 - time * 2) * 2.2;

      final r = radius + wave;
      final x = center.dx + cos(a) * r;
      final y = center.dy + sin(a) * r;

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    path.close();
    return path;
  }

  @override
  bool shouldRepaint(_) => true;
}
