import 'package:bloc/bloc.dart';
import 'package:edu/src/domain/models/error_model.dart';
import 'package:edu/src/domain/models/form_status.dart';
import 'package:edu/src/domain/models/user_model.dart';
import 'package:edu/src/domain/repositories/users_repository.dart';

part 'user_event.dart';

part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc({required this.userRepository}) : super(UserState.init()) {
    on<GetUserData>(_getUserData);
  }

  final UserRepository userRepository;

  Future<void> _getUserData(GetUserData event, emit) async {
    try {
      emit(state.copyWith(status: FormStatus.loading));
      final user = await userRepository.getUserData();
      emit(state.copyWith(userModel: user, status: FormStatus.success));
    } on ErrorModel catch (e) {
      emit(state.copyWith(status: FormStatus.error, errorMessage: e.message));
    }
  }
}
