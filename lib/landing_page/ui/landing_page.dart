// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartcampus/home/ui/homeUI.dart';
import 'package:smartcampus/landing_page/landiing_bloc/landing_page_bloc.dart';
import 'package:smartcampus/onduty/ui/ondutyUI.dart';
import 'package:smartcampus/profile/ui/profileUI.dart';
import 'dart:math' as math;

List<Map<String, dynamic>> navigationItems = [
  {
    'icon': Icons.dashboard_rounded,
    'activeIcon': Icons.dashboard_rounded,
    'label': "Home",
  },
  {
    'icon': Icons.file_copy_outlined,
    'activeIcon': Icons.file_copy_rounded,
    'label': "Permission",
  },
  {
    'icon': Icons.person_outline_rounded,
    'activeIcon': Icons.person_rounded,
    'label': "Account",
  }
];

List<Widget> bottomnaviScreen = [
  const Home(),
  const OndutyUI(),
  const ProfileUI()
];

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage>
    with TickerProviderStateMixin {
  late AnimationController _notificationBellController;
  late AnimationController _splashEffectController;
  late AnimationController _pageTransitionController;
  late Animation<double> _pageTransitionAnimation;
  late Animation<double> _splashAnimation;

  @override
  void initState() {
    super.initState();

    // Notification bell animation
    _notificationBellController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    // Splash effect animation
    _splashEffectController = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    );

    _splashAnimation = Tween<double>(begin: -1.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _splashEffectController,
        curve: Curves.easeInOut,
      ),
    );

    // Page transition animation
    _pageTransitionController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _pageTransitionAnimation = CurvedAnimation(
      parent: _pageTransitionController,
      curve: Curves.easeInOut,
    );

    _pageTransitionController.forward();

    // Start the splash animation
    _startSplashAnimation();
  }

  @override
  void dispose() {
    _notificationBellController.dispose();
    _splashEffectController.dispose();
    _pageTransitionController.dispose();
    super.dispose();
  }

  void _playNotificationAnimation() {
    _notificationBellController
      ..reset()
      ..forward();
  }

  void _startSplashAnimation() {
    _splashEffectController
      ..reset()
      ..forward().then((_) {
        // Loop the animation
        if (mounted) {
          _startSplashAnimation();
        }
      });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LandingPageBloc, LandingPageState>(
      listener: (context, state) {
        // Reset and start page transition animation when tab changes
        _pageTransitionController.reset();
        _pageTransitionController.forward();

        // Reset and start splash animation when tab changes
        _splashEffectController.reset();
        _splashEffectController.forward();

        // Play notification animation when tab changes
        _playNotificationAnimation();
      },
      builder: (context, state) {
        return Scaffold(
          extendBody: true,
          appBar: _buildAppBar(context),
          body: FadeTransition(
            opacity: _pageTransitionAnimation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0.05, 0),
                end: Offset.zero,
              ).animate(_pageTransitionAnimation),
              child: bottomnaviScreen.elementAt(state.tabindex),
            ),
          ),
          bottomNavigationBar:
              _buildBottomNavigationBar(context, state.tabindex),
        );
      },
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(60.0),
      child: AnimatedBuilder(
        animation: _splashAnimation,
        builder: (context, child) {
          return CustomPaint(
            painter: SplashEffectPainter(
              progress: _splashAnimation.value,
              baseColors: const [
                Color(0xFF1565C0), // Darker blue
                Color(0xFF3949AB), // Indigo
                Color(0xFF5E35B1), // Deep purple
              ],
              splashColor: Colors.white.withOpacity(0.4),
            ),
            child: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: SafeArea(
                child: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leadingWidth: 80,
                  leading: Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: Center(
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              blurRadius: 4,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/icon.jpeg',
                            height: 40,
                            width: 40,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  title: const Text(
                    'Smart Campus',
                    style: TextStyle(
                      fontFamily: 'CustomFont',
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                      letterSpacing: 0.5,
                    ),
                  ),
                  actions: [
                    AnimatedBuilder(
                      animation: _notificationBellController,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: math.sin(_notificationBellController.value *
                                  math.pi *
                                  5) *
                              0.15,
                          child: IconButton(
                            icon: const Icon(
                              Icons.notifications_outlined,
                              color: Colors.white,
                              size: 28,
                            ),
                            onPressed: _playNotificationAnimation,
                          ),
                        );
                      },
                    ),
                    const SizedBox(width: 8),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildBottomNavigationBar(BuildContext context, int currentIndex) {
    return Container(
      height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: const Color(0xFF1565C0).withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(
          navigationItems.length,
          (index) => _buildNavItem(index, currentIndex, context),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, int currentIndex, BuildContext context) {
    final bool isSelected = index == currentIndex;
    final primaryColor = Theme.of(context).primaryColor;

    return GestureDetector(
      onTap: () {
        BlocProvider.of<LandingPageBloc>(context)
            .add(TabChangeEvent(tabindex: index));
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color:
              isSelected ? primaryColor.withOpacity(0.15) : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              child: Icon(
                isSelected
                    ? navigationItems[index]['activeIcon']
                    : navigationItems[index]['icon'],
                color: isSelected ? primaryColor : Colors.grey,
                size: isSelected ? 28 : 24,
              ),
            ),
            const SizedBox(height: 4),
            AnimatedDefaultTextStyle(
              duration: const Duration(milliseconds: 300),
              style: TextStyle(
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                fontSize: isSelected ? 14 : 12,
                color: isSelected ? primaryColor : Colors.grey,
              ),
              child: Text(navigationItems[index]['label']),
            ),
          ],
        ),
      ),
    );
  }
}

// Custom painter to create the splash effect
class SplashEffectPainter extends CustomPainter {
  final double progress;
  final List<Color> baseColors;
  final Color splashColor;

  SplashEffectPainter({
    required this.progress,
    required this.baseColors,
    required this.splashColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    // Draw base gradient background
    final Rect rect = Offset.zero & size;
    final Paint gradientPaint = Paint()
      ..shader = LinearGradient(
        colors: baseColors,
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(rect);

    canvas.drawRect(rect, gradientPaint);

    // Draw horizontal splash effect
    final double splashWidth = size.width * 0.3; // Width of splash
    final double splashPosition = size.width * progress;

    // Create gradient for splash
    final Paint splashPaint = Paint()
      ..shader = LinearGradient(
        colors: [
          Colors.transparent,
          splashColor,
          splashColor,
          Colors.transparent,
        ],
        stops: const [0.0, 0.3, 0.7, 1.0],
        begin: Alignment.centerLeft,
        end: Alignment.centerRight,
      ).createShader(
        Rect.fromLTWH(
          splashPosition - splashWidth / 2,
          0,
          splashWidth,
          size.height,
        ),
      );

    canvas.drawRect(
      Rect.fromLTWH(
        splashPosition - splashWidth / 2,
        0,
        splashWidth,
        size.height,
      ),
      splashPaint,
    );
  }

  @override
  bool shouldRepaint(SplashEffectPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}
