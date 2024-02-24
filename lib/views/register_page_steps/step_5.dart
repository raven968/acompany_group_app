import 'package:acompany_group_app/controllers/register_page_controller.dart';
import 'package:acompany_group_app/models/scholarship.dart';
import 'package:acompany_group_app/utils.dart';
import 'package:acompany_group_app/widgets/register_field_widget.dart';
import 'package:flutter/material.dart';

class Step5 extends StatefulWidget {

  //VARIABLES
  final RegisterPageController con;

  const Step5({super.key, required this.con});

  @override
  State<Step5> createState() => _Step5State();
}

class _Step5State extends State<Step5> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          //SCHOLARSHIP
          DropDownButton(
            value: widget.con.scholarshipValue,
            list: widget.con.scholarshipsList,
            labelText: "Escolaridad:",
            icon: const Icon(Icons.school),
            con: widget.con,
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
          //Education status
          DropDownButton2(
            value: widget.con.educationStatusValue,
            list: widget.con.educationStatusList,
            labelText: "Estatus:",
            icon: const Icon(Icons.school),
            con: widget.con,
            field: 'Estatus',
          ),

        ],
      ),
    );
  }
}

class DropDownButton extends StatefulWidget {

  //Variables
  Scholarship value;
  final List list;
  final Icon icon;
  final String labelText;
  RegisterPageController con;

  DropDownButton({
    super.key,
    required this.value,
    required this.list,
    required this.icon,
    required this.labelText,
    required this.con
  });

  @override
  State<DropDownButton> createState() => _DropDownButtonState();
}

class _DropDownButtonState extends State<DropDownButton> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Scholarship>(
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
          widget.con.changeValue(value, "scholarship");
      },
      items: widget.list.map<DropdownMenuItem<Scholarship>>((value) {
        return DropdownMenuItem<Scholarship>(
          value: value,
          child: Text(
            value.scholarship,
            style: const TextStyle(
              fontSize: 16.0
            ),
          ),
        );
      }).toList(),
    );
  }
}


class DropDownButton2 extends StatefulWidget {

  //Variables
  String value;
  final List list;
  final Icon icon;
  final String labelText;
  RegisterPageController con;
  String field;

  DropDownButton2({
    super.key,
    required this.value,
    required this.list,
    required this.icon,
    required this.labelText,
    required this.con,
    required this.field
  });

  @override
  State<DropDownButton2> createState() => _DropDownButton2State();
}

class _DropDownButton2State extends State<DropDownButton2> {
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
          widget.con.changeValue(value, widget.field);
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