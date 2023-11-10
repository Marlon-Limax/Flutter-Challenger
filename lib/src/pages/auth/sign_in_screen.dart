import 'package:flutter/material.dart';
import 'package:flutter_challenger/src/common_widgets/custom_text_field.dart';
import 'package:flutter_challenger/src/pages/auth/home/home_tab.dart';
import 'package:url_launcher/url_launcher.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
            crossAxisAlignment: CrossAxisAlignment.center, // Ajustado para começar do centro
            children: [
              // Envolver os elementos superiores em Expanded
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start, // Ajustado para começar da esquerda
                  children: [
                    // Label Usuário
                    const Padding(
                      padding: EdgeInsets.only(bottom: 5, left: 5), // Adicionado espaçamento e ajuste para a direita
                      child: Text(
                        'Usuário',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    // email
                    const CustomTextField(
                      icon: Icons.person,
                    ),

                    // Label Senha
                    const Padding(
                      padding: EdgeInsets.only(
                          top: 10, bottom: 5, left: 5), // Adicionado espaçamento e ajuste para a direita
                      child: Text(
                        'Senha',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    // senha
                    const CustomTextField(
                      icon: Icons.lock,
                      isSecret: true,
                    ),

                    // Espaçamento entre TextFields e Botão
                    const SizedBox(height: 20),

                    // Botão de entrar centralizado
                    Row(
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
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (c) {
                                    return const HomeTab();
                                  },
                                ),
                              );
                            },
                            child: const Text(
                              'Entrar',
                              style: TextStyle(fontSize: 18),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              // Padding apenas para a Label "Política de Privacidade"
              Padding(
                padding: const EdgeInsets.only(
                    bottom: 20), // Adicionado espaçamento abaixo da Label "Política de Privacidade"
                child: TextButton(
                  onPressed: () => openUrl(),
                  child: const Text(
                    "Política de Privacidade",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void openUrl() async {
    const url = 'https://google.com.br/';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }
}
