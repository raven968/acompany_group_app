import 'dart:convert';
import 'dart:developer';

import 'package:acompany_group_app/models/area.dart';
import 'package:acompany_group_app/models/scholarship.dart';
import 'package:acompany_group_app/models/turn.dart';
import 'package:acompany_group_app/models/user.dart';
import 'package:acompany_group_app/utils.dart';
import 'package:acompany_group_app/views/register_page_steps/step_7.dart';
import 'package:acompany_group_app/views/register_page_steps/step_8.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';


import '../models/zone.dart';

class RegisterPageController extends GetxController {

  int currentStep = 0;

  bool isLoading = true;

  int numberOfSteps = 5;
  int lastStep = 5;

  List optionalSteps = [];

  //BIRTHDAY
  DateTime? selectedDate;
  DateFormat format = DateFormat('yyyy/MM/dd');

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
  List<String> economicDependentsList = ['0','1','2','3','4','5'];

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

  List<String> educationStatusList = ['Trunco', 'Terminado'];
  String educationStatusValue = 'Trunco';
  
  //ANTIQUITY
  List<String> antiquityList = ['1 a 3 meses', '3 a 6 meses', '6 a 12 meses', '1 a 2 años', 'Mas de 2 años'];
  String antiquityValue = '1 a 3 meses';
  String antiquityValue2 = '1 a 3 meses';
  String antiquityValue3 = '1 a 3 meses';

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
    getSpecialties();
    getStates();
    getCities();
    getZones();
    getTurns();
    getScholarchips();
    setLoading();
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

  void setLoading() {
    Future.delayed(const Duration(seconds: 3),(){
      isLoading = false;
      update();
    });
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

  void getSpecialties() async {
    specialtyList = await Utils.getSpecialties();
    specialtyValue = specialtyList.first;
    specialtyValue2 = specialtyList.first;
    specialtyValue3 = specialtyList.first;
  }

  void getScholarchips() async {
    scholarshipsList = await Utils.getEducationLevels();
    scholarshipValue = scholarshipsList.first;
    
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

  void changeSelectedZones(values) {
    selectedZones = values;
    //update();
    inspect(selectedZones);
  }

  void changeSelectedTurns(values) {
    selectedTurns = values;
    //update();
  }

  void changeSelectedAreas(values) {
    selectedAreas = values;
    //update();
  }

  void changeValue(value, variable) {
    if(variable == "genre") {
      genreDrpDownValue = value;
    }else if(variable == "economicDependents"){
      economicDependentsDropDownValue = value;
    }else if(variable == "maritalStatus"){
      maritalStatusDropDownValue = value;
    }else if(variable == "scholarship"){
      scholarshipValue = value;
    }else if(variable == "fiscal"){
      fiscalSituationValue = value;
    }else if(variable == "antiquity"){
      antiquityValue = value;
    }else if(variable == "antiquity2"){
      antiquityValue2 = value;
    }else if(variable == "antiquity3"){
      antiquityValue3 = value;
    }else if(variable == 'Estatus'){
      educationStatusValue = value;
    }else if(variable == "specialty"){
      specialtyValue = value;
    }else if(variable == "specialty2"){
      specialtyValue2 = value;
    }else if(variable == "specialty3"){
      specialtyValue3 = value;
    }
    update();
  }

  void register() async {

    List zones = selectedZones.map((e) => {
      'zone_id': e.id
    }).toList();

    List areas = selectedAreas.map((e) => {
      'area_id': e.id
    }).toList();

    List turns = selectedTurns.map((e) => {
      'turn_id': e.id
    }).toList();

    int error = 0;

    String password;
    if(birthdayController.text.isNotEmpty){
      password = birthdayController.text.split('/').reversed.join('');
    }else{
      Get.defaultDialog(
        title: "Error",
        content: const Text("Por favor inserta una fecha de nacimiento")
      );
      password = '';
      error += 1;
    }

    if(phoneController.text.isEmpty){
      error++;
      Get.defaultDialog(
        title: "Error",
        content: const Text("Inserta un valor en el teléfono por favor")
      );
    }
    if(phoneController.text.length != 10) {
      error++;
      Get.defaultDialog(
        title: "Error" ,
        content: const Text("El celular debe tener 10 números, Ejemplo: '6141182833'")
      );
    }

    User user = User(
      name: nameController.text,
      lastNameFather: lastNameFatherController.text,
      lastNameMother: lastNameMotherController.text,
      cellphone: phoneController.text,
      birthday: birthdayController.text,
      street: streetController.text,
      streetNumber: numberController.text,
      colony: colonyController.text,
      zip: zipController.text,
      state: stateDropDownValue,
      city: cityDropDownValue,
      genre: genreDrpDownValue,
      maritalStatus: maritalStatusDropDownValue,
      economicDependents: economicDependentsDropDownValue,
      educationLevelId: scholarshipValue.id,
      educationStatus: educationStatusValue,
      firstWork: firstWorkValue,
      fiscalSituation: fiscalSituationValue,
      position1: positionController.text,
      company1: companyController.text,
      antiquity1: antiquityValue,
      finishYear1: initDateController.text,
      specialty1: specialtyValue,
      position2: positionController2.text,
      company2: companyController2.text,
      antiquity2: antiquityValue2,
      finishYear2: initDateController2.text,
      specialty2: specialtyValue2,
      position3: positionController3.text,
      company3: companyController3.text,
      antiquity3: antiquityValue3,
      finishYear3: initDateController3.text,
      specialty3: specialtyValue,
      description: haveSpecialtyController.text,
      zones: zones, 
      areas: areas, 
      turns: turns, 
      password: password
    );

    print(json.encode(user.toJson()));
    String jsonUser = json.encode(user.toJson());
    print(error);
    if(error == 0) {
      isLoading = true;
      update();

      String register = await Utils.registerUser(jsonUser);
      print(register);
      if(register == "OK") {
        await Utils.login(phoneController.text, password );
        isLoading = false;
        update();
      }
    }


  }

}