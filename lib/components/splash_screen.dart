import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math' as math;
import 'package:get/get.dart';

class SplashScreen extends StatefulWidget {
  final Widget nextScreen;

  const SplashScreen({Key? key, required this.nextScreen}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _logoAnimationController;
  late AnimationController _backgroundAnimationController;
  late Animation<double> _logoScaleAnimation;
  late Animation<double> _textSlideAnimation;
  late Animation<double> _backgroundAnimation;
  late Animation<double> _necAnimation;
  late Animation<double> _iconAnimation;

  @override
  void initState() {
    super.initState();

    // Logo animation controller
    _logoAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1800),
    );

    // Background animation controller
    _backgroundAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 3000),
    )..repeat(reverse: true);

    // Logo scale animation
    _logoScaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _logoAnimationController,
        curve: Curves.elasticOut,
      ),
    );

    // Text slide animation
    _textSlideAnimation = Tween<double>(begin: 50.0, end: 0.0).animate(
      CurvedAnimation(
        parent: _logoAnimationController,
        curve: const Interval(0.3, 0.8, curve: Curves.easeOutCubic),
      ),
    );

    // Background animation
    _backgroundAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _backgroundAnimationController,
        curve: Curves.easeInOut,
      ),
    );

    // NEC animation
    _necAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _logoAnimationController,
        curve: const Interval(0.6, 1.0, curve: Curves.elasticOut),
      ),
    );

    // Icon animation
    _iconAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _logoAnimationController,
        curve: const Interval(0.4, 0.9, curve: Curves.easeOut),
      ),
    );

    _logoAnimationController.forward();

    Timer(const Duration(seconds: 3), () {
      Get.off(() => widget.nextScreen, transition: Transition.fadeIn);
    });
  }

  @override
  void dispose() {
    _logoAnimationController.dispose();
    _backgroundAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedBuilder(
        animation: Listenable.merge(
            [_logoAnimationController, _backgroundAnimationController]),
        builder: (context, child) {
          return Stack(
            children: [
              // Animated background
              Positioned.fill(
                child: CustomPaint(
                  painter:
                      EducationBackgroundPainter(_backgroundAnimation.value),
                ),
              ),

              // Main content
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Logo with animations
                    Transform.scale(
                      scale: _logoScaleAnimation.value,
                      child: Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: const Color(0xFF1A237E).withOpacity(0.3),
                              blurRadius: 30,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/logostaff.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    // Education icons row
                    Opacity(
                      opacity: _iconAnimation.value,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildEducationIcon(
                              Icons.school, _iconAnimation.value * 0.7),
                          const SizedBox(width: 20),
                          _buildEducationIcon(
                              Icons.people, _iconAnimation.value * 0.8),
                          const SizedBox(width: 20),
                          _buildEducationIcon(Icons.admin_panel_settings,
                              _iconAnimation.value * 0.9),
                          const SizedBox(width: 20),
                          _buildEducationIcon(
                              Icons.menu_book, _iconAnimation.value),
                        ],
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Smart Campus text with slide animation
                    Transform.translate(
                      offset: Offset(0, _textSlideAnimation.value),
                      child: Opacity(
                        opacity: 1 - _textSlideAnimation.value / 50,
                        child: const Text(
                          'Smart Campus',
                          style: TextStyle(
                            fontSize: 36,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1A237E),
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Staff Portal text with slide animation
                    Transform.translate(
                      offset: Offset(0, _textSlideAnimation.value * 0.8),
                      child: Opacity(
                        opacity: 1 - _textSlideAnimation.value / 60,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 6),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1A237E),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'Staff Portal',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                              letterSpacing: 0.5,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 25),

                    // NEC text with scale animation
                    Transform.scale(
                      scale: _necAnimation.value,
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 8),
                        decoration: BoxDecoration(
                          color: const Color(0xFF1565C0),
                          borderRadius: BorderRadius.circular(8),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue.withOpacity(0.3),
                              blurRadius: 10,
                              spreadRadius: 1,
                              offset: const Offset(0, 3),
                            ),
                          ],
                        ),
                        child: const Text(
                          'NEC',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            letterSpacing: 2.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Animated loading indicator
              Positioned(
                bottom: 40,
                left: 0,
                right: 0,
                child: Center(
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        Color.lerp(
                            const Color(0xFF1A237E),
                            const Color(0xFF1565C0),
                            _backgroundAnimation.value)!,
                      ),
                      strokeWidth: 3,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildEducationIcon(IconData icon, double animationValue) {
    return Transform.scale(
      scale: animationValue,
      child: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.blue.withOpacity(0.2),
              blurRadius: 10,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Icon(
          icon,
          color: const Color(0xFF1A237E),
          size: 24,
        ),
      ),
    );
  }
}

class EducationBackgroundPainter extends CustomPainter {
  final double animationValue;

  EducationBackgroundPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    // Background gradient
    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFFE8EAF6),
          const Color(0xFFC5CAE9),
          Color.lerp(const Color(0xFFC5CAE9), const Color(0xFF9FA8DA),
              animationValue)!,
        ],
        stops: [0.0, 0.6, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    // Draw education-themed elements
    drawEducationElements(canvas, size);
  }

  void drawEducationElements(Canvas canvas, Size size) {
    // Draw books
    drawBook(canvas, Offset(size.width * 0.1, size.height * 0.2),
        size.width * 0.08, animationValue);
    drawBook(canvas, Offset(size.width * 0.85, size.height * 0.75),
        size.width * 0.1, 1 - animationValue);

    // Draw graduation cap
    drawGraduationCap(canvas, Offset(size.width * 0.8, size.height * 0.15),
        size.width * 0.1, animationValue);

    // Draw pencil
    drawPencil(canvas, Offset(size.width * 0.15, size.height * 0.8),
        size.width * 0.15, 1 - animationValue);

    // Draw grid pattern
    drawGrid(canvas, size);
  }

  void drawBook(Canvas canvas, Offset position, double size, double animation) {
    final bookPaint = Paint()
      ..color = const Color(0xFF1A237E).withOpacity(0.05 + 0.05 * animation)
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(position.dx, position.dy);
    path.lineTo(position.dx + size, position.dy);
    path.lineTo(position.dx + size, position.dy + size * 1.2);
    path.lineTo(position.dx, position.dy + size * 1.2);
    path.close();

    canvas.drawPath(path, bookPaint);

    // Book spine
    final spinePaint = Paint()
      ..color = const Color(0xFF1A237E).withOpacity(0.1 + 0.05 * animation)
      ..style = PaintingStyle.fill;

    final spinePath = Path();
    spinePath.moveTo(position.dx, position.dy);
    spinePath.lineTo(position.dx - size * 0.1, position.dy + size * 0.1);
    spinePath.lineTo(position.dx - size * 0.1, position.dy + size * 1.3);
    spinePath.lineTo(position.dx, position.dy + size * 1.2);
    spinePath.close();

    canvas.drawPath(spinePath, spinePaint);
  }

  void drawGraduationCap(
      Canvas canvas, Offset position, double size, double animation) {
    final capPaint = Paint()
      ..color = const Color(0xFF1A237E).withOpacity(0.05 + 0.05 * animation)
      ..style = PaintingStyle.fill;

    // Cap base
    final path = Path();
    path.moveTo(position.dx - size / 2, position.dy);
    path.lineTo(position.dx + size / 2, position.dy);
    path.lineTo(position.dx + size / 4, position.dy - size / 2);
    path.lineTo(position.dx - size / 4, position.dy - size / 2);
    path.close();

    canvas.drawPath(path, capPaint);

    // Cap top
    canvas.drawCircle(
      Offset(position.dx, position.dy - size / 2),
      size / 6,
      capPaint,
    );
  }

  void drawPencil(
      Canvas canvas, Offset position, double size, double animation) {
    final pencilPaint = Paint()
      ..color = const Color(0xFF1A237E).withOpacity(0.05 + 0.05 * animation)
      ..style = PaintingStyle.fill;

    // Pencil body
    final path = Path();
    path.moveTo(position.dx, position.dy);
    path.lineTo(position.dx + size * 0.1, position.dy + size);
    path.lineTo(position.dx - size * 0.1, position.dy + size);
    path.close();

    canvas.drawPath(path, pencilPaint);
  }

  void drawGrid(Canvas canvas, Size size) {
    final gridPaint = Paint()
      ..color = const Color(0xFF1A237E).withOpacity(0.03)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.5;

    // Horizontal lines
    for (double y = 0; y < size.height; y += size.height / 20) {
      canvas.drawLine(
        Offset(0, y),
        Offset(size.width, y),
        gridPaint,
      );
    }

    // Vertical lines
    for (double x = 0; x < size.width; x += size.width / 20) {
      canvas.drawLine(
        Offset(x, 0),
        Offset(x, size.height),
        gridPaint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant EducationBackgroundPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}
