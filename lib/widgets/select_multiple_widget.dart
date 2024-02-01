import 'package:acompany_group_app/controllers/register_page_controller.dart';
import 'package:acompany_group_app/utils.dart';
import 'package:flutter/material.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';

class SelectMultipleWidget extends StatefulWidget {

  //VARIABLES
  String title;
  String buttonText;
  List<MultiSelectItem> items;
  List selectedItems;
  Function change;

  SelectMultipleWidget({
    super.key,
    required this.title,
    required this.buttonText,
    required this.selectedItems,
    required this.items,
    required this.change
  });

  @override
  State<SelectMultipleWidget> createState() => _SelectMultipleWidgetState();
}

class _SelectMultipleWidgetState extends State<SelectMultipleWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
        border: Border.all(
          color: Utils.appSecondBlue,
          width: 1,
        ),
      ),
      child: Column(
        children: <Widget>[
          MultiSelectBottomSheetField(
            initialChildSize: 0.4,
            listType: MultiSelectListType.CHIP,
            buttonText: Text(widget.buttonText),
            buttonIcon: const Icon(
              Icons.arrow_drop_down_circle_rounded,
              color: Utils.appSecondBlue,
            ),
            cancelText: const Text("Atrás"),
            title: Text(
              widget.title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold
              ),
            ),
            items: widget.items,
            onConfirm: (values) {
                widget.change(values);
            },
            chipDisplay: MultiSelectChipDisplay(
              onTap: (value) {
                  widget.selectedItems.remove(value);
              },
              chipColor: Utils.appSecondBlue,
              textStyle: const TextStyle(
                color: Colors.white
              ),
              icon: const Icon(
                Icons.check_circle,
                color: Colors.white,
              ),
            ),
          ),
          widget.selectedItems.isEmpty
              ? Container(
                  padding: const EdgeInsets.all(10),
                  alignment: Alignment.centerLeft,
                  child: const Text(
                    "No ha seleccionado",
                    style: TextStyle(color: Colors.black54),
                  ))
              : Container(),
        ],
      ),
    );
    
  }
}