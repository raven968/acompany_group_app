import 'package:acompany_group_app/controllers/register_page_controller.dart';
import 'package:acompany_group_app/utils.dart';
import 'package:acompany_group_app/widgets/register_field_widget.dart';
import 'package:flutter/material.dart';

class Step2 extends StatefulWidget {

  //VARIABLES
  final RegisterPageController con;

  const Step2({super.key, required this.con});

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        children: [

          //NAME
          RegisterFieldWidget(
            controller: widget.con.nameController,
            hint: "Nombre", 
            icon: Icons.person,
            keyboardType: TextInputType.text,
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
          //LAST NAME FATHER
          RegisterFieldWidget(
            controller: widget.con.lastNameFatherController,
            hint: "Apellido Paterno",
            icon: Icons.badge,
            keyboardType: TextInputType.text,
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
          //LAST NAME MOTHER
          RegisterFieldWidget(
            controller: widget.con.lastNameMotherController,
            hint: "Apellido Materno",
            icon: Icons.badge,
            keyboardType: TextInputType.text,
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
          //CELLPHONE NUMBER
          RegisterFieldWidget(
            controller: widget.con.phoneController,
            hint: "Celular",
            icon: Icons.phone,
            keyboardType: TextInputType.number,
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
          //BIRTHDAY
          TextFormField(
            controller: widget.con.birthdayController,
            textAlignVertical: TextAlignVertical.center,
            decoration: const InputDecoration(
              hintText: 'Fecha de Nacimiento',
              hintStyle: TextStyle(
                color: Color.fromARGB(117, 6, 40, 61)
              ),
              prefixIcon: Icon(
                Icons.calendar_month,
                color: Utils.appSecondBlue,
              ),
              enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(
                  color: Utils.appNavyBlue
                )
              ),
              focusedBorder: UnderlineInputBorder(),
              contentPadding: EdgeInsets.fromLTRB(0, 1, 0, 1),
            ),
            autocorrect: true,
            enableSuggestions: true,
            keyboardType: TextInputType.none,
            onTap: () {
              widget.con.selectDate(context, widget.con.birthdayController);
            } 
          )

        ],
      ),
    );
  }
}