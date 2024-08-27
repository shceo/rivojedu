part of 'top_users_bloc.dart';

class TopUsersState extends Equatable {
  final FormStatus status;
  final String errorMessage;
  final List<TopUsersModel> topUsers;

  const TopUsersState({
    required this.status,
    required this.errorMessage,
    required this.topUsers,
  });

  factory TopUsersState.init() {
    return const TopUsersState(
      status: FormStatus.pure,
      errorMessage: '',
      topUsers: [],
    );
  }

  TopUsersState copyWith({
    FormStatus? status,
    String? errorMessage,
    List<TopUsersModel>? topUsers,
  }) =>
      TopUsersState(
        status: status ?? this.status,
        errorMessage: errorMessage ?? this.errorMessage,
        topUsers: topUsers ?? this.topUsers,
      );

  @override
  List<Object?> get props => [
        status,
        errorMessage,
        topUsers,
      ];
}
