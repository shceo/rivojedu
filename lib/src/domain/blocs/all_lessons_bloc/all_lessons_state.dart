part of 'all_lessons_bloc.dart';

class AllLessonsState extends Equatable {
  final FormStatus status;
  final String errorMessage;
  final List<AllLessonsModel> lessons;

  const AllLessonsState({
    required this.status,
    required this.errorMessage,
    required this.lessons,
  });

  factory AllLessonsState.init() {
    return const AllLessonsState(
      status: FormStatus.pure,
      errorMessage: '',
      lessons: [],
    );
  }

  AllLessonsState copyWith({
    FormStatus? status,
    String? errorMessage,
    List<AllLessonsModel>? lessons,
  }) {
    return AllLessonsState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
      lessons: lessons ?? this.lessons,
    );
  }

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        lessons,
      ];
}
