import 'package:acompany_group_app/models/scholarship.dart';
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

  //STEP 2
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameFatherController = TextEditingController();
  TextEditingController lastNameMotherController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController birthdayController = TextEditingController();
  
  //STEP 3
  TextEditingController streetController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController colonyController = TextEditingController();
  TextEditingController zipController = TextEditingController();

  //STEP 5
  TextEditingController finishYearScholarship = TextEditingController();


  //SELECTS
  String stateDropDownValue = 'Chihuahua';
  String cityDropDownValue = "Meoqui";
  List<String> statesList = <String>['Chihuahua', 'CDMX', 'Guerrero']; 
  List<String> cityList = <String>['Meoqui', 'Parral', 'Delicias']; 

  String genreDrpDownValue = 'Hombre';
  String maritalStatusDropDownValue = 'Soltero';
  String economicDependentsDropDownValue = '1';

  List<String> genreList = ['Hombre', 'Mujer', 'No especifica'];
  List<String> maritalStatusList = ['Soltero', 'Casado', 'Union Libre'];
  List<String> economicDependentsList = ['1','2','3','4','5'];

  //SCHOLARSHIPS

  final List<Scholarship> scholarshipsList = [
    Scholarship(id: 1, scholarship: 'Primaria'),
    Scholarship(id: 1, scholarship: 'Secundaria'),
    Scholarship(id: 1, scholarship: 'Preparatoria/Bachillerato'),
    Scholarship(id: 1, scholarship: 'Técnica'),
    Scholarship(id: 1, scholarship: 'Licenciatura / Ingeniería'),
  ];
  

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