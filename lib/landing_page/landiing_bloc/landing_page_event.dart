// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'landing_page_bloc.dart';

sealed class LandingPageEvent {}

class TabChangeEvent extends LandingPageEvent {
  final int tabindex;
  TabChangeEvent({
    required this.tabindex,
  });
}
