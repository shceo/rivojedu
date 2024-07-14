import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'main_event.dart';
part 'main_state.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  MainBloc() : super(const MainState()) {
    on<NavItemChangedEvent>((event, emit) {
      
      emit(state.copyWith(currentIndex: event.currentIndex));
    });
  }
}
