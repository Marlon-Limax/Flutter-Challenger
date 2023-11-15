import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_challenger/controller/login/login_controller.dart';
import 'package:flutter_challenger/src/pages/auth/components/custom_text_button.dart';
import 'package:flutter_challenger/src/pages/auth/components/custom_text_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({
    Key? key,
  }) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginController = LoginController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xFF1A4752),
                    Color.fromRGBO(41, 152, 142, 1.0),
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 5, left: 5),
                          child: Text(
                            'Usuário',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        // email
                        Observer(
                          builder: (context) => CustomTextField(
                            icon: Icons.person,
                            onChanged: loginController.setEmail,
                          ),
                        ),
              
                        const Padding(
                          padding: EdgeInsets.only(top: 10, bottom: 5, left: 5),
                          child: Text(
                            'Senha',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        // senha
                        Observer(
                          builder: (context) => CustomTextField(
                            icon: Icons.lock,
                            isSecret: true,
                            onChanged: loginController.setPassword,
                          ),
                        ),
              
                        const SizedBox(height: 20),
              
                        Observer(
                          builder: (_) {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 50,
                                  width: 150,
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(24),
                                      ),
                                    ),
                                    onPressed: () {
                                      loginController.isEmailValid &&
                                              loginController.isPasswordValid &&
                                              !loginController.loading
                                          ? () {
                                              loginController.login();
                                            }
                                          : null;
                                    },
                                    child: loginController.loading
                                        ? const CircularProgressIndicator(
                                            valueColor: AlwaysStoppedAnimation(Colors.white),
                                          )
                                        : const Text(
                                            'Entrar',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20),
                    child: CustomTextButton(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
