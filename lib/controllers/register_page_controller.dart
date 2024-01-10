import 'dart:developer';

import 'package:acompany_group_app/models/area.dart';
import 'package:acompany_group_app/models/scholarship.dart';
import 'package:acompany_group_app/models/turn.dart';
import 'package:acompany_group_app/utils.dart';
import 'package:acompany_group_app/views/register_page_steps/step_7.dart';
import 'package:acompany_group_app/views/register_page_steps/step_8.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';


import '../models/zone.dart';

class RegisterPageController extends GetxController {

  int currentStep = 0;

  int numberOfSteps = 5;
  int lastStep = 5;

  List optionalSteps = [];

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

  //STEP 7
  TextEditingController  positionController = TextEditingController();
  TextEditingController  companyController = TextEditingController();
  TextEditingController  initDateController = TextEditingController();
  TextEditingController  finishDateController = TextEditingController();
  //STEP 7 SECOND
  TextEditingController  positionController2 = TextEditingController();
  TextEditingController  companyController2 = TextEditingController();
  TextEditingController  initDateController2 = TextEditingController();
  TextEditingController  finishDateController2 = TextEditingController();
  //STEP 7 THIRD
  TextEditingController  positionController3 = TextEditingController();
  TextEditingController  companyController3 = TextEditingController();
  TextEditingController  initDateController3 = TextEditingController();
  TextEditingController  finishDateController3 = TextEditingController();
  


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

  List<String> firstWorkList = ['SI', 'NO'];
  String firstWorkValue = 'NO';
  List<String> fiscalSituationList = ['SI', 'NO', 'NO SE'];
  String fiscalSituationValue = 'SI';

  //STEP 7
  List<String> specialtyList = ['Producción', 'Calidad', 'Almacén'];
  String specialtyValue = 'Producción';
  //STEP 7 SECOND EXPERIENCE
  String specialtyValue2 = 'Producción';
  //STEP 7 THIRD EXPERIENCE
  String specialtyValue3 = 'Producción';

  //STEP 8 AREAS LIST
  TextEditingController haveSpecialtyController = TextEditingController();

  List<Area> areasList = [];

  List<MultiSelectItem<Area>> areaItems = [];

  List selectedAreas = [];

  //SCHOLARSHIPS

  List<Scholarship> scholarshipsList = [];
  Scholarship scholarshipValue = Scholarship();
  

  //ZONES
  List<Zone> _zonesList = [];
  List<MultiSelectItem<Zone>> zoneItems = [];
  List selectedZones = [];

  //TURNS
  List<Turn> _turnsList = [];
  List<MultiSelectItem<Turn>> turnItems = [];
  List selectedTurns = [];


  //###############################//
  //--------- FUNCTIONS -----------//
  //###############################//

  @override
  void onInit() {
    super.onInit();
    getAreas();
    getStates();
    getCities();
    getZones();
    getTurns();
    getScholarchips();
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    // OPTIONAL STEPS
    optionalSteps = [
      Step(
        title: Text(""),
        content: Step7(con: this),
        isActive: currentStep == 6,
        state: stepState(6),
      ),
      Step(
        title: Text(""),
        content: Step8(con: this,),
        isActive: currentStep == 7,
        state: stepState(7),
      )
    ];

    numberOfSteps = 7;
    lastStep = 7;
  }

  void nextStep() {
    if(currentStep >= numberOfSteps) {
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

  Future<void> selectDate(BuildContext context, TextEditingController con) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      locale: const Locale('es')
    );

    if (picked != null && picked != selectedDate) {
      con.text = format.format(picked);
      update();
    }
  }

  changeNumberOfSteps(value) {
    if(value == 'NO'){
      numberOfSteps = 7;
      lastStep = 7;
    }else{
      numberOfSteps = 5;
      lastStep = 5;
    }
    firstWorkValue = value;
    update();
  }

  void getAreas() async {
    areasList = await Utils.getAreas();

    areaItems = areasList
                    .map((area) => MultiSelectItem<Area>(area, area.area))
                    .toList();               
  }

  void getZones() async {
    _zonesList = await Utils.getZones();

    zoneItems = _zonesList
      .map((zone) => MultiSelectItem<Zone>(zone, zone.zone))
      .toList();

  }

  void getTurns() async {

    _turnsList = await Utils.getTurns();

    turnItems = _turnsList
        .map((turn) => MultiSelectItem<Turn>(turn, turn.turn)).toList();

  }

  void getScholarchips() async {
    scholarshipsList = await Utils.getEducationLevels();
    scholarshipValue = scholarshipsList.first;
    inspect(scholarshipsList);
  }

  void getStates() async {
    statesList =  await Utils.getStates();
    update();
  }

  void getCities() async {
    
    cityList = await Utils.getCities(stateDropDownValue);
    cityDropDownValue = cityList.first;
    update();
  }

  List getListOfState() {
    return statesList;
  }

  List getListOfCities() {
    return cityList;
  }

  void changeStateValue(value) {
    
    stateDropDownValue = value;
    getCities();
  }

  void changeCityValue(value) {
    cityDropDownValue = value;
  }

  void register() {
    print('hello');
  }

}