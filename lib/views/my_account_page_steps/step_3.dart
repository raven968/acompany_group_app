import 'package:acompany_group_app/controllers/my_account_page_controller.dart';
import 'package:acompany_group_app/widgets/register_field_widget.dart';
import 'package:flutter/material.dart';

class Step3 extends StatefulWidget {

  //VARIABLES
  final MyAccountPageController con;

  const Step3({super.key, required this.con});

  @override
  State<Step3> createState() => _Step3State();
}

class _Step3State extends State<Step3> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        children: [
          const Text(
            "Dirección:",
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold
            ),
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
          //STREET
          RegisterFieldWidget(
            controller: widget.con.streetController,
            hint: "Calle", 
            icon: Icons.house,
            keyboardType: TextInputType.text,
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),

          //NUMBER
          RegisterFieldWidget(
            controller: widget.con.numberController,
            hint: "Numero", 
            icon: Icons.numbers,
            keyboardType: TextInputType.number,
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),

          //COLONY
          RegisterFieldWidget(
            controller: widget.con.colonyController,
            hint: "Colonia", 
            icon: Icons.location_city,
            keyboardType: TextInputType.text,
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),

          //ZIP
          RegisterFieldWidget(
            controller: widget.con.zipController,
            hint: "Código Postal", 
            icon: Icons.local_post_office,
            keyboardType: TextInputType.text,
          ),
          const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
        ],
      ),
    );
  }
}