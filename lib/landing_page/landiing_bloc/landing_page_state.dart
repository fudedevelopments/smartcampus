part of 'landing_page_bloc.dart';


sealed class LandingPageState {
  final int tabindex;

  LandingPageState({required this.tabindex});
}

final class LandingPageInitial extends LandingPageState {
  LandingPageInitial({required super.tabindex});
}
