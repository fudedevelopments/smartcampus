// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smartcampus/home/ui/home.dart';
import 'package:smartcampus/landing_page/landiing_bloc/landing_page_bloc.dart';
import 'package:smartcampus/onduty/ui/ondutyUI.dart';
import 'package:smartcampus/profile/ui/profileUI.dart';

List<BottomNavigationBarItem> bottomnavItem = [
  const BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
  const BottomNavigationBarItem(
      icon: Icon(Icons.file_copy), label: "Permission "),
  const BottomNavigationBarItem(
      icon: Icon(Icons.person_2_outlined), label: "Account"),
];

List<Widget> bottomnaviScreen = [
  const Home(),
  const OndutyUI(),
  const ProfileUI()
];

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LandingPageBloc, LandingPageState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(56.0), 
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue, // Start color
                    Colors.purple, // End color
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                title: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Logo Image
                    Image.asset(
                      'assets/images/icon.jpeg',
                      height: 40,
                    ),
                    const SizedBox(width: 10),

                    const Text(
                      'Smart Campus',
                      style: TextStyle(
                        fontFamily: 'CustomFont',
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          body: Center(
            child: bottomnaviScreen.elementAt(state.tabindex),
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: bottomnavItem,
            currentIndex: state.tabindex,
            selectedItemColor: Theme.of(context).colorScheme.primary,
            unselectedItemColor: Colors.grey,
            onTap: (index) {
              BlocProvider.of<LandingPageBloc>(context)
                  .add(TabChangeEvent(tabindex: index));
            },
          ),
        );
      },
    );
  }
}
