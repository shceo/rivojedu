import 'package:bloc/bloc.dart';
import 'package:edu/src/domain/models/all_modules_model.dart';
import 'package:edu/src/domain/models/error_model.dart';
import 'package:edu/src/domain/models/form_status.dart';
import 'package:edu/src/domain/repositories/all_modules_repository.dart';
import 'package:equatable/equatable.dart';

part 'all_modules_event.dart';

part 'all_modules_state.dart';

class AllModulesBloc extends Bloc<AllModulesEvent, AllModulesState> {
  AllModulesBloc({required this.allModulesRepository})
      : super(AllModulesState.init()) {
    on<GetAllModules>(_getAllModules);
  }

  final AllModulesRepository allModulesRepository;

  Future<void> _getAllModules(GetAllModules event, emit) async {
    try {
      emit(state.copyWith(status: FormStatus.loading));
      final modules = await allModulesRepository.getAllModules();
      emit(state.copyWith(status: FormStatus.success, allModules: modules));
    } on ErrorModel catch (e) {
      emit(state.copyWith(errorMessage: e.message));
    }
  }
}
