import 'package:acompany_group_app/controllers/my_account_page_controller.dart';
import 'package:acompany_group_app/utils.dart';
import 'package:acompany_group_app/widgets/register_field_widget.dart';
import 'package:flutter/material.dart';

class Step7 extends StatefulWidget {

  final MyAccountPageController con;

  const Step7({
    super.key,
    required this.con
  });

  @override
  State<Step7> createState() => _Step7State();
}

class _Step7State extends State<Step7> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          ////////////////////////
          /// FIRST EXPERIENCE ///
          ///////////////////////
          const Text(
            "Experiencia Laboral (Mas reciente)",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Utils.appNavyBlue,
              fontSize: 17.0
            ),
          ),

          const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),

          //POSITION
          RegisterFieldWidget(
            controller: widget.con.positionController,
            hint: "Puesto",
            icon: Icons.manage_accounts_rounded,
            keyboardType: TextInputType.text
          ),

          const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),

          //COMPANY
          RegisterFieldWidget(
            controller: widget.con.companyController,
            hint: "Empresa",
            icon: Icons.apartment,
            keyboardType: TextInputType.text
          ),

          const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),

          //INIT DATE
          TextFormField(
            controller: widget.con.initDateController,
            textAlignVertical: TextAlignVertical.center,
            decoration: const InputDecoration(
              hintText: 'Fecha de Inicio',
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
              widget.con.selectDate(context, widget.con.initDateController);
            } 
          ),

          const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
          
          //FINISH DATE
          TextFormField(
            controller: widget.con.finishDateController,
            textAlignVertical: TextAlignVertical.center,
            decoration: const InputDecoration(
              hintText: 'Fecha de Fin',
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
              widget.con.selectDate(context, widget.con.finishDateController);
            } 
          ),

          const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),

          DropDownButton(
            value: widget.con.specialtyValue,
            list: widget.con.specialtyList,
            icon: const Icon(Icons.work),
            labelText: "Especialidad",
            con: widget.con,
            field: "specialty",
          ),

          /////////////////////////
          /// SECOND EXPERIENCE ///
          /////////////////////////
          
          const Padding(padding: EdgeInsets.symmetric(vertical: 30.0)),

          const Text(
            "Experiencia Laboral",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Utils.appNavyBlue,
              fontSize: 17.0
            ),
          ),

          const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),

          //POSITION
          RegisterFieldWidget(
            controller: widget.con.positionController2,
            hint: "Puesto",
            icon: Icons.manage_accounts_rounded,
            keyboardType: TextInputType.text
          ),

          const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),

          //COMPANY
          RegisterFieldWidget(
            controller: widget.con.companyController2,
            hint: "Empresa",
            icon: Icons.apartment,
            keyboardType: TextInputType.text
          ),

          const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),

          //INIT DATE
          TextFormField(
            controller: widget.con.initDateController2,
            textAlignVertical: TextAlignVertical.center,
            decoration: const InputDecoration(
              hintText: 'Fecha de Inicio',
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
              widget.con.selectDate(context, widget.con.initDateController2);
            } 
          ),

          const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
          
          //FINISH DATE
          TextFormField(
            controller: widget.con.finishDateController2,
            textAlignVertical: TextAlignVertical.center,
            decoration: const InputDecoration(
              hintText: 'Fecha de Fin',
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
              widget.con.selectDate(context, widget.con.finishDateController2);
            } 
          ),

          const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),

          DropDownButton(
            value: widget.con.specialtyValue2,
            list: widget.con.specialtyList,
            icon: const Icon(Icons.work),
            labelText: "Especialidad",
            con: widget.con,
            field: "specialty2",
          ),

          ////////////////////////
          /// THIRD EXPERIENCE ///
          ////////////////////////
          
          const Padding(padding: EdgeInsets.symmetric(vertical: 30.0)),

          const Text(
            "Experiencia Laboral",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Utils.appNavyBlue,
              fontSize: 17.0
            ),
          ),

          const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),

          //POSITION
          RegisterFieldWidget(
            controller: widget.con.positionController3,
            hint: "Puesto",
            icon: Icons.manage_accounts_rounded,
            keyboardType: TextInputType.text
          ),

          const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),

          //COMPANY
          RegisterFieldWidget(
            controller: widget.con.companyController3,
            hint: "Empresa",
            icon: Icons.apartment,
            keyboardType: TextInputType.text
          ),

          const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),

          //INIT DATE
          TextFormField(
            controller: widget.con.initDateController3,
            textAlignVertical: TextAlignVertical.center,
            decoration: const InputDecoration(
              hintText: 'Fecha de Inicio',
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
              widget.con.selectDate(context, widget.con.initDateController3);
            } 
          ),

          const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
          
          //FINISH DATE
          TextFormField(
            controller: widget.con.finishDateController3,
            textAlignVertical: TextAlignVertical.center,
            decoration: const InputDecoration(
              hintText: 'Fecha de Fin',
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
              widget.con.selectDate(context, widget.con.finishDateController3);
            } 
          ),

          const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),

          DropDownButton(
            value: widget.con.specialtyValue3,
            list: widget.con.specialtyList,
            icon: const Icon(Icons.work),
            labelText: "Especialidad",
            con: widget.con,
            field: "specialty3",
          ),

        ]
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
  String field;

  DropDownButton({
    super.key,
    required this.value,
    required this.list,
    required this.icon,
    required this.labelText,
    required this.con,
    required this.field
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