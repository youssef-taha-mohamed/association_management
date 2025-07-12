import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math' as math;

class IslamicBackgroundPattern extends StatelessWidget {
  final Color primaryColor;
  final Color secondaryColor;
  final double opacity;

  const IslamicBackgroundPattern({
    super.key,
    required this.primaryColor,
    required this.secondaryColor,
    this.opacity = 0.1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: primaryColor,
      child: CustomPaint(
        painter: IslamicPatternPainter(
          secondaryColor: secondaryColor.withOpacity(opacity),
        ),
      ),
    );
  }
}

class IslamicPatternPainter extends CustomPainter {
  final Color secondaryColor;

  IslamicPatternPainter({
    required this.secondaryColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = secondaryColor
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    // نمط نجمة إسلامية
    _drawIslamicStarPattern(canvas, size, paint);

    // نمط أقواس إسلامية
    _drawIslamicArcPattern(canvas, size, paint);

    // نمط زخرفي متكرر
    _drawGeometricPattern(canvas, size, paint);
  }

  void _drawIslamicStarPattern(Canvas canvas, Size size, Paint paint) {
    final double starSize = size.width / 10;
    final int rows = (size.height / starSize).ceil() + 1;
    final int cols = (size.width / starSize).ceil() + 1;

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        if ((i + j) % 3 == 0) {
          final offset = Offset(
            j * starSize,
            i * starSize,
          );
          _drawOctagramStar(canvas, offset, starSize * 0.4, paint);
        }
      }
    }
  }

  void _drawOctagramStar(Canvas canvas, Offset center, double size, Paint paint) {
    final Path path = Path();
    final int points = 8;

    for (int i = 0; i < points * 2; i++) {
      final double radius = (i % 2 == 0) ? size : size * 0.4;
      final double angle = (i * math.pi) / points;
      final double x = center.dx + radius * math.cos(angle);
      final double y = center.dy + radius * math.sin(angle);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    path.close();
    canvas.drawPath(path, paint);
  }

  void _drawIslamicArcPattern(Canvas canvas, Size size, Paint paint) {
    final double arcWidth = size.width / 12;

    // أقواس على الحواف
    _drawScallopedBorder(canvas, size, arcWidth, paint);

    // زخارف أقواس متداخلة في الخلفية
    final int numRows = 5;
    final double rowHeight = size.height / numRows;

    for (int row = 0; row < numRows; row++) {
      if (row % 2 == 0) continue; // تخطي الصفوف بالتناوب

      final double y = row * rowHeight + rowHeight / 2;
      final int numArcs = (size.width / arcWidth).floor();

      for (int i = 0; i < numArcs; i++) {
        final double x = i * arcWidth;

        final Path arcPath = Path();
        arcPath.moveTo(x, y);
        arcPath.quadraticBezierTo(
          x + arcWidth / 2,
          y - arcWidth / 2,
          x + arcWidth,
          y,
        );

        canvas.drawPath(arcPath, paint);
      }
    }
  }

  void _drawScallopedBorder(Canvas canvas, Size size, double arcWidth, Paint paint) {
    final Path topBorder = Path();
    final Path bottomBorder = Path();
    final int numArcs = (size.width / arcWidth).floor();

    for (int i = 0; i < numArcs; i++) {
      final double x = i * arcWidth;

      // قوس علوي
      topBorder.moveTo(x, 0);
      topBorder.quadraticBezierTo(
        x + arcWidth / 2,
        arcWidth / 2,
        x + arcWidth,
        0,
      );

      // قوس سفلي
      bottomBorder.moveTo(x, size.height);
      bottomBorder.quadraticBezierTo(
        x + arcWidth / 2,
        size.height - arcWidth / 2,
        x + arcWidth,
        size.height,
      );
    }

    canvas.drawPath(topBorder, paint);
    canvas.drawPath(bottomBorder, paint);
  }

  void _drawGeometricPattern(Canvas canvas, Size size, Paint paint) {
    final double tileSize = size.width / 6;
    final int rows = (size.height / tileSize).ceil();
    final int cols = (size.width / tileSize).ceil();

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        if ((i + j) % 4 == 0) {
          final Offset center = Offset(
            j * tileSize + tileSize / 2,
            i * tileSize + tileSize / 2,
          );

          _drawGeometricTile(canvas, center, tileSize * 0.8, paint);
        }
      }
    }
  }

  void _drawGeometricTile(Canvas canvas, Offset center, double size, Paint paint) {
    // رسم نمط هندسي إسلامي بسيط
    final Path path = Path();

    // رسم مثمن
    final int sides = 8;
    for (int i = 0; i < sides; i++) {
      final double angle = (i * 2 * math.pi / sides) - math.pi / 8;
      final double x = center.dx + size / 2 * math.cos(angle);
      final double y = center.dy + size / 2 * math.sin(angle);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    path.close();
    canvas.drawPath(path, paint);

    // رسم نجمة داخلية
    final Path innerPath = Path();
    for (int i = 0; i < sides; i++) {
      final double outerAngle = (i * 2 * math.pi / sides) - math.pi / 8;
      final double innerAngle = outerAngle + math.pi / sides;

      final double outerX = center.dx + size / 2 * math.cos(outerAngle);
      final double outerY = center.dy + size / 2 * math.sin(outerAngle);

      final double innerX = center.dx + size / 4 * math.cos(innerAngle);
      final double innerY = center.dy + size / 4 * math.sin(innerAngle);

      if (i == 0) {
        innerPath.moveTo(outerX, outerY);
      } else {
        innerPath.lineTo(outerX, outerY);
      }

      innerPath.lineTo(innerX, innerY);
    }

    innerPath.close();
    canvas.drawPath(innerPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

// الاستخدام:
/*
Stack(
  children: [
    // الخلفية الإسلامية
    IslamicBackgroundPattern(
      primaryColor: AppColors.darkGreen,
      secondaryColor: Colors.white,
      opacity: 0.1,
    ),

    // محتوى الشاشة
    SafeArea(
      child: Column(
        children: [
          // عناصر واجهة المستخدم
        ],
      ),
    ),
  ],
)
*/



class EnhancedIslamicBackground extends StatelessWidget {
  final Color primaryColor;
  final Color secondaryColor;
  final double opacity;

  const EnhancedIslamicBackground({
    super.key,
    required this.primaryColor,
    required this.secondaryColor,
    this.opacity = 0.1,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
        // تدرج لوني للخلفية
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            primaryColor,
            primaryColor.withOpacity(0.85),
          ],
        ),
      ),
      child: Stack(
        children: [
          // طبقة الزخارف الأساسية
          CustomPaint(
            painter: EnhancedIslamicPatternPainter(
              secondaryColor: secondaryColor.withOpacity(opacity),
              patternStyle: PatternStyle.geometric,
            ),
            size: Size.infinite,
          ),

          // طبقة زخارف متداخلة
          CustomPaint(
            painter: EnhancedIslamicPatternPainter(
              secondaryColor: secondaryColor.withOpacity(opacity * 0.7),
              patternStyle: PatternStyle.arabesque,
              patternDensity: 0.7,
            ),
            size: Size.infinite,
          ),

          // طبقة إضافية من النقوش الرقيقة
          CustomPaint(
            painter: IslamicCalligraphyPainter(
              color: secondaryColor.withOpacity(opacity * 0.6),
            ),
            size: Size.infinite,
          ),

          // طبقة شفافة للتأثير الضوئي
          Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1.5,
                colors: [
                  secondaryColor.withOpacity(0.03),
                  Colors.transparent,
                ],
                stops: const [0.4, 1.0],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// أنماط الزخارف
enum PatternStyle {
  geometric,
  arabesque,
  floral,
}

class EnhancedIslamicPatternPainter extends CustomPainter {
  final Color secondaryColor;
  final PatternStyle patternStyle;
  final double patternDensity;

  EnhancedIslamicPatternPainter({
    required this.secondaryColor,
    this.patternStyle = PatternStyle.geometric,
    this.patternDensity = 1.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = secondaryColor
      ..strokeWidth = 1.2
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true;

    switch (patternStyle) {
      case PatternStyle.geometric:
        _drawEnhancedGeometricPattern(canvas, size, paint);
        break;
      case PatternStyle.arabesque:
        _drawArabesquePattern(canvas, size, paint);
        break;
      case PatternStyle.floral:
        _drawFloralPattern(canvas, size, paint);
        break;
    }
  }

  // نمط هندسي إسلامي متطور
  void _drawEnhancedGeometricPattern(Canvas canvas, Size size, Paint paint) {
    // حجم النمط الأساسي
    final double baseSize = size.width / (10 * (1 / patternDensity));

    // عدد الصفوف والأعمدة
    final int rows = (size.height / baseSize).ceil() + 1;
    final int cols = (size.width / baseSize).ceil() + 1;

    // رسم نمط من النجوم المتداخلة
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        if ((i + j) % 3 == 0) {
          final Offset center = Offset(
            j * baseSize,
            i * baseSize,
          );
          _drawIntricate10PointStar(canvas, center, baseSize * 0.8, paint);
        } else if ((i + j) % 3 == 1) {
          final Offset center = Offset(
            j * baseSize,
            i * baseSize,
          );
          _drawOctagonalPattern(canvas, center, baseSize * 0.5, paint);
        }
      }
    }

    // رسم شبكة متداخلة من النمط الهندسي
    _drawInterlacingGrid(canvas, size, baseSize * 2, paint);
  }

  // رسم نجمة عشارية متداخلة
  void _drawIntricate10PointStar(Canvas canvas, Offset center, double size, Paint paint) {
    final Path outerPath = Path();
    final Path innerPath = Path();
    final int points = 10;

    // النجمة الخارجية
    for (int i = 0; i < points * 2; i++) {
      final double radius = (i % 2 == 0) ? size : size * 0.6;
      final double angle = (i * math.pi) / points;
      final double x = center.dx + radius * math.cos(angle);
      final double y = center.dy + radius * math.sin(angle);

      if (i == 0) {
        outerPath.moveTo(x, y);
      } else {
        outerPath.lineTo(x, y);
      }
    }
    outerPath.close();
    canvas.drawPath(outerPath, paint);

    // النجمة الداخلية
    for (int i = 0; i < points; i++) {
      final double angle = (i * 2 * math.pi / points) + math.pi / points;
      final double x = center.dx + size * 0.3 * math.cos(angle);
      final double y = center.dy + size * 0.3 * math.sin(angle);

      if (i == 0) {
        innerPath.moveTo(x, y);
      } else {
        innerPath.lineTo(x, y);
      }
    }
    innerPath.close();
    canvas.drawPath(innerPath, paint);

    // الخطوط الداخلية
    for (int i = 0; i < points; i++) {
      final double outerAngle = (i * 2 * math.pi / points);
      final double innerAngle = ((i + 5) % points * 2 * math.pi / points);

      final Path connectingPath = Path();
      connectingPath.moveTo(
        center.dx + size * 0.3 * math.cos(outerAngle),
        center.dy + size * 0.3 * math.sin(outerAngle),
      );
      connectingPath.lineTo(
        center.dx + size * 0.3 * math.cos(innerAngle),
        center.dy + size * 0.3 * math.sin(innerAngle),
      );

      canvas.drawPath(connectingPath, paint);
    }
  }

  // رسم نمط ثماني
  void _drawOctagonalPattern(Canvas canvas, Offset center, double size, Paint paint) {
    final Path octagonPath = Path();
    final int sides = 8;

    // رسم المثمن
    for (int i = 0; i < sides; i++) {
      final double angle = (i * 2 * math.pi / sides);
      final double x = center.dx + size * math.cos(angle);
      final double y = center.dy + size * math.sin(angle);

      if (i == 0) {
        octagonPath.moveTo(x, y);
      } else {
        octagonPath.lineTo(x, y);
      }
    }
    octagonPath.close();
    canvas.drawPath(octagonPath, paint);

    // رسم الخطوط الداخلية المتقاطعة
    for (int i = 0; i < sides; i += 2) {
      final Path diagonalPath = Path();
      final double startAngle = (i * 2 * math.pi / sides);
      final double endAngle = ((i + 4) % sides * 2 * math.pi / sides);

      diagonalPath.moveTo(
        center.dx + size * math.cos(startAngle),
        center.dy + size * math.sin(startAngle),
      );
      diagonalPath.lineTo(
        center.dx + size * math.cos(endAngle),
        center.dy + size * math.sin(endAngle),
      );

      canvas.drawPath(diagonalPath, paint);
    }

    // إضافة دائرة في المنتصف
    canvas.drawCircle(center, size * 0.2, paint);
  }

  // رسم شبكة متداخلة
  void _drawInterlacingGrid(Canvas canvas, Size size, double gridSize, Paint paint) {
    final int horizontalLines = (size.height / gridSize).ceil() + 1;
    final int verticalLines = (size.width / gridSize).ceil() + 1;

    final Paint dashedPaint = Paint()
      ..color = paint.color
      ..strokeWidth = paint.strokeWidth * 0.7
      ..style = PaintingStyle.stroke;

    // خطوط أفقية
    for (int i = 0; i < horizontalLines; i++) {
      if (i % 3 != 0) continue; // رسم كل ثالث خط فقط

      final double y = i * gridSize;
      final Path path = Path();

      // خط متموج بدلاً من خط مستقيم
      path.moveTo(0, y);
      for (int j = 0; j < verticalLines * 2; j++) {
        final double x = j * gridSize / 2;
        final double amplitude = gridSize / 15;
        final double yOffset = (j % 2 == 0) ? amplitude : -amplitude;

        path.lineTo(x, y + yOffset);
      }

      _drawDashedPath(canvas, path, dashedPaint);
    }

    // خطوط عمودية
    for (int i = 0; i < verticalLines; i++) {
      if (i % 3 != 0) continue; // رسم كل ثالث خط فقط

      final double x = i * gridSize;
      final Path path = Path();

      // خط متموج بدلاً من خط مستقيم
      path.moveTo(x, 0);
      for (int j = 0; j < horizontalLines * 2; j++) {
        final double y = j * gridSize / 2;
        final double amplitude = gridSize / 15;
        final double xOffset = (j % 2 == 0) ? amplitude : -amplitude;

        path.lineTo(x + xOffset, y);
      }

      _drawDashedPath(canvas, path, dashedPaint);
    }
  }

  // رسم نمط عربيسك متطور
  void _drawArabesquePattern(Canvas canvas, Size size, Paint paint) {
    // حجم النمط الأساسي
    final double baseSize = size.width / (5 * (1 / patternDensity));

    // عدد الصفوف والأعمدة
    final int rows = (size.height / baseSize).ceil() + 1;
    final int cols = (size.width / baseSize).ceil() + 1;

    // رسم منحنيات عربيسك رائعة
    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        if ((i + j) % 2 == 0) {
          final Offset center = Offset(
            j * baseSize,
            i * baseSize,
          );
          _drawArabesqueMotif(canvas, center, baseSize * 0.9, paint);
        }
      }
    }

    // إضافة عناصر زخرفية متكررة على الحواف
    _drawRecurringBorderMotifs(canvas, size, baseSize * 0.7, paint);
  }

  // رسم وحدة زخرفة عربيسك
  void _drawArabesqueMotif(Canvas canvas, Offset center, double size, Paint paint) {
    final Path path = Path();
    final double quarterSize = size / 4;

    // رسم أربع منحنيات متماثلة تشكل وحدة عربيسك
    for (int quadrant = 0; quadrant < 4; quadrant++) {
      final double startAngle = quadrant * math.pi / 2;
      final double x1 = center.dx + quarterSize * math.cos(startAngle);
      final double y1 = center.dy + quarterSize * math.sin(startAngle);

      final double controlAngle1 = startAngle + math.pi / 6;
      final double cx1 = center.dx + size * 0.4 * math.cos(controlAngle1);
      final double cy1 = center.dy + size * 0.4 * math.sin(controlAngle1);

      final double endAngle = startAngle + math.pi / 2;
      final double x2 = center.dx + quarterSize * math.cos(endAngle);
      final double y2 = center.dy + quarterSize * math.sin(endAngle);

      path.moveTo(x1, y1);
      path.quadraticBezierTo(cx1, cy1, x2, y2);

      // إضافة منحنيات داخلية إضافية
      final double innerX1 = center.dx + quarterSize * 0.6 * math.cos(startAngle);
      final double innerY1 = center.dy + quarterSize * 0.6 * math.sin(startAngle);

      final double innerX2 = center.dx + quarterSize * 0.6 * math.cos(endAngle);
      final double innerY2 = center.dy + quarterSize * 0.6 * math.sin(endAngle);

      final double innerCX = center.dx + quarterSize * 1.2 * math.cos(startAngle + math.pi / 4);
      final double innerCY = center.dy + quarterSize * 1.2 * math.sin(startAngle + math.pi / 4);

      path.moveTo(innerX1, innerY1);
      path.quadraticBezierTo(innerCX, innerCY, innerX2, innerY2);
    }

    // رسم دائرة في المنتصف
    path.addOval(Rect.fromCircle(center: center, radius: quarterSize * 0.3));

    canvas.drawPath(path, paint);

    // إضافة دوائر زخرفية صغيرة
    for (int i = 0; i < 8; i++) {
      final double angle = i * math.pi / 4;
      final double x = center.dx + size * 0.45 * math.cos(angle);
      final double y = center.dy + size * 0.45 * math.sin(angle);

      canvas.drawCircle(Offset(x, y), size * 0.05, paint);
    }
  }

  // رسم زخارف متكررة على الحواف
  void _drawRecurringBorderMotifs(Canvas canvas, Size size, double motifSize, Paint paint) {
    final int numMotifsHorizontal = (size.width / motifSize).ceil();
    final int numMotifsVertical = (size.height / motifSize).ceil();

    // زخارف على الحافة العلوية
    for (int i = 0; i < numMotifsHorizontal; i++) {
      final double x = i * motifSize + motifSize / 2;
      _drawOrnamentalScallop(canvas, Offset(x, motifSize / 2), motifSize * 0.4, paint, true);
    }

    // زخارف على الحافة السفلية
    for (int i = 0; i < numMotifsHorizontal; i++) {
      final double x = i * motifSize + motifSize / 2;
      _drawOrnamentalScallop(canvas, Offset(x, size.height - motifSize / 2), motifSize * 0.4, paint, false);
    }

    // زخارف على الحافة اليمنى
    for (int i = 1; i < numMotifsVertical - 1; i++) {
      final double y = i * motifSize + motifSize / 2;
      _drawOrnamentalScallop(canvas, Offset(size.width - motifSize / 2, y), motifSize * 0.4, paint, false, vertical: true);
    }

    // زخارف على الحافة اليسرى
    for (int i = 1; i < numMotifsVertical - 1; i++) {
      final double y = i * motifSize + motifSize / 2;
      _drawOrnamentalScallop(canvas, Offset(motifSize / 2, y), motifSize * 0.4, paint, true, vertical: true);
    }
  }

  // رسم زخرفة مقوسة
  void _drawOrnamentalScallop(Canvas canvas, Offset center, double size, Paint paint, bool inward, {bool vertical = false}) {
    final Path path = Path();
    final double direction = inward ? -1.0 : 1.0;

    if (!vertical) {
      // زخرفة أفقية
      path.moveTo(center.dx - size, center.dy);
      path.quadraticBezierTo(
        center.dx,
        center.dy + size * direction,
        center.dx + size,
        center.dy,
      );

      // إضافة تفاصيل إضافية
      path.moveTo(center.dx - size * 0.7, center.dy);
      path.quadraticBezierTo(
        center.dx,
        center.dy + size * direction * 0.7,
        center.dx + size * 0.7,
        center.dy,
      );
    } else {
      // زخرفة عمودية
      path.moveTo(center.dx, center.dy - size);
      path.quadraticBezierTo(
        center.dx + size * direction,
        center.dy,
        center.dx,
        center.dy + size,
      );

      // إضافة تفاصيل إضافية
      path.moveTo(center.dx, center.dy - size * 0.7);
      path.quadraticBezierTo(
        center.dx + size * direction * 0.7,
        center.dy,
        center.dx,
        center.dy + size * 0.7,
      );
    }

    canvas.drawPath(path, paint);
  }

  // نمط زخرفي نباتي
  void _drawFloralPattern(Canvas canvas, Size size, Paint paint) {
    final double baseSize = size.width / (8 * (1 / patternDensity));
    final int rows = (size.height / baseSize).ceil() + 1;
    final int cols = (size.width / baseSize).ceil() + 1;

    for (int i = 0; i < rows; i++) {
      for (int j = 0; j < cols; j++) {
        if ((i + j) % 3 == 0) {
          final Offset center = Offset(
            j * baseSize,
            i * baseSize,
          );
          _drawFloralMotif(canvas, center, baseSize * 0.8, paint);
        }
      }
    }
  }

  // رسم وحدة زخرفية نباتية
  void _drawFloralMotif(Canvas canvas, Offset center, double size, Paint paint) {
    final Path path = Path();
    final int petals = 6;

    // رسم بتلات الزهرة
    for (int i = 0; i < petals; i++) {
      final double angle = i * 2 * math.pi / petals;
      final double petalTipX = center.dx + size * math.cos(angle);
      final double petalTipY = center.dy + size * math.sin(angle);

      final double ctrl1Angle = angle - 0.3;
      final double ctrl1X = center.dx + size * 0.5 * math.cos(ctrl1Angle);
      final double ctrl1Y = center.dy + size * 0.5 * math.sin(ctrl1Angle);

      final double ctrl2Angle = angle + 0.3;
      final double ctrl2X = center.dx + size * 0.5 * math.cos(ctrl2Angle);
      final double ctrl2Y = center.dy + size * 0.5 * math.sin(ctrl2Angle);

      path.moveTo(center.dx, center.dy);
      path.cubicTo(
        ctrl1X, ctrl1Y,
        ctrl2X, ctrl2Y,
        petalTipX, petalTipY,
      );

      // رسم خط العودة إلى المركز
      path.lineTo(center.dx, center.dy);
    }

    // رسم دائرة في مركز الزهرة
    path.addOval(Rect.fromCircle(center: center, radius: size * 0.15));

    canvas.drawPath(path, paint);
  }

  // رسم خط متقطع
  void _drawDashedPath(Canvas canvas, Path path, Paint paint) {
    final double dashWidth = 5;
    final double dashSpace = 3;
    final Path dashPath = Path();

    final PathMetrics pathMetrics = path.computeMetrics();
    for (PathMetric metric in pathMetrics) {
      double distance = 0.0;
      while (distance < metric.length) {
        final double dashEnd = distance + dashWidth;
        dashPath.addPath(
          metric.extractPath(distance, dashEnd),
          Offset.zero,
        );
        distance = dashEnd + dashSpace;
      }
    }

    canvas.drawPath(dashPath, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

// خطاط إسلامي
class IslamicCalligraphyPainter extends CustomPainter {
  final Color color;

  IslamicCalligraphyPainter({
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = 1.0
      ..style = PaintingStyle.stroke
      ..isAntiAlias = true;

    // إضافة نقوش خطية رقيقة
    _drawCalligraphicElements(canvas, size, paint);
  }

  void _drawCalligraphicElements(Canvas canvas, Size size, Paint paint) {
    // رسم نمط "الله" بشكل زخرفي في الزوايا
    final double cornerSize = size.width * 0.15;

    // الزاوية العلوية اليسرى
    _drawAbstractCalligraphy(
      canvas,
      Offset(cornerSize * 0.7, cornerSize * 0.7),
      cornerSize,
      paint,
      rotation: math.pi / 4,
    );

    // الزاوية العلوية اليمنى
    _drawAbstractCalligraphy(
      canvas,
      Offset(size.width - cornerSize * 0.7, cornerSize * 0.7),
      cornerSize,
      paint,
      rotation: -math.pi / 4,
    );

    // الزاوية السفلية اليسرى
    _drawAbstractCalligraphy(
      canvas,
      Offset(cornerSize * 0.7, size.height - cornerSize * 0.7),
      cornerSize,
      paint,
      rotation: 3 * math.pi / 4,
    );

    // الزاوية السفلية اليمنى
    _drawAbstractCalligraphy(
      canvas,
      Offset(size.width - cornerSize * 0.7, size.height - cornerSize * 0.7),
      cornerSize,
      paint,
      rotation: -3 * math.pi / 4,
    );

    // نقش كبير في منتصف الشاشة (مختفي جزئيًا)
    _drawCentralMotif(canvas, Offset(size.width / 2, size.height / 2), size.width * 0.3, paint);
  }

  // رسم عنصر خط عربي زخرفي (مجرد)
  void _drawAbstractCalligraphy(Canvas canvas, Offset center, double size, Paint paint, {double rotation = 0}) {
    canvas.save();
    canvas.translate(center.dx, center.dy);
    canvas.rotate(rotation);

    final Path path = Path();

    // خط أفقي رئيسي
    path.moveTo(-size * 0.5, 0);
    path.lineTo(size * 0.5, 0);

    // قوس عمودي
    path.moveTo(0, -size * 0.1);
    path.quadraticBezierTo(size * 0.3, -size * 0.4, 0, -size * 0.5);

    // قوس إضافي
    path.moveTo(-size * 0.3, 0);
    path.quadraticBezierTo(-size * 0.5, size * 0.3, -size * 0.2, size * 0.4);

    // نقطة زخرفية
    path.addOval(Rect.fromCircle(center: Offset(size * 0.2, -size * 0.2), radius: size * 0.05));

    canvas.drawPath(path, paint);
    canvas.restore();
  }

  // رسم زخرفة مركزية
  void _drawCentralMotif(Canvas canvas, Offset center, double size, Paint paint) {
    final Path path = Path();

    // رسم شكل بسملة مجردة
    final double horizontalLine = size * 1.2;
    final double verticalLine = size * 0.8;

    // الخط الأفقي الرئيسي
    path.moveTo(center.dx - horizontalLine / 2, center.dy);
    path.lineTo(center.dx + horizontalLine / 2, center.dy);

    // الأقواس العلوية
    for (int i = 0; i < 3; i++) {
      final double startX = center.dx - horizontalLine / 2 + i * horizontalLine / 3;
      final double endX = startX + horizontalLine / 6;

      path.moveTo(startX, center.dy);
      path.quadraticBezierTo(
        (startX + endX) / 2,
        center.dy - verticalLine / 2,
        endX,
        center.dy,
      );
    }

    // قوس كبير على اليمين
    path.moveTo(center.dx + horizontalLine / 3, center.dy);
    path.quadraticBezierTo(
      center.dx + horizontalLine / 2,
      center.dy + verticalLine / 2,
      center.dx + horizontalLine / 4,
      center.dy + verticalLine / 3,
    );

    // نقاط زخرفية
    for (int i = 0; i < 3; i++) {
      final double x = center.dx - horizontalLine / 3 + i * horizontalLine / 6;
      canvas.drawCircle(Offset(x, center.dy - verticalLine / 4), size * 0.03, paint);
    }

    // رسم المسار بلون شفاف جدًا
    final Paint fadedPaint = Paint()
      ..color = paint.color.withOpacity(0.4)
      ..strokeWidth = paint.strokeWidth
      ..style = paint.style;

    canvas.drawPath(path, fadedPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}