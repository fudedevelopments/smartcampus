import 'package:bloc/bloc.dart';


part 'landing_page_event.dart';
part 'landing_page_state.dart';

class LandingPageBloc extends Bloc<LandingPageEvent, LandingPageState> {
  LandingPageBloc() : super(LandingPageInitial(tabindex: 0)) {
    on<LandingPageEvent>((event, emit) {
      if(event is TabChangeEvent){
        emit(LandingPageInitial(tabindex: event.tabindex));
      }
    });
  }
}
