import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'onduty_event.dart';
part 'onduty_state.dart';

class OndutyBloc extends Bloc<OndutyEvent, OndutyState> {
  OndutyBloc() : super(OndutyInitial()) {
    on<OndutyEvent>((event, emit) {
      
    });
  }
}
