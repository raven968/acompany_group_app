import 'package:acompany_group_app/utils.dart';
import 'package:flutter/material.dart';

class RegisterFieldWidget extends StatefulWidget {

  //VARIABLES
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final TextInputType keyboardType;
  bool? enabled;
  

  RegisterFieldWidget({
    super.key,
    required this.controller,
    required this.hint,
    required this.icon,
    required this.keyboardType,
    this.enabled
  });

  @override
  State<RegisterFieldWidget> createState() => _RegisterFieldWidgetState();
}

class _RegisterFieldWidgetState extends State<RegisterFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      textAlignVertical: TextAlignVertical.center,
      enabled: widget.enabled ?? true,
      decoration: InputDecoration(
        labelText: widget.hint,
        labelStyle: const TextStyle(
          color: Utils.appNavyBlue
        ),
        hintText: widget.hint,
        hintStyle: const TextStyle(
          color: Color.fromARGB(117, 6, 40, 61)
        ),
        prefixIcon: Icon(
          widget.icon,
          color: Utils.appSecondBlue,
        ),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Utils.appNavyBlue
          )
        ),
        focusedBorder: const UnderlineInputBorder(),
        contentPadding: const EdgeInsets.fromLTRB(0, 1, 0, 1),
      ),
      autocorrect: true,
      enableSuggestions: true,
      keyboardType: widget.keyboardType,
    );
  }
}