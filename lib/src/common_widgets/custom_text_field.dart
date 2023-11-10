import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final IconData icon;
  final bool isSecret;
  final List<TextInputFormatter>? inputFormatters;
  final String? initialValue;
  final bool readOnly;
  final Color backgroundColor; // Adicione esta propriedade

  const CustomTextField({
    Key? key,
    required this.icon,
    this.isSecret = false,
    this.inputFormatters,
    this.initialValue,
    this.readOnly = false,
    this.backgroundColor = Colors.white, // Cor padrão para branco
  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool isObscure = false;

  @override
  void initState() {
    super.initState();

    isObscure = widget.isSecret;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        decoration: BoxDecoration(
          color: widget.backgroundColor, // Defina a cor de fundo aqui
          borderRadius: BorderRadius.circular(5),
        ),
        child: TextFormField(
          readOnly: widget.readOnly,
          initialValue: widget.initialValue,
          inputFormatters: widget.inputFormatters,
          obscureText: isObscure,
          decoration: InputDecoration(
            prefixIcon: Icon(widget.icon, color: Colors.black), // Ícone preto
            suffixIcon: widget.isSecret
                ? IconButton(
                    onPressed: () {
                      setState(() {
                        isObscure = !isObscure;
                      });
                    },
                    icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off),
                    color: Colors.black, // Ícone preto
                  )
                : null,
            isDense: true,
            contentPadding: EdgeInsets.zero, // Remova o preenchimento interno
            border: OutlineInputBorder(
              borderSide: BorderSide.none, // Remova a borda
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
