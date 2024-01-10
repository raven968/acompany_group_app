import 'dart:io';
import 'dart:async';
import 'package:acompany_group_app/models/area.dart';
import 'package:acompany_group_app/models/scholarship.dart';
import 'package:acompany_group_app/models/turn.dart';
import 'package:acompany_group_app/models/zone.dart';
import 'package:acompany_group_app/views/my_account_page_steps/step_7.dart';
import 'package:acompany_group_app/views/my_account_page_steps/step_8.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';

class MyAccountPageController extends GetxController {

  XFile? pickedFile;
  File? imageFile;

  String imagePath = 'assets/img/blank-user-profile.png';

  GlobalKey<ScaffoldState> scaffoldKey1 = GlobalKey<ScaffoldState>();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
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
  }

  void logout() {
    Get.deleteAll();
    Get.offAndToNamed('/login');
  }

  void openDrawer() {
    scaffoldKey1.currentState?.openDrawer();
  }

  void closeDrawer() {
    scaffoldKey1.currentState?.openEndDrawer();
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

  int numberOfSteps = 7;
  int lastStep = 7;

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

  static final List<Area> _areasList = [
    Area(id: 1, area: "Producción"),
    Area(id: 2, area: "Almacén"),
    Area(id: 3, area: "Calidad"),
    Area(id: 4, area: "Materialista"),
  ];

  final areaItems = _areasList
                    .map((area) => MultiSelectItem<Area>(area, area.area))
                    .toList();

  List selectedAreas = [];

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
}