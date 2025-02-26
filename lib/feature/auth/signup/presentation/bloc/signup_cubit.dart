import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:top_institute/feature/auth/signup/presentation/bloc/signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupCubit() : super(SignUpInitial());
}
