import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'dart:math' as math;

// Beautiful Animated Background with Tech Icons
class AnimatedTechIconsPainter extends CustomPainter {
  final double animation;

  AnimatedTechIconsPainter({required this.animation});

  @override
  void paint(Canvas canvas, Size size) {
    // Create floating tech icons with varied movements
    final techIcons = [
      {
        'type': 'flutter',
        'baseX': size.width * 0.15,
        'baseY': size.height * 0.2,
        'speedX': 0.3,
        'speedY': 0.4,
        'phaseX': 0.0,
        'phaseY': 0.0,
        'amplitudeX': 200,
        'amplitudeY': 200,
        'size': 60.0,
        'color': const Color(0xFF54C5F8),
        'alpha': 0.30,
        'rotation': 0.2,
      },
      {
        'type': 'swift',
        'baseX': size.width * 0.85,
        'baseY': size.height * 0.15,
        'speedX': 0.65,
        'speedY': 0.5,
        'phaseX': 2.5,
        'phaseY': 1.8,
        'amplitudeX': 70,
        'amplitudeY': 55,
        'size': 65.0,
        'color': const Color(0xFFF05032),
        'alpha': 0.25,
        'rotation': -0.15,
      },
      {
        'type': 'github',
        'baseX': size.width * .3,
        'baseY': size.height * 0.5,
        'speedX': 0.55,
        'speedY': 0.55,
        'phaseX': 4.2,
        'phaseY': 4.8,
        'amplitudeX': 85,
        'amplitudeY': 90,
        'size': 60.0,
        'color': const Color.fromARGB(255, 242, 239, 239),
        'alpha': 0.5,
        'rotation': 0.25,
      },
      {
        'type': 'dart',
        'baseX': size.width * 0.5,
        'baseY': size.height * 0.9,
        'speedX': 0.75,
        'speedY': 0.1,
        'phaseX': 1.2,
        'phaseY': 3.5,
        'amplitudeX': 90,
        'amplitudeY': 300,
        'size': 60.0,
        'color': const ui.Color.fromARGB(255, 164, 195, 226),
        'alpha': 0.20,
        'rotation': 0,
      },
      {
        'type': 'firebase',
        'baseX': size.width * 0.10,
        'baseY': size.height * 0.35,
        'speedX': 0.45,
        'speedY': 0.7,
        'phaseX': 5.8,
        'phaseY': 2.8,
        'amplitudeX': 55,
        'amplitudeY': 80,
        'size': 15.0,
        'color': const ui.Color.fromARGB(255, 198, 133, 12),
        'alpha': 0.2,
        'rotation': 0.18,
      },
      {
        'type': 'cloud',
        'baseX': size.width * 0.78,
        'baseY': size.height * 0.45,
        'speedX': 0.38,
        'speedY': 0.38,
        'phaseX': 3.8,
        'phaseY': 6.5,
        'amplitudeX': 50,
        'amplitudeY': 50,
        'size': 60.0,
        'color': const Color(0xFF4285F4),
        'alpha': 0.28,
        'rotation': 0.5,
      },
      {
        'type': 'html',
        'baseX': size.width * 0.6,
        'baseY': size.height * 0.1,
        'speedX': 0.25,
        'speedY': 0.9,
        'phaseX': 2.0,
        'phaseY': 0.9,
        'amplitudeX': 40,
        'amplitudeY': 100,
        'size': 60.0,
        'color': const ui.Color.fromARGB(255, 212, 234, 235),
        'alpha': 0.10,
        'rotation': -0.5,
      },
      // {
      //   'type': 'firebase',
      //   'baseX': size.width * 0.55,
      //   'baseY': size.height * 0.38,
      //   'speedX': 0.32,
      //   'speedY': 0.45,
      //   'phaseX': 1.5,
      //   'phaseY': 2.2,
      //   'amplitudeX': 45,
      //   'amplitudeY': 40,
      //   'size': 55.0,
      //   'color': const Color(0xFFFFA726),
      //   'alpha': 0.29,
      //   'rotation': -0.2,
      // },
      {
        'type': 'kotlin',
        'baseX': size.width * 0.70,
        'baseY': size.height * 0.50,
        'speedX': 0.4,
        'speedY': 0.6,
        'phaseX': 3.2,
        'phaseY': 1.4,
        'amplitudeX': 300,
        'amplitudeY': 80,
        'size': 70.0,
        'color': const ui.Color.fromARGB(255, 243, 240, 37), // Kotlin purple
        'alpha': 0.20,
        'rotation': 0.15,
      },
      // {
      //   'type': 'swift',
      //   'baseX': size.width * 0.7,
      //   'baseY': size.height * 0.65,
      //   'speedX': 0.5,
      //   'speedY': 0.4,
      //   'phaseX': 4.6,
      //   'phaseY': 2.3,
      //   'amplitudeX': 65,
      //   'amplitudeY': 55,
      //   'size': 72.0,
      //   'color': const Color(0xFFFF6A00), // Swift orange
      //   'alpha': 0.33,
      //   'rotation': -0.18,
      // },
    ];

    // Draw subtle connecting lines
    //_drawConnectingLines(canvas, size, techIcons);

    // Draw each tech icon
    for (final icon in techIcons) {
      _drawTechIcon(canvas, icon, size);
    }
  }

  void _drawTechIcon(Canvas canvas, Map<String, dynamic> iconData, Size size) {
    final easedAnimation = _easeInOutSine(animation % 1.0);

    final baseX = (iconData['baseX'] as num).toDouble();
    final baseY = (iconData['baseY'] as num).toDouble();
    final speedX = (iconData['speedX'] as num).toDouble();
    final speedY = (iconData['speedY'] as num).toDouble();
    final phaseX = (iconData['phaseX'] as num).toDouble();
    final phaseY = (iconData['phaseY'] as num).toDouble();
    final amplitudeX = (iconData['amplitudeX'] as num).toDouble();
    final amplitudeY = (iconData['amplitudeY'] as num).toDouble();
    final iconSize = (iconData['size'] as num).toDouble();
    final alpha = (iconData['alpha'] as num).toDouble();
    final baseRotation = (iconData['rotation'] as num).toDouble();
    final color = iconData['color'] as Color;

    // Calculate animated position
    final offsetX =
        baseX +
        math.sin(easedAnimation * speedX * 2 * math.pi + phaseX) * amplitudeX;
    final offsetY =
        baseY +
        math.cos(easedAnimation * speedY * 2 * math.pi + phaseY) * amplitudeY;

    // Rotating animation
    final rotation = baseRotation + easedAnimation * 0.3;

    // Pulsing size
    final sizeMultiplier =
        0.85 + 0.15 * math.sin(easedAnimation * 1.2 * math.pi + phaseX);
    final currentSize = iconSize * sizeMultiplier;

    final center = Offset(offsetX, offsetY);

    // Draw glow/halo behind icon
    final glowPaint =
        Paint()
          ..color = color.withValues(alpha: alpha * 0.4)
          ..maskFilter = MaskFilter.blur(BlurStyle.normal, 20);

    canvas.drawCircle(center, currentSize * 1.2, glowPaint);

    // Save canvas state for rotation
    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(rotation);

    // Draw the actual icon based on type
    final iconType = iconData['type'] as String;
    final iconPaint =
        Paint()
          ..color = color.withValues(alpha: alpha)
          ..style = PaintingStyle.fill;

    _drawIconShape(canvas, iconType, currentSize, iconPaint);

    canvas.restore();
  }

  void _drawIconShape(Canvas canvas, String type, double size, Paint paint) {
    switch (type) {
      case 'flutter':
        _drawFlutterLogo(canvas, size, paint);
        break;
      case 'swift':
        _drawSwiftIcon(canvas, size, paint);
        break;
      case 'github':
        _drawGitHubIcon(canvas, size, paint);
        break;
      case 'dart':
        _drawDartIcon(canvas, size, paint);
        break;
      case 'android':
        _drawAndroidIcon(canvas, size, paint);
        break;
      case 'cloud':
        _drawCloudIcon(canvas, size, paint);
        break;
      case 'html':
        _drawHtmlIcon(canvas, size, paint);
        break;
      case 'firebase':
        _drawFirebaseIcon(canvas, size, paint);
        break;
      case 'kotlin':
        _drawKotlinIcon(canvas, size, paint);
        break;
      // case 'swift':
      //   _drawSwiftIcon(canvas, size, paint);
      //   break;

      default:
        canvas.drawCircle(Offset.zero, size / 2, paint);
    }
  }

  // Kotlin Icon (diagonal blocks)
  void _drawKotlinIcon(Canvas canvas, double size, Paint paint) {
    final double s = size / 2;

    // ===============================
    // 1️⃣ TOP SMALL TRIANGLE
    // ===============================
    final topTriangle =
        Path()
          ..moveTo(-s, -s)
          ..lineTo(0, -s)
          ..lineTo(-s, 0)
          ..close();

    paint.shader = const LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.center,
      colors: [
        Color(0xFF7F52FF), // purple
        Color(0xFF4C7BD9), // blue
      ],
    ).createShader(Rect.fromLTWH(-s, -s, s, s));

    canvas.drawPath(topTriangle, paint);

    // ===============================
    // 2️⃣ MIDDLE DIAGONAL SQUARE
    // ===============================
    final middle =
        Path()
          ..moveTo(-s, 0)
          ..lineTo(0, -s)
          ..lineTo(s, -s)
          ..lineTo(-s, s)
          ..close();

    paint.shader = const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF7F52FF), // purple
        Color(0xFFFF9800), // orange
      ],
    ).createShader(Rect.fromLTWH(-s, -s, s, s));

    canvas.drawPath(middle, paint);

    // ===============================
    // 3️⃣ BOTTOM BIG TRIANGLE
    // ===============================
    final bottomTriangle =
        Path()
          ..moveTo(-s, s)
          ..lineTo(0, 0)
          ..lineTo(s, s)
          ..close();

    paint.shader = const LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.center,
      colors: [
        Color(0xFF7F52FF), // purple
        Color(0xFF4C7BD9), // blue
      ],
    ).createShader(Rect.fromLTWH(-s, 0, size, s));

    canvas.drawPath(bottomTriangle, paint);

    // Clear shader
    paint.shader = null;
  }

  void _drawFlutterLogo(Canvas canvas, double size, Paint paint) {
    canvas.translate(-size / 2, -size / 2);

    const double viewBox = 316.0;
    double n(double v) => (v / viewBox) * size;

    final path0 =
        Path()
          ..moveTo(n(157.66), n(0))
          ..lineTo(n(0), n(157.66))
          ..lineTo(n(48.8), n(206.46))
          ..lineTo(n(255.26), n(0))
          ..close();

    canvas.drawPath(path0, paint);

    final path1 =
        Path()
          ..moveTo(n(156.56), n(145.39))
          ..lineTo(n(72.14), n(229.81))
          ..lineTo(n(121.13), n(279.53))
          ..lineTo(n(169.84), n(230.82))
          ..lineTo(n(255.26), n(145.39))
          ..close();

    canvas.drawPath(path1, paint);

    paint.color = const Color(0xff00569E).withOpacity(0.35);

    final path2 =
        Path()
          ..moveTo(n(121.13), n(279.53))
          ..lineTo(n(158.21), n(316.61))
          ..lineTo(n(255.26), n(316.61))
          ..lineTo(n(169.84), n(230.82))
          ..close();

    canvas.drawPath(path2, paint);
  }

  // Swift Icon (branch shape)
  void _drawSwiftIcon(Canvas canvas, double size, Paint paint) {
    // 🔹 Scale factor (adjust if needed)
    final double scale = size / 30;

    // Center the icon
    canvas.translate(-size / 2, -size / 2);

    canvas.scale(scale, scale);
    // 🔹 BACKGROUND DEPTH LAYER (this is the key)

    canvas.saveLayer(
      Rect.fromLTWH(-1000, -1000, 2000, 2000),
      Paint()..color = Colors.white.withOpacity(0.2),
    );

    // 🔹 Soft paint helper (NO SHAPE CHANGE)
    Paint soft(Color c) =>
        Paint()
          ..style = PaintingStyle.fill
          ..color = c.withOpacity(0.1) // reduce brightness
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);

    Path path_0 = Path();
    path_0.moveTo(19.422, 4.007);
    path_0.cubicTo(
      19.422,
      4.007,
      25.639,
      7.561,
      27.266000000000002,
      13.206999999999999,
    );
    path_0.cubicTo(
      28.732000000000003,
      18.307,
      27.558000000000003,
      20.741,
      27.558000000000003,
      20.741,
    );
    path_0.arcToPoint(
      Offset(29.300000000000004, 23.541),
      radius: Radius.elliptical(8.915, 8.915),
      rotation: 0,
      largeArc: false,
      clockwise: true,
    );
    path_0.arcToPoint(
      Offset(29.590000000000003, 27.994),
      radius: Radius.elliptical(4.825, 4.825),
      rotation: 0,
      largeArc: false,
      clockwise: true,
    );
    path_0.cubicTo(
      29.590000000000003,
      27.994,
      29.490000000000002,
      25.914,
      26.390000000000004,
      25.483,
    );
    path_0.cubicTo(
      23.549000000000003,
      25.083000000000002,
      22.516000000000005,
      27.849,
      17.090000000000003,
      27.715,
    );
    path_0.arcToPoint(
      Offset(2, 19.354),
      radius: Radius.elliptical(18.435, 18.435),
      rotation: 0,
      largeArc: false,
      clockwise: true,
    );
    path_0.cubicTo(4.651, 20.8, 8.124, 23.045, 12.449, 22.7);
    path_0.cubicTo(16.774, 22.354999999999997, 17.677, 21.026, 17.677, 21.026);
    path_0.arcToPoint(
      Offset(4.891, 7.643),
      radius: Radius.elliptical(66.9, 66.9),
      rotation: 0,
      largeArc: false,
      clockwise: true,
    );
    path_0.cubicTo(8.291, 10.488, 16.713, 16.15, 16.517, 16.006);
    path_0.arcToPoint(
      Offset(8.092, 6.24),
      radius: Radius.elliptical(75.826, 75.826),
      rotation: 0,
      largeArc: false,
      clockwise: true,
    );
    path_0.cubicTo(8.092, 6.24, 20.728, 16.629, 21.745, 16.563);
    path_0.cubicTo(
      22.163,
      15.701999999999998,
      24.324,
      11.245,
      19.421,
      4.0059999999999985,
    );
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.shader = ui.Gradient.linear(
      Offset(size * -420.2937, size * -536.9375),
      Offset(size * -420.3031, size * -537.1563),
      [Color(0xfff88535).withOpacity(1), Color(0xfffd2221).withOpacity(1)],
      [0, 1],
    );
    canvas.drawPath(path_0, paint_0_fill);
    canvas.restore();
  }

  // GitHub Icon (octocat simplified)
  void _drawGitHubIcon(Canvas canvas, double size, Paint paint) {
    canvas.save();
    // 🔹 Scale factor (adjust if needed)
    final double scale = size * 0.05;

    // Center the icon
    canvas.translate(-size / 2, -size / 2);

    canvas.scale(scale, scale);
    Path path_0 = Path();
    path_0.moveTo(20.9992, 5.95846);
    path_0.cubicTo(21.0087, 6.565, 20.9333, 7.32649, 20.8658, 7.8807);
    path_0.cubicTo(20.8395, 8.09686, 20.8037, 8.27676, 20.7653, 8.42453);
    path_0.cubicTo(21.6227, 10.01, 22, 11.9174, 22, 14);
    path_0.cubicTo(22, 16.4684, 20.8127, 18.501, 18.9638, 19.8871);
    path_0.cubicTo(17.1319, 21.2605, 14.6606, 22, 12, 22);
    path_0.cubicTo(9.33939, 22, 6.86809, 21.2605, 5.0362, 19.8871);
    path_0.cubicTo(3.18727, 18.501, 2, 16.4684, 2, 14);
    path_0.cubicTo(2, 11.9174, 2.37732, 10.01, 3.23472, 8.42452);
    path_0.cubicTo(3.19631, 8.27676, 3.16055, 8.09685, 3.13422, 7.8807);
    path_0.cubicTo(3.06673, 7.32649, 2.99133, 6.565, 3.00081, 5.95846);
    path_0.cubicTo(3.01149, 5.27506, 3.10082, 4.5917, 3.19988, 3.91379);
    path_0.cubicTo(3.24569, 3.60028, 3.31843, 3.30547, 3.65883, 3.11917);
    path_0.cubicTo(4.00655, 2.92886, 4.37274, 2.99981, 4.73398, 3.1021);
    path_0.cubicTo(5.95247, 3.44713, 7.09487, 3.93108, 8.16803, 4.51287);
    path_0.cubicTo(9.2995, 4.17287, 10.5783, 4, 12, 4);
    path_0.cubicTo(13.4217, 4, 14.7005, 4.17287, 15.832, 4.51287);
    path_0.cubicTo(16.9051, 3.93108, 18.0475, 3.44713, 19.266, 3.1021);
    path_0.cubicTo(19.6273, 2.99981, 19.9935, 2.92886, 20.3412, 3.11917);
    path_0.cubicTo(20.6816, 3.30547, 20.7543, 3.60028, 20.8001, 3.91379);
    path_0.cubicTo(20.8992, 4.5917, 20.9885, 5.27506, 20.9992, 5.95846);
    path_0.close();
    path_0.moveTo(20, 14);
    path_0.cubicTo(20, 12.3128, 19.6122, 10, 17.5, 10);
    path_0.cubicTo(16.5478, 10, 15.6474, 10.2502, 14.7474, 10.5004);
    path_0.cubicTo(13.8482, 10.7502, 12.9495, 11, 12, 11);
    path_0.cubicTo(11.0505, 11, 10.1518, 10.7502, 9.25263, 10.5004);
    path_0.cubicTo(8.35261, 10.2502, 7.45216, 10, 6.5, 10);
    path_0.cubicTo(4.39379, 10, 4, 12.3197, 4, 14);
    path_0.cubicTo(4, 15.7636, 4.82745, 17.231, 6.23588, 18.2869);
    path_0.cubicTo(7.66135, 19.3556, 9.69005, 20, 12, 20);
    path_0.cubicTo(14.3099, 20, 16.3386, 19.3555, 17.7641, 18.2869);
    path_0.cubicTo(19.1726, 17.231, 20, 15.7636, 20, 14);
    path_0.close();
    path_0.moveTo(10, 14.5);
    path_0.cubicTo(10, 15.8807, 9.32843, 17, 8.5, 17);
    path_0.cubicTo(7.67157, 17, 7, 15.8807, 7, 14.5);
    path_0.cubicTo(7, 13.1193, 7.67157, 12, 8.5, 12);
    path_0.cubicTo(9.32843, 12, 10, 13.1193, 10, 14.5);
    path_0.close();
    path_0.moveTo(15.5, 17);
    path_0.cubicTo(16.3284, 17, 17, 15.8807, 17, 14.5);
    path_0.cubicTo(17, 13.1193, 16.3284, 12, 15.5, 12);
    path_0.cubicTo(14.6716, 12, 14, 13.1193, 14, 14.5);
    path_0.cubicTo(14, 15.8807, 14.6716, 17, 15.5, 17);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);
    canvas.restore();
  }

  // Dart Icon (angle brackets)
  void _drawDartIcon(Canvas canvas, double size, Paint paint) {
    //canvas.save();

    // Original scale logic (unchanged)
    final double scale = 0.2;

    // Original centering logic (unchanged)
    canvas.translate(-size / 2, -size / 2);
    canvas.scale(scale, scale);
    // 🔹 BACKGROUND DEPTH LAYER (this is the key)
    canvas.saveLayer(
      Rect.fromLTWH(-1000, -1000, 2000, 2000),
      Paint()..color = Colors.white.withOpacity(0.2),
    );

    // 🔹 Soft paint helper (NO SHAPE CHANGE)
    Paint soft(Color c) =>
        Paint()
          ..style = PaintingStyle.fill
          ..color = c.withOpacity(0.1) // reduce brightness
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);

    Path path_0 = Path();
    path_0.moveTo(70.534, 69.696);
    path_0.lineTo(53.988, 53.15);
    path_0.lineTo(54.058, 172.75);
    path_0.lineTo(54.256, 178.34);
    path_0.cubicTo(54.338, 180.97, 54.826, 183.938, 55.64, 187.014);
    path_0.lineTo(186.744, 233.244);
    path_0.lineTo(219.516, 218.724);
    path_0.lineTo(219.528, 218.684);
    path_0.lineTo(70.534, 69.696);

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = const Color(0xff00D2B8);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(55.64, 187.014);
    path_1.lineTo(55.648, 187.022);
    path_1.cubicTo(55.64, 186.968, 55.612, 186.908, 55.612, 186.852);
    path_1.cubicTo(55.612, 186.908, 55.62, 186.96, 55.64, 187.014);
    path_1.close();
    path_1.moveTo(219.516, 218.724);
    path_1.lineTo(186.744, 233.244);
    path_1.lineTo(55.648, 187.022);
    path_1.cubicTo(58.152, 196.63, 63.696, 207.43, 69.662, 213.336);
    path_1.lineTo(112.446, 255.876);
    path_1.lineTo(207.576, 256);
    path_1.lineTo(219.528, 218.684);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = const Color(0xff55DDCA);
    canvas.drawPath(path_1, paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(3.034, 130.116);
    path_2.cubicTo(-1.202, 134.638, 0.902, 143.966, 7.722, 150.838);
    path_2.lineTo(37.14, 180.5);
    path_2.lineTo(55.64, 187.014);
    path_2.cubicTo(54.826, 183.938, 54.338, 180.97, 54.256, 178.34);
    path_2.lineTo(54.058, 172.75);
    path_2.lineTo(53.988, 53.15);
    path_2.lineTo(3.034, 130.116);
    path_2.close();

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = const Color(0xff0081C6);
    canvas.drawPath(path_2, paint_2_fill);

    Path path_3 = Path();
    path_3.moveTo(187.82, 54.686);
    path_3.cubicTo(184.744, 53.9, 181.794, 53.414, 179.12, 53.33);
    path_3.lineTo(173.212, 53.126);
    path_3.lineTo(53.988, 53.142);
    path_3.lineTo(219.544, 218.684);
    path_3.lineTo(234.098, 185.88);
    path_3.lineTo(187.82, 54.686);

    Paint paint_3_fill = Paint()..style = PaintingStyle.fill;
    paint_3_fill.color = const Color(0xff0079B3);
    canvas.drawPath(path_3, paint_3_fill);

    Path path_4 = Path();
    path_4.moveTo(214.118, 68.732);
    path_4.cubicTo(208.11, 62.674, 197.452, 57.168, 187.826, 54.692);
    path_4.lineTo(234.098, 185.88);
    path_4.lineTo(219.558, 218.684);
    path_4.lineTo(255.076, 207.336);
    path_4.lineTo(255.152, 109.92);
    path_4.lineTo(214.118, 68.732);
    path_4.close();

    Paint paint_4_fill = Paint()..style = PaintingStyle.fill;
    paint_4_fill.color = const Color(0xff00A4E4);
    canvas.drawPath(path_4, paint_4_fill);

    Path path_5 = Path();
    path_5.moveTo(181.338, 36.298);
    path_5.lineTo(151.684, 6.862);
    path_5.cubicTo(144.826, 0.068, 135.494, -2.046, 130.984, 2.178);
    path_5.lineTo(53.988, 53.142);
    path_5.lineTo(173.212, 53.126);
    path_5.lineTo(179.12, 53.33);
    path_5.cubicTo(181.794, 53.414, 184.744, 53.9, 187.82, 54.686);
    path_5.lineTo(181.338, 36.298);
    path_5.close();

    Paint paint_5_fill = Paint()..style = PaintingStyle.fill;
    paint_5_fill.color = const Color(0xff00D2B8);
    canvas.drawPath(path_5, paint_5_fill);

    canvas.restore();
  }

  // Android Icon (robot head)
  void _drawAndroidIcon(Canvas canvas, double size, Paint paint) {
    final path = Path();
    final halfSize = size / 2;

    // Android head (rounded rectangle)
    final rect = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(0, 0),
        width: halfSize * 1.4,
        height: halfSize * 1.2,
      ),
      const Radius.circular(10),
    );
    path.addRRect(rect);

    // Antenna (two semicircles on top)
    path.addOval(
      Rect.fromCircle(
        center: Offset(-halfSize * 0.3, -halfSize * 0.8),
        radius: halfSize * 0.15,
      ),
    );
    path.addOval(
      Rect.fromCircle(
        center: Offset(halfSize * 0.3, -halfSize * 0.8),
        radius: halfSize * 0.15,
      ),
    );

    paint.style = PaintingStyle.fill;
    canvas.drawPath(path, paint);
  }

  // Cloud Icon
  void _drawCloudIcon(Canvas canvas, double size, Paint paint) {
    final path = Path();
    final halfSize = size / 2;

    // Cloud shape
    path.addOval(
      Rect.fromCircle(
        center: Offset(-halfSize * 0.2, 0),
        radius: halfSize * 0.4,
      ),
    );
    path.addOval(
      Rect.fromCircle(
        center: Offset(halfSize * 0.2, 0),
        radius: halfSize * 0.5,
      ),
    );
    path.addOval(
      Rect.fromCircle(
        center: Offset(0, halfSize * 0.2),
        radius: halfSize * 0.45,
      ),
    );

    paint.style = PaintingStyle.fill;
    canvas.drawPath(path, paint);
  }

  // Database Icon
  // MongoDB Icon (leaf)
  // PostgreSQL Icon (elephant – simplified)
  void _drawHtmlIcon(Canvas canvas, double size, Paint paint) {
    canvas.save();
    canvas.translate(-size / 2, -size / 2);
    final double scale = size * 0.05;

    // Center the icon
    canvas.translate(-size / 2, -size / 2);

    canvas.scale(scale, scale);
    canvas.saveLayer(
      Rect.fromLTWH(-1000, -1000, 2000, 2000),
      Paint()..color = Colors.white.withOpacity(0.2),
    );

    // 🔹 Soft paint helper (NO SHAPE CHANGE)
    Paint soft(Color c) =>
        Paint()
          ..style = PaintingStyle.fill
          ..color = c.withOpacity(0.1) // reduce brightness
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);
    Path path_0 = Path();
    path_0.moveTo(5.902, 27.201);
    path_0.lineTo(3.655, 2);
    path_0.lineTo(28.345, 2);
    path_0.lineTo(26.095, 27.197);
    path_0.lineTo(15.985, 30);
    path_0.lineTo(5.902, 27.201);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xffe44f26).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(16, 27.858);
    path_1.lineTo(24.17, 25.593);
    path_1.lineTo(26.092, 4.061);
    path_1.lineTo(16, 4.061);
    path_1.lineTo(16, 27.858);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Color(0xfff1662a).withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(16, 13.407);
    path_2.lineTo(11.91, 13.407);
    path_2.lineTo(11.628, 10.242);
    path_2.lineTo(16, 10.242);
    path_2.lineTo(16, 7.151);
    path_2.lineTo(15.989, 7.151);
    path_2.lineTo(8.25, 7.151);
    path_2.lineTo(8.324, 7.981);
    path_2.lineTo(9.083, 16.498);
    path_2.lineTo(16, 16.498);
    path_2.lineTo(16, 13.407);
    path_2.close();

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = Color(0xffebebeb).withOpacity(1.0);
    canvas.drawPath(path_2, paint_2_fill);

    Path path_3 = Path();
    path_3.moveTo(16, 21.434);
    path_3.lineTo(15.986, 21.438);
    path_3.lineTo(12.544, 20.509);
    path_3.lineTo(12.324, 18.044);
    path_3.lineTo(10.651, 18.044);
    path_3.lineTo(9.221, 18.044);
    path_3.lineTo(9.654, 22.896);
    path_3.lineTo(15.986, 24.654);
    path_3.lineTo(16, 24.65);
    path_3.lineTo(16, 21.434);
    path_3.close();

    Paint paint_3_fill = Paint()..style = PaintingStyle.fill;
    paint_3_fill.color = Color(0xffebebeb).withOpacity(1.0);
    canvas.drawPath(path_3, paint_3_fill);

    Path path_4 = Path();
    path_4.moveTo(15.989, 13.407);
    path_4.lineTo(15.989, 16.498);
    path_4.lineTo(19.795, 16.498);
    path_4.lineTo(19.437, 20.507);
    path_4.lineTo(15.989, 21.437);
    path_4.lineTo(15.989, 24.653);
    path_4.lineTo(22.326, 22.896);
    path_4.lineTo(22.372, 22.374);
    path_4.lineTo(23.098, 14.237);
    path_4.lineTo(23.174, 13.407);
    path_4.lineTo(22.341, 13.407);
    path_4.lineTo(15.989, 13.407);
    path_4.close();

    Paint paint_4_fill = Paint()..style = PaintingStyle.fill;
    paint_4_fill.color = Color(0xffffffff).withOpacity(1.0);
    canvas.drawPath(path_4, paint_4_fill);

    Path path_5 = Path();
    path_5.moveTo(15.989, 7.151);
    path_5.lineTo(15.989, 9.071);
    path_5.lineTo(15.989, 10.235);
    path_5.lineTo(15.989, 10.242);
    path_5.lineTo(23.445, 10.242);
    path_5.lineTo(23.445, 10.242);
    path_5.lineTo(23.455, 10.242);
    path_5.lineTo(23.517, 9.548);
    path_5.lineTo(23.658, 7.981);
    path_5.lineTo(23.732, 7.151);
    path_5.lineTo(15.989, 7.151);
    path_5.close();

    Paint paint_5_fill = Paint()..style = PaintingStyle.fill;
    paint_5_fill.color = Color(0xffffffff).withOpacity(1.0);
    canvas.drawPath(path_5, paint_5_fill);
    canvas.restore();
    canvas.restore();
  }

  void _drawFirebaseIcon(Canvas canvas, double size, Paint paint) {
    canvas.save();
    // 🔹 Scale factor (adjust if needed)
    final double scale = 0.2;

    // Center the icon
    canvas.translate(-size / 2, -size / 2);

    canvas.scale(scale, scale);
    canvas.saveLayer(
      Rect.fromLTWH(-1000, -1000, 2000, 2000),
      Paint()..color = Colors.white.withOpacity(0.2),
    );

    // 🔹 Soft paint helper (NO SHAPE CHANGE)
    Paint soft(Color c) =>
        Paint()
          ..style = PaintingStyle.fill
          ..color = c.withOpacity(0.1) // reduce brightness
          ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 6);
    Path path_0 = Path();
    path_0.moveTo(1.253, 280.732);
    path_0.lineTo(2.8579999999999997, 277.60100000000006);
    path_0.lineTo(102.211, 89.08300000000006);
    path_0.lineTo(58.061, 5.608000000000061);
    path_0.cubicTo(54.392, -1.283, 45.074, 0.474, 43.87, 8.188);
    path_0.lineTo(1.253, 280.732);
    path_0.close();

    Paint paint_0_fill = Paint()..style = PaintingStyle.fill;
    paint_0_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_0, paint_0_fill);

    Path path_1 = Path();
    path_1.moveTo(134.417, 148.974);
    path_1.lineTo(166.45600000000002, 116.16199999999999);
    path_1.lineTo(134.41700000000003, 55.154999999999994);
    path_1.cubicTo(
      131.37500000000003,
      49.36399999999999,
      123.98400000000004,
      48.75699999999999,
      120.97400000000003,
      54.56499999999999,
    );
    path_1.lineTo(103.26900000000003, 88.67399999999999);
    path_1.lineTo(102.73900000000003, 90.41799999999999);
    path_1.lineTo(134.41700000000003, 148.974);
    path_1.close();

    Paint paint_1_fill = Paint()..style = PaintingStyle.fill;
    paint_1_fill.color = Color(0xff000000).withOpacity(1.0);
    canvas.drawPath(path_1, paint_1_fill);

    Path path_2 = Path();
    path_2.moveTo(0, 282.998);
    path_2.lineTo(2.123, 280.026);
    path_2.lineTo(102.527, 89.512);
    path_2.lineTo(102.739, 87.495);
    path_2.lineTo(58.48, 4.358);
    path_2.cubicTo(54.77, -2.606, 44.33, -0.845, 43.114, 6.951);
    path_2.lineTo(0, 282.998);
    path_2.close();

    Paint paint_2_fill = Paint()..style = PaintingStyle.fill;
    paint_2_fill.color = Color(0xffFFC24A).withOpacity(1.0);
    canvas.drawPath(path_2, paint_2_fill);

    Path path_3 = Path();
    path_3.moveTo(135.005, 150.38);
    path_3.lineTo(167.95999999999998, 116.63);
    path_3.lineTo(134.99499999999998, 53.699999999999996);
    path_3.cubicTo(
      131.86599999999999,
      47.742999999999995,
      123.12899999999998,
      47.724999999999994,
      120.03299999999997,
      53.699999999999996,
    );
    path_3.lineTo(102.42, 87.287);
    path_3.lineTo(102.42, 90.147);
    path_3.lineTo(135.00400000000002, 150.38);
    path_3.close();

    Paint paint_3_fill = Paint()..style = PaintingStyle.fill;
    paint_3_fill.color = Color(0xffF4BD62).withOpacity(1.0);
    canvas.drawPath(path_3, paint_3_fill);

    Path path_4 = Path();
    path_4.moveTo(0, 282.998);
    path_4.lineTo(0.962, 282.03);
    path_4.lineTo(4.458, 280.60999999999996);
    path_4.lineTo(132.935, 152.60999999999996);
    path_4.lineTo(134.563, 148.17899999999995);
    path_4.lineTo(102.51299999999999, 87.10499999999995);
    path_4.close();

    Paint paint_4_fill = Paint()..style = PaintingStyle.fill;
    paint_4_fill.color = Color(0xffF6820C).withOpacity(1.0);
    canvas.drawPath(path_4, paint_4_fill);

    Path path_5 = Path();
    path_5.moveTo(139.121, 347.551);
    path_5.lineTo(255.39600000000002, 282.704);
    path_5.lineTo(222.192, 78.209);
    path_5.cubicTo(
      221.15300000000002,
      71.811,
      213.304,
      69.28200000000001,
      208.72400000000002,
      73.869,
    );
    path_5.lineTo(0, 282.998);
    path_5.lineTo(115.608, 347.546);
    path_5.arcToPoint(
      Offset(139.121, 347.551),
      radius: Radius.elliptical(24.126, 24.126),
      rotation: 0,
      largeArc: false,
      clockwise: false,
    );

    Paint paint_5_fill = Paint()..style = PaintingStyle.fill;
    paint_5_fill.color = Color(0xffFDE068).withOpacity(1.0);
    canvas.drawPath(path_5, paint_5_fill);

    Path path_6 = Path();
    path_6.moveTo(254.354, 282.16);
    path_6.lineTo(221.402, 79.218);
    path_6.cubicTo(
      220.37199999999999,
      72.86800000000001,
      213.844,
      70.241,
      209.29899999999998,
      74.794,
    );
    path_6.lineTo(1.29, 282.6);
    path_6.lineTo(115.629, 346.50800000000004);
    path_6.arcToPoint(
      Offset(138.963, 346.514),
      radius: Radius.elliptical(23.943, 23.943),
      rotation: 0,
      largeArc: false,
      clockwise: false,
    );
    path_6.lineTo(254.355, 282.159);
    path_6.close();

    Paint paint_6_fill = Paint()..style = PaintingStyle.fill;
    paint_6_fill.color = Color(0xffFCCA3F).withOpacity(1.0);
    canvas.drawPath(path_6, paint_6_fill);

    Path path_7 = Path();
    path_7.moveTo(139.12, 345.64);
    path_7.arcToPoint(
      Offset(115.608, 345.635),
      radius: Radius.elliptical(24.126, 24.126),
      rotation: 0,
      largeArc: false,
      clockwise: true,
    );
    path_7.lineTo(0.931, 282.015);
    path_7.lineTo(0.0010000000000000009, 282.998);
    path_7.lineTo(115.608, 347.546);
    path_7.arcToPoint(
      Offset(139.121, 347.551),
      radius: Radius.elliptical(24.126, 24.126),
      rotation: 0,
      largeArc: false,
      clockwise: false,
    );
    path_7.lineTo(255.39600000000002, 282.704);
    path_7.lineTo(255.11100000000002, 280.952);
    path_7.lineTo(139.12100000000004, 345.64099999999996);
    path_7.close();

    Paint paint_7_fill = Paint()..style = PaintingStyle.fill;
    paint_7_fill.color = Color(0xffEEAB37).withOpacity(1.0);
    canvas.drawPath(path_7, paint_7_fill);
    canvas.restore();
    canvas.restore();
  }

  // Easing function
  double _easeInOutSine(double t) {
    return -(math.cos(math.pi * t) - 1) / 2;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
