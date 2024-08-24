import 'package:edu/src/domain/models/form_status.dart';
import 'package:equatable/equatable.dart';

class AuthState extends Equatable {
  final FormStatus status;
  final String errorMessage;

  const AuthState({required this.status, required this.errorMessage});

  factory AuthState.init() {
    return const AuthState(status: FormStatus.pure, errorMessage: '');
  }

  AuthState copyWith({
    FormStatus? status,
    String? errorMessage,
  }) {
    return AuthState(
      status: status ?? this.status,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, errorMessage];
}
