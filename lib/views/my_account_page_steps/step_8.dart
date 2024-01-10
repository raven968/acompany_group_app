import 'package:acompany_group_app/controllers/my_account_page_controller.dart';
import 'package:acompany_group_app/controllers/register_page_controller.dart';
import 'package:acompany_group_app/widgets/select_multiple_widget.dart';
import 'package:flutter/material.dart';

class Step8 extends StatefulWidget {

  final MyAccountPageController con;

  const Step8({
    super.key,
    required this.con
  });

  @override
  State<Step8> createState() => _Step8State();
}

class _Step8State extends State<Step8> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [

          //---- ZONES ----//
          const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
          SelectMultipleWidget(
            title: "Areas de Experiencia",
            buttonText: "Areas de Experiencia",
            selectedItems: widget.con.selectedAreas,
            items: widget.con.areaItems
          ),

          const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),

          const Text(
            "A continuación menciona si tienes alguna especialidad o manejas alguna maquina:"
          ),

          const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),

          TextFormField(
            controller: widget.con.haveSpecialtyController,
            maxLines: 3,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(
                  color: Colors.grey.shade500
                )
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(
                  color: Colors.grey.shade500, 
                  width: .5
                )
              ),
            ),
          )

        ]
      ),
    );
  }
}