import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_tecnica_jmot/blocs/auth/auth_event.dart';
import 'package:prueba_tecnica_jmot/blocs/auth/auth_state.dart';
import 'package:prueba_tecnica_jmot/repositories/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());
      try {
        final token = await authRepository.login(event.email, event.password);
        emit(AuthAuthenticated(token));
      } catch (e) {
        emit(AuthError(e.toString()));
      }
    });

    on<LogoutEvent>((event, emit) async {
      await authRepository.logout();
      emit(AuthInitial());
    });
  }
}