import 'package:bloc/bloc.dart';
import 'package:edu/src/domain/models/form_status.dart';
import 'package:edu/src/domain/models/user_model.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState.init()) {
    on<UserEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
