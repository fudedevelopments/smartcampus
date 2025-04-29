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
                  painter: StudentBackgroundPainter(_backgroundAnimation.value),
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
                              color: const Color(0xFF1565C0).withOpacity(0.3),
                              blurRadius: 30,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/icon.jpeg',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 40),

                    // Student icons row
                    Opacity(
                      opacity: _iconAnimation.value,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          _buildStudentIcon(
                              Icons.school, _iconAnimation.value * 0.7),
                          const SizedBox(width: 20),
                          _buildStudentIcon(
                              Icons.menu_book, _iconAnimation.value * 0.8),
                          const SizedBox(width: 20),
                          _buildStudentIcon(
                              Icons.library_books, _iconAnimation.value * 0.9),
                          const SizedBox(width: 20),
                          _buildStudentIcon(
                              Icons.calendar_today, _iconAnimation.value),
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
                            color: Color(0xFF1565C0),
                            letterSpacing: 1.0,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    // Student Portal text with slide animation
                    Transform.translate(
                      offset: Offset(0, _textSlideAnimation.value * 0.8),
                      child: Opacity(
                        opacity: 1 - _textSlideAnimation.value / 60,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 6),
                          decoration: BoxDecoration(
                            color: const Color(0xFF1565C0),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Text(
                            'Student Portal',
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
                            const Color(0xFF1565C0),
                            const Color(0xFF64B5F6),
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

  Widget _buildStudentIcon(IconData icon, double animationValue) {
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
          color: const Color(0xFF1565C0),
          size: 24,
        ),
      ),
    );
  }
}

class StudentBackgroundPainter extends CustomPainter {
  final double animationValue;

  StudentBackgroundPainter(this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    // Background gradient
    final paint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          const Color(0xFFE3F2FD),
          const Color(0xFFBBDEFB),
          Color.lerp(const Color(0xFFBBDEFB), const Color(0xFF90CAF9),
              animationValue)!,
        ],
        stops: [0.0, 0.6, 1.0],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawRect(Rect.fromLTWH(0, 0, size.width, size.height), paint);

    // Draw student-themed elements
    drawStudentElements(canvas, size);
  }

  void drawStudentElements(Canvas canvas, Size size) {
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

    // Draw notebook
    drawNotebook(canvas, Offset(size.width * 0.65, size.height * 0.65),
        size.width * 0.12, animationValue);

    // Draw calendar
    drawCalendar(canvas, Offset(size.width * 0.25, size.height * 0.35),
        size.width * 0.08, 1 - animationValue);

    // Draw circles pattern
    drawCirclesPattern(canvas, size);
  }

  void drawBook(Canvas canvas, Offset position, double size, double animation) {
    final bookPaint = Paint()
      ..color = const Color(0xFF1565C0).withOpacity(0.05 + 0.05 * animation)
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
      ..color = const Color(0xFF1565C0).withOpacity(0.1 + 0.05 * animation)
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
      ..color = const Color(0xFF1565C0).withOpacity(0.05 + 0.05 * animation)
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
      ..color = const Color(0xFF1565C0).withOpacity(0.05 + 0.05 * animation)
      ..style = PaintingStyle.fill;

    // Pencil body
    final path = Path();
    path.moveTo(position.dx, position.dy);
    path.lineTo(position.dx + size * 0.1, position.dy + size);
    path.lineTo(position.dx - size * 0.1, position.dy + size);
    path.close();

    canvas.drawPath(path, pencilPaint);
  }

  void drawNotebook(
      Canvas canvas, Offset position, double size, double animation) {
    final notebookPaint = Paint()
      ..color = const Color(0xFF1565C0).withOpacity(0.05 + 0.05 * animation)
      ..style = PaintingStyle.fill;

    // Notebook body
    final path = Path();
    path.moveTo(position.dx, position.dy);
    path.lineTo(position.dx + size, position.dy);
    path.lineTo(position.dx + size, position.dy + size * 1.3);
    path.lineTo(position.dx, position.dy + size * 1.3);
    path.close();

    canvas.drawPath(path, notebookPaint);

    // Notebook lines
    final linePaint = Paint()
      ..color = const Color(0xFF1565C0).withOpacity(0.05 + 0.05 * animation)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    for (int i = 1; i <= 5; i++) {
      canvas.drawLine(
        Offset(position.dx + size * 0.1, position.dy + size * 0.2 * i),
        Offset(position.dx + size * 0.9, position.dy + size * 0.2 * i),
        linePaint,
      );
    }
  }

  void drawCalendar(
      Canvas canvas, Offset position, double size, double animation) {
    final calendarPaint = Paint()
      ..color = const Color(0xFF1565C0).withOpacity(0.05 + 0.05 * animation)
      ..style = PaintingStyle.fill;

    // Calendar body
    final path = Path();
    path.moveTo(position.dx, position.dy);
    path.lineTo(position.dx + size, position.dy);
    path.lineTo(position.dx + size, position.dy + size);
    path.lineTo(position.dx, position.dy + size);
    path.close();

    canvas.drawPath(path, calendarPaint);

    // Calendar header
    final headerPaint = Paint()
      ..color = const Color(0xFF1565C0).withOpacity(0.1 + 0.05 * animation)
      ..style = PaintingStyle.fill;

    final headerPath = Path();
    headerPath.moveTo(position.dx, position.dy);
    headerPath.lineTo(position.dx + size, position.dy);
    headerPath.lineTo(position.dx + size, position.dy + size * 0.2);
    headerPath.lineTo(position.dx, position.dy + size * 0.2);
    headerPath.close();

    canvas.drawPath(headerPath, headerPaint);
  }

  void drawCirclesPattern(Canvas canvas, Size size) {
    final patternPaint = Paint()
      ..color = const Color(0xFF1565C0).withOpacity(0.02)
      ..style = PaintingStyle.fill;

    // Draw random circles
    final random = math.Random(42); // Fixed seed for consistency
    for (int i = 0; i < 15; i++) {
      final x = random.nextDouble() * size.width;
      final y = random.nextDouble() * size.height;
      final radius = (random.nextDouble() * 20 + 5) *
          (0.5 + 0.5 * math.sin(animationValue * math.pi * 2 + i));

      canvas.drawCircle(Offset(x, y), radius, patternPaint);
    }
  }

  @override
  bool shouldRepaint(covariant StudentBackgroundPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue;
  }
}
