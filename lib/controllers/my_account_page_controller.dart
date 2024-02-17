import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:async';
import 'package:acompany_group_app/models/area.dart';
import 'package:acompany_group_app/models/scholarship.dart';
import 'package:acompany_group_app/models/turn.dart';
import 'package:acompany_group_app/models/user.dart';
import 'package:acompany_group_app/models/zone.dart';
import 'package:acompany_group_app/utils.dart';
import 'package:acompany_group_app/views/my_account_page_steps/step_7.dart';
import 'package:acompany_group_app/views/my_account_page_steps/step_8.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyAccountPageController extends GetxController {

  XFile? pickedFile;
  File? imageFile;
  bool isLoading2 = true;

  bool hasPhoto = false;
  bool isFromUrl = false;

  String name = '';
  String lastName = '';
  Map<String, dynamic> user = {};

  String imagePath = 'assets/img/blank-user-profile.png';

  GlobalKey<ScaffoldState> scaffoldKey2 = GlobalKey<ScaffoldState>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAreas();
    getStates();
    //getCities();
    getZones();
    getTurns();
    getScholarchips();
    getName();
    getUser();
  }

  Future getUser() async {
    final prefs = await SharedPreferences.getInstance();
    String id = prefs.getString('user_id') ?? '';
    user = await Utils.me(id);
    
    stateDropDownValue = user['state'];
    getCities();
   
    Future.delayed(const Duration(seconds: 3), () {
      isLoading2 = false;
      cityDropDownValue = user['city'];
      genreDrpDownValue = user['genre'];
      maritalStatusDropDownValue = user['marital_status'];
      economicDependentsDropDownValue = user['economic_dependents'];
      scholarshipValue = scholarshipsList.firstWhere((el) => el.id == user['education_level_id']);
      if(user['education_level_finish'] != null) {finishYearScholarship.text = user['education_level_finish'].split(' ')[0].split('-').join('/'); }else{ finishYearScholarship.text = '';}
      firstWorkValue = user['first_work'];
      fiscalSituationValue = user['fiscal_situation'];

      if(user['image'] != null){
        imagePath = 'https://operadoresmaquiladora.com/${user['image']}';
        isFromUrl = true;
      }

      positionController.text = user['position1'] ?? '';
      companyController.text = user['company1'] ?? '';
      if(user['init_date1'] != null) { initDateController.text = user['init_date1'].split(' ')[0].split('-').join('/');}else{ initDateController.text = '';}
      if(user['finish_date1'] != null) { finishDateController.text = user['finish_date1'].split(' ')[0].split('-').join('/'); }else{ finishDateController.text = '';}
      specialtyValue = user['specialty1'] ?? '';

      positionController2.text = user['position2'] ?? '';
      companyController2.text = user['company2'] ?? '';
      if(user['init_date2'] != null) { initDateController2.text = user['init_date2'].split(' ')[0].split('-').join('/');}else{ initDateController2.text = '';}
      if(user['finish_date2'] != null) { finishDateController2.text = user['finish_date2'].split(' ')[0].split('-').join('/'); }else{ finishDateController2.text = '';}
      specialtyValue2 = user['specialty2'] ?? '';

      positionController3.text = user['position3'] ?? '';
      companyController3.text = user['company3'] ?? '';
      if(user['init_date3'] != null) { initDateController3.text = user['init_date3'].split(' ')[0].split('-').join('/');}else{ initDateController3.text = '';}
      if(user['finish_date3'] != null) { finishDateController3.text = user['finish_date3'].split(' ')[0].split('-').join('/'); }else{ finishDateController3.text = '';}
      specialtyValue3 = user['specialty3'] ?? '';
      haveSpecialtyController.text = user['description'] ?? '';
      
      selectedZones = _zonesList.where((objeto1) => user['zones'].any((objeto2) => objeto2['zone']['id'] == objeto1.id)).toList();
      selectedTurns = _turnsList.where((objeto1) => user['turns'].any((objeto2) => objeto2['turn']['id'] == objeto1.id)).toList();
      selectedAreas = areasList.where((objeto1) => user['areas'].any((objeto2) => objeto2['area']['id'] == objeto1.id)).toList();

      nameController.text = user['name'] ?? '';
      lastNameFatherController.text = user['last_name_father'] ?? '';
      lastNameMotherController.text = user['last_name_mother'] ?? '';
      phoneController.text = user['cellphone'] ?? '';
      phoneController.text = user['cellphone'] ?? '';
      birthdayController.text = user['birthday'].split(' ')[0].split('-').join('/') ?? '';
      streetController.text = user['street'] ?? '';
      numberController.text = user['street_number'] ?? '';
      colonyController.text = user['colony'] ?? '';
      zipController.text = user['zip'] ?? '';
      update();
    });

  }

  void getName() async {
    final prefs = await SharedPreferences.getInstance();
    name = prefs.getString('user_name') ?? '';
    lastName = prefs.getString('user_last_name') ?? '';
    update();
  }

  void logout() {
    Get.deleteAll();
    Get.offAndToNamed('/login');
  }

  void openDrawer() {
    scaffoldKey2.currentState?.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey2.currentState?.openEndDrawer();
  }


  // IMAGE ROUTE //

  void showAlertDialog() {
    Widget galleryButton = TextButton(
        onPressed: () {
          getImageFromGallery(ImageSource.gallery);
        },
        child: const Text('GALERIA'));

    Widget cameraButton = TextButton(
        onPressed: () {
          getImageFromGallery(ImageSource.camera);
        },
        child: const Text('CAMARA'));

    Get.defaultDialog(
      title: "Selecciona tu imagen",
      content: Row(children: [galleryButton, cameraButton],) 
    );
  }

  Future getImageFromGallery(ImageSource imageSource) async {
    pickedFile = await ImagePicker().pickImage(source: imageSource);
    if (pickedFile != null) {
      imageFile = File(pickedFile!.path);
      imagePath = pickedFile!.path;
      hasPhoto = true;
      isFromUrl = false;
      uploadPhoto(imagePath);
    } else {
      print('No selecciono ninguna imagen');
    }
    Get.back();
    update();
  }


  ////////////////////////////////////
  //////ALL STEPPER LOGIC HERE///////
  //////////////////////////////////
  
    int currentStep = 0;

  bool isLoading = false;

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

    User user2 = User(
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
      educationLevelFinish: finishYearScholarship.text,
      firstWork: firstWorkValue,
      fiscalSituation: fiscalSituationValue,
      position1: positionController.text,
      company1: companyController.text,
      initDate1: initDateController.text,
      finishDate1: finishDateController.text,
      specialty1: specialtyValue,
      position2: positionController2.text,
      company2: companyController2.text,
      initDate2: initDateController2.text,
      finishDate2: finishDateController2.text,
      specialty2: specialtyValue2,
      position3: positionController3.text,
      company3: companyController3.text,
      initDate3: initDateController3.text,
      finishDate3: finishDateController.text,
      specialty3: specialtyValue,
      description: haveSpecialtyController.text,
      zones: zones, 
      areas: areas, 
      turns: turns, 
      password: password
    );

    print(json.encode(user2.toJson()));
    String jsonUser = json.encode(user2.toJson());
    print(error);
    if(error == 0) {
      isLoading = true;
      update();

      String register = await Utils.updateUser(jsonUser, user['id']);
      print(register);
      if(register == "OK") {
        isLoading = false;
        Get.deleteAll();
        Get.offAndToNamed("/home");
        update();
      }
    }


  }

  void uploadPhoto(path) {
    if (path == null) return;

    Utils.uploadPhotoToApi(path);
  }
  
}