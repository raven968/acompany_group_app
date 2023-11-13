import 'package:acompany_group_app/utils.dart';
import 'package:flutter/material.dart';

class Field extends StatefulWidget {
  final String type;
  final TextEditingController controller;
  const Field({Key? key, required this.type, required this.controller})
      : super(key: key);

  @override
  _FieldState createState() => _FieldState();
}

class _FieldState extends State<Field> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      textAlignVertical: TextAlignVertical.center,
      decoration: InputDecoration(
        hintText: widget.type == 'usuario' ? 'Usuario' : 'Contraseña',
        hintStyle: const TextStyle(
          color: Color.fromARGB(117, 6, 40, 61)
        ),
        prefixIcon: Icon(
          widget.type == 'usuario' ? Icons.person : Icons.lock,
          color: Utils.appNavyBlue,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Utils.appNavyBlue
          )
        ),
        focusedBorder: const UnderlineInputBorder(),
        contentPadding: const EdgeInsets.fromLTRB(0, 1, 0, 1),
      ),
      obscureText: widget.type == 'password' ? true : false,
      autocorrect: widget.type == 'password' ? false : true,
      enableSuggestions: widget.type == 'password' ? false : true,
    );
  }
}