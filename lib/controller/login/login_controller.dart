// ignore_for_file: library_private_types_in_public_api


import 'package:mobx/mobx.dart';
part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  @observable
  bool passwordVisible = false;

  @action
  void togglePasswordVisible() => passwordVisible = !passwordVisible;

  @observable
  String email = "";

  @action
  void setEmail(String value) => email = value;

  @observable
  String password = "";

  @action
  void setPassword(String value) => password = value;

  @observable
  bool loggedIn = false;

  @computed
  bool get isPasswordValid => password.length > 3;

  @computed
  bool get isEmailValid => RegExp(
          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
      .hasMatch(email);

  @computed
  bool get isLoginAndPasswordFilled => email.isNotEmpty && password.isNotEmpty;

  @computed
  bool get isPasswordLengthValid => password.length >= 2;

  @computed
  bool get isPasswordValidCharacters => RegExp(r'^[a-zA-Z0-9]+$').hasMatch(password);

  @computed
  bool get isFieldsLengthValid => email.length <= 20 && password.length <= 20;

  @computed
  bool get endsWithSpace => email.endsWith(' ') || password.endsWith(' ');

  @computed
  Function? get loginPressed => (isLoginAndPasswordFilled &&
          isPasswordLengthValid &&
          isPasswordValidCharacters &&
          isFieldsLengthValid &&
          !endsWithSpace &&
          !loading)
      ? login
      : null;

  @observable
  bool loading = false;

  @action
  Future<void> login() async {
    loading = true;

    await Future.delayed(const Duration(seconds: 2));

    loading = false;
    loggedIn = true;
  }
}
