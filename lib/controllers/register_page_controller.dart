import 'package:acompany_group_app/models/turn.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';


import '../models/zone.dart';

class RegisterPageController extends GetxController {

  int currentStep = 0;

  //BIRTHDAY
  DateTime? selectedDate;
  DateFormat format = DateFormat('dd/M/yyyy');

  //CONTROLLERS
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameFatherController = TextEditingController();
  TextEditingController lastNameMotherController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();

  //SELECTS
  String stateDropDownValue = 'Chihuahua';
  String cityDropDownValue = "Meoqui";
  List<String> statesList = <String>['Chihuahua', 'CDMX', 'Guerrero']; 
  List<String> cityList = <String>['Meoqui', 'Parral', 'Delicias']; 

  //ZONES
  static final List<Zone> _zonesList = <Zone>[
    Zone(id: 1, zone:"Norte"),
    Zone(id: 2, zone:"Centro"),
    Zone(id: 3, zone:"Sur"),
  ];
  final zoneItems = _zonesList
      .map((zone) => MultiSelectItem<Zone>(zone, zone.zone))
      .toList();
  List selectedZones = [];

  //TURNS
  static final List<Turn> _turnsList = <Turn> [
    Turn(id: 1, turn: "Horarios Fijos"),
    Turn(id: 2, turn: "Turno Matutino"),
    Turn(id: 3, turn: "Turno Vespertino"),
    Turn(id: 4, turn: "Turno Nocturno"),
    Turn(id: 5, turn: "3x2"),
    Turn(id: 6, turn: "Turnos Rotativos"),
    Turn(id: 7, turn: "Fin de Semana"),
  ];
  final turnItems = _turnsList
        .map((turn) => MultiSelectItem<Turn>(turn, turn.turn)).toList();
  List selectedTurns = [];


  //###############################//
  //--------- FUNCTIONS -----------//
  //###############################//
  void nextStep() {
    if(currentStep >= 8) {
      return;
    } 
    currentStep++;
    update();
  }

  void previewStep() {
    if(currentStep <= 0) {
      return;
    } 
    currentStep--;
    update();
  }

  stepState(int step) {
    if(currentStep > step) {
      return StepState.complete;
    }else{
      return StepState.editing;
    }
  }

  void stepTaped(step) {
    currentStep = step;
  }

  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      locale: const Locale('es')
    );

    if (picked != null && picked != selectedDate) {
      birthdayController.text = format.format(picked);
      update();
    }
  }

}