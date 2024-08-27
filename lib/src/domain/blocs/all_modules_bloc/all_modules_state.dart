part of 'all_modules_bloc.dart';

class AllModulesState extends Equatable {
  final FormStatus status;
  final List<AllModulesModel> allModules;
  final String errorMessage;

  const AllModulesState(
      {required this.status,
      required this.allModules,
      required this.errorMessage});

  factory AllModulesState.init() {
    return const AllModulesState(
        status: FormStatus.pure, allModules: [], errorMessage: '');
  }

  AllModulesState copyWith({
    FormStatus? status,
    List<AllModulesModel>? allModules,
    String? errorMessage,
  }) {
    return AllModulesState(
      status: status ?? this.status,
      allModules: allModules ?? this.allModules,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
        status,
        allModules,
        errorMessage,
      ];
}
