part of 'student_bloc.dart';

sealed class StudentState extends Equatable {
  const StudentState();
}

final class StudentInitial extends StudentState {
  @override
  List<Object> get props => [];
}
