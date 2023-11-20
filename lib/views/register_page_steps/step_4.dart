import 'package:acompany_group_app/controllers/register_page_controller.dart';
import 'package:acompany_group_app/utils.dart';
import 'package:flutter/material.dart';

class Step4 extends StatefulWidget {

  //VARIABLES
  final RegisterPageController con;

  const Step4({super.key, required this.con});

  @override
  State<Step4> createState() => _Step4State();
}

class _Step4State extends State<Step4> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          //STATE
          DropDownButton(
            value: widget.con.genreDrpDownValue,
            list: widget.con.genreList,
            labelText: "Genero:",
            icon: const Icon(Icons.man),
          ),
          //CITY
          DropDownButton(
            value: widget.con.maritalStatusDropDownValue,
            list: widget.con.maritalStatusList,
            labelText: "Estado Civil:",
            icon: const Icon(Icons.woman_2),
          ),
          //CITY
          DropDownButton(
            value: widget.con.economicDependentsDropDownValue,
            list: widget.con.economicDependentsList,
            labelText: "Dependientes Económicos:",
            icon: const Icon(Icons.group),
          ),

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

  DropDownButton({
    super.key,
    required this.value,
    required this.list,
    required this.icon,
    required this.labelText
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
      iconEnabledColor: Utils.appNavyBlue,
      elevation: 16,
      isExpanded: true,
      borderRadius: const BorderRadius.all(Radius.circular(5)),
      style: const TextStyle(color: Utils.appNavyBlue),
      decoration: InputDecoration(
        labelText: widget.labelText,
        labelStyle: const TextStyle(
          fontSize: 18.0
        ),
        prefixIcon: widget.icon
      ),
      onChanged: (value) {
          widget.value = value!;
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