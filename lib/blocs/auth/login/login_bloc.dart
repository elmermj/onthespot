import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:on_the_spot/blocs/bloc_status.dart';
import 'package:on_the_spot/network/repository/auth/auth_repository.dart';

import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository? authRepo;

  LoginBloc({this.authRepo}) : super(const LoginState()) {
    on<LoginEvent>((event, emit) async {
      await mapEventToState(event, emit);
    });
  }

  Future mapEventToState(LoginEvent event, Emitter<LoginState> emit) async {
    // Email updated
    if (event is LoginEmailChanged) {
      emit(state.copyWith(email: event.email));

      // Password updated
    } else if (event is LoginPasswordChanged) {
      emit(state.copyWith(password: event.password));

      // Form submitted
    } else if (event is LoginSubmitted) {
      emit(state.copyWith(appStatus: FormSubmitting()));

      try {
        await authRepo
            ?.signInWithEmail(email: state.email, password: state.password)
            .then((value) {
          emit(state.copyWith(appStatus: const SubmissionSuccess()));
        });
      } catch (e) {
        emit(state.copyWith(appStatus: SubmissionFailed(e)));
      }
    }
  }
}