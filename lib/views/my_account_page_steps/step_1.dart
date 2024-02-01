import 'package:acompany_group_app/controllers/my_account_page_controller.dart';
import 'package:acompany_group_app/controllers/register_page_controller.dart';
import 'package:acompany_group_app/utils.dart';
import 'package:acompany_group_app/widgets/select_multiple_widget.dart';
import 'package:flutter/material.dart';

class Step1 extends StatefulWidget {

  //VARIABLES
  final MyAccountPageController con;

  const Step1({super.key, required this.con});

  @override
  State<Step1> createState() => Step1State();
}

class Step1State extends State<Step1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          //STATE
          DropDownButton(
            value: widget.con.stateDropDownValue,
            list: widget.con.statesList,
            labelText: "Estado:",
            icon: const Icon(Icons.location_pin),
          ),
          //CITY
          DropDownButton(
            value: widget.con.cityDropDownValue,
            list: widget.con.cityList,
            labelText: "Ciudad:",
            icon: const Icon(Icons.location_city),
          ),

          //---- ZONES ----//
          const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
          SelectMultipleWidget(
            title: "Zonas",
            buttonText: "Zonas en las que buscas trabajo",
            selectedItems: widget.con.selectedZones,
            items: widget.con.zoneItems,
            change: widget.con.changeSelectedZones,
          ),
          //---- ZONES END ----//

          //---- TURNS ----//
          const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
          SelectMultipleWidget(
            title: "Turnos",
            buttonText: "Turnos en las que buscas trabajo",
            selectedItems: widget.con.selectedTurns,
            items: widget.con.turnItems,
            change: widget.con.changeSelectedTurns,
          ),
          //---- TURNS END ----//
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