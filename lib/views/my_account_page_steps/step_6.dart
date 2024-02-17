import 'package:acompany_group_app/controllers/my_account_page_controller.dart';
import 'package:acompany_group_app/utils.dart';
import 'package:flutter/material.dart';

class Step6 extends StatefulWidget {

  final MyAccountPageController con;

  const Step6({super.key, required this.con});

  @override
  State<Step6> createState() => _Step6State();
}

class _Step6State extends State<Step6> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          //FIRST WORK
          DropDownButton(
            value: widget.con.firstWorkValue,
            list: widget.con.firstWorkList,
            labelText: "¿Es tu Primer Trabajo?",
            icon: const Icon(Icons.work),
            con: widget.con,
            type: 1,
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),

          //FISCAL SITUATION
          DropDownButton(
            value: widget.con.fiscalSituationValue,
            list: widget.con.fiscalSituationList,
            labelText: "Constancia de Situación Fiscal:",
            icon: const Icon(Icons.description),
            con: widget.con,
            type: 2,
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
          

        ],
      ),
    );
  }
}

class DropDownButton extends StatefulWidget {

  //Variables
  String value;
  final List list;
  final Icon icon;
  final String labelText;

  MyAccountPageController con;

  int type;

  DropDownButton({
    super.key,
    required this.value,
    required this.list,
    required this.icon,
    required this.labelText,
    required this.con,
    required this.type
  });

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      value: widget.value,
      icon: const Icon(Icons.arrow_drop_down_circle),
      iconEnabledColor: Utils.appSecondBlue,
      elevation: 16,
      isExpanded: true,
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      style: const TextStyle(color: Utils.appNavyBlue),
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: const TextStyle(
          fontSize: 18.0
        ),
        prefixIcon: widget.icon,
        prefixIconColor: Utils.appSecondBlue
      ),
      onChanged: (value) {
          widget.type == 1 ? widget.con.changeNumberOfSteps(value) : widget.con.changeValue(value, "fiscal");
      },
      items: widget.list.map<DropdownMenuItem<String>>((value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(
            value,
            style: const TextStyle(
              fontSize: 16.0
            ),
          ),
        );
      }).toList(),
    );
  }
}