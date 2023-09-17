import 'package:flutter_riverpod/flutter_riverpod.dart';

class SignUpFormProvider extends StateNotifier<SignUpFormState> {
  SignUpFormProvider() : super(SignUpFormState.empty());
  void updateEmail(String email) {
    state = state.copyWith(email: email);
  }

  void updatePassword(String password) {
    state = state.copyWith(email: password);
  }

  void toggleShowPassword() {
    state = state.copyWith(showPassword: !state.showPassword);
  }
}

class SignUpFormState {
  String email;
  String password;
  String confirmPassword;
  bool showPassword;
  SignUpFormState({
    required this.email,
    required this.password,
    required this.confirmPassword,
    this.showPassword = false,
  });
  factory SignUpFormState.empty() => SignUpFormState(
        email: '',
        password: '',
        confirmPassword: '',
      );
  final emailRegExp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
  );
  final passwordRegExp = RegExp(
    r"^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$",
  );
  bool get isValidEmail => email.isNotEmpty && emailRegExp.hasMatch(email);
  bool get isValidPassword => password.isNotEmpty && passwordRegExp.hasMatch(password);
  bool get isValidConfirmPassword => confirmPassword.isNotEmpty && password == confirmPassword;
  bool get isValid => isValidEmail && isValidPassword && isValidConfirmPassword;
  SignUpFormState copyWith({
    String? email,
    String? password,
    String? confirmPassword,
    bool? showPassword,
  }) {
    return SignUpFormState(
      showPassword: showPassword ?? this.showPassword,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
    );
  }
}

final signUpFormProvider = StateNotifierProvider<SignUpFormProvider, SignUpFormState>(
  (ref) => SignUpFormProvider(),
);
