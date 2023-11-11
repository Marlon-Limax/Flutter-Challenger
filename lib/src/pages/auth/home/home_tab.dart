import 'package:flutter/material.dart';
import 'package:flutter_challenger/src/common_widgets/custom_text_button.dart';
import 'package:flutter_challenger/src/common_widgets/my_text_field.dart';
import 'package:flutter_challenger/src/pages/auth/home/components/card.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
        child: const Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: EdgeInsets.only(top: 50.0),
            child: Column(
              children: [
                MyCard(),
                SizedBox(height: 40.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 50.0),
                  child: Center(child: MyTextField()),
                ),
                Spacer(),
                Padding(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: CustomTextButton(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
