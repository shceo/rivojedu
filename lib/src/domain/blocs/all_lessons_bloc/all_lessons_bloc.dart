import 'package:bloc/bloc.dart';
import 'package:edu/src/domain/models/all_lessons_model.dart';
import 'package:edu/src/domain/models/error_model.dart';
import 'package:edu/src/domain/models/form_status.dart';
import 'package:edu/src/domain/repositories/all_lessons_repository.dart';
import 'package:equatable/equatable.dart';

part 'all_lessons_event.dart';

part 'all_lessons_state.dart';

class AllLessonsBloc extends Bloc<AllLessonsEvent, AllLessonsState> {
  AllLessonsBloc({required this.allLessonsRepository})
      : super(AllLessonsState.init()) {
    on<GetModuleLessonsEvent>(_getModuleLessons);
  }

  final AllLessonsRepository allLessonsRepository;

  Future<void> _getModuleLessons(GetModuleLessonsEvent event, emit) async {
    try {
      emit(state.copyWith(status: FormStatus.loading));
      final lessons =
          await allLessonsRepository.getAllLessons(id: event.moduleId);
      emit(state.copyWith(lessons: lessons, status: FormStatus.success));
    } on ErrorModel catch (e) {
      emit(state.copyWith(errorMessage: e.message, status: FormStatus.error));
    }
  }
}
