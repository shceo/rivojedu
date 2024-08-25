part of 'all_lessons_bloc.dart';


abstract class AllLessonsEvent {}

class GetModuleLessonsEvent extends AllLessonsEvent{
  final String moduleId;
  GetModuleLessonsEvent({required this.moduleId});
}