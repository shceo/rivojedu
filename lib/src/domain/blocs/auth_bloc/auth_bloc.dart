import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:edu/src/domain/blocs/auth_bloc/auth_event.dart';
import 'package:edu/src/domain/blocs/auth_bloc/auth_state.dart';
import 'package:edu/src/domain/entity/storage_repository.dart';
import 'package:edu/src/domain/models/error_model.dart';
import 'package:edu/src/domain/models/form_status.dart';
import 'package:edu/src/domain/repositories/auth_repository.dart';

// class AuthBloc extends Bloc<AuthEvent, AuthState> {
//   AuthBloc({required this.repository}) : super(AuthState.init()) {
//     on<LoginEvent>(_login);
//   }

//   final AuthRepository repository;

//   Future<void> _login(LoginEvent event, emit) async {
//     try {
//       if (event.phoneNumber.isEmpty || event.password.isEmpty) {
//         emit(state.copyWith(
//             status: FormStatus.error,
//             errorMessage: "Iltimos maydonlarni to'ldiring !"));
//         return;
//       }
//       if (event.password.length < 8) {
//         emit(state.copyWith(
//             status: FormStatus.error,
//             errorMessage: "Parol 8 ta simvol bo'lishi kerak !"));
//         return;
//       }

//       String phoneNum = event.phoneNumber
//           .replaceAll(' ', '')
//           .replaceAll('+', '')
//           .replaceAll('(', '')
//           .replaceAll(')', '');
//       emit(state.copyWith(status: FormStatus.loading));
//       String accessToken = await repository.login(phoneNum, event.password);
//       await StorageRepository.setString(
//           key: "access_token", value: accessToken);
//       emit(state.copyWith(status: FormStatus.success));
//     } on ErrorModel catch (e) {
//       emit(state.copyWith(status: FormStatus.error, errorMessage: e.message));
//     }
//   }

// }


/// changed
import 'package:flutter_bloc/flutter_bloc.dart';

// Define your AuthRepository and AuthEvent classes
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({required this.repository}) : super(AuthState.init()) {
    on<LoginEvent>(_login);
  }

  final AuthRepository repository;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> _login(LoginEvent event, Emitter<AuthState> emit) async {
    try {
      if (event.phoneNumber.isEmpty || event.password.isEmpty) {
        emit(state.copyWith(
            status: FormStatus.error,
            errorMessage: "Iltimos maydonlarni to'ldiring!"));
        return;
      }
      if (event.password.length < 8) {
        emit(state.copyWith(
            status: FormStatus.error,
            errorMessage: "Parol 8 ta simvol bo'lishi kerak!"));
        return;
      }

      String phoneNum = event.phoneNumber
          .replaceAll(' ', '')
          .replaceAll('+', '')
          .replaceAll('(', '')
          .replaceAll(')', '');
      emit(state.copyWith(status: FormStatus.loading));

      String accessToken = await repository.login(phoneNum, event.password);

      await StorageRepository.setString(key: "access_token", value: accessToken);

      // If using Firebase Authentication, handle user creation/login here instead of manually storing passwords
      await _firestore.collection('users').doc(phoneNum).set({
        'phoneNumber': phoneNum,
        'createdAt': Timestamp.now(),
      });

      emit(state.copyWith(status: FormStatus.success));
    } on ErrorModel catch (e) {
      emit(state.copyWith(status: FormStatus.error, errorMessage: e.message));
    } catch (e) {
      emit(state.copyWith(status: FormStatus.error, errorMessage: e.toString()));
    }
  }
}
