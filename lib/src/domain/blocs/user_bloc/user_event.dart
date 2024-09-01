part of 'user_bloc.dart';

abstract class UserEvent {}

class GetUserData extends UserEvent {}

class PutUserData extends UserEvent {
  final UserModel userModel;

  PutUserData({required this.userModel});
}
