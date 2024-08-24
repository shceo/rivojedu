part of 'user_bloc.dart';

class UserState {
  final FormStatus status;
  final UserModel userModel;
  final String errorMessage;

  UserState({
    required this.status,
    required this.userModel,
    required this.errorMessage,
  });

  factory UserState.init(){
    return UserState(
      status: FormStatus.pure,
      userModel: UserModel.init(),
      errorMessage: '',
    );
  }

  UserState copyWith({
    FormStatus? status,
    UserModel? userModel,
    String? errorMessage,
  }) {
    return UserState(
      status: status ?? this.status,
      userModel: userModel ?? this.userModel,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
