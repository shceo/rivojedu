import 'package:bloc/bloc.dart';
import 'package:edu/src/domain/models/error_model.dart';
import 'package:edu/src/domain/models/form_status.dart';
import 'package:edu/src/domain/models/top_users_model.dart';
import 'package:edu/src/domain/repositories/top_users_repository.dart';
import 'package:equatable/equatable.dart';

part 'top_users_event.dart';

part 'top_users_state.dart';

class TopUsersBloc extends Bloc<TopUsersEvent, TopUsersState> {
  TopUsersBloc({required this.topUsersRepository})
      : super(TopUsersState.init()) {
    on<GetTopUsers>(_getTopUsers);
  }

  final TopUsersRepository topUsersRepository;

  Future<void> _getTopUsers(GetTopUsers event, emit) async {
    try {
      emit(state.copyWith(status: FormStatus.loading));
      final users = await topUsersRepository.getTopUsers();
      emit(state.copyWith(topUsers: users, status: FormStatus.success));
    } on ErrorModel catch (e) {
      emit(state.copyWith(status: FormStatus.error, errorMessage: e.message));
    }
  }
}
