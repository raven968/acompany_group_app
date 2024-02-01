import 'package:acompany_group_app/controllers/my_account_page_controller.dart';
import 'package:acompany_group_app/utils.dart';
import 'package:acompany_group_app/views/my_account_page_steps/step_1.dart';
import 'package:acompany_group_app/views/my_account_page_steps/step_2.dart';
import 'package:acompany_group_app/views/my_account_page_steps/step_3.dart';
import 'package:acompany_group_app/views/my_account_page_steps/step_4.dart';
import 'package:acompany_group_app/views/my_account_page_steps/step_5.dart';
import 'package:acompany_group_app/views/my_account_page_steps/step_6.dart';
import 'package:acompany_group_app/widgets/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({super.key});

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {

  static GlobalKey<Step1State> step1Key = GlobalKey<Step1State>();
  static GlobalKey<Step1State> step4Key = GlobalKey<Step1State>();
  static GlobalKey<Step1State> step5Key = GlobalKey<Step1State>();

  @override
  Widget build(BuildContext context) {

    //SiZES OF THE DEVICE
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return GetBuilder<MyAccountPageController>(
      init: MyAccountPageController(),
      builder: (_) => Scaffold(
        key: _.scaffoldKey1,
        drawer: Container(
            padding: EdgeInsets.only(top: height * .12, bottom: height * .12),
            child: const SideMenu()),
        appBar: AppBar(
          backgroundColor: Utils.appSecondBlue,
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {
              _.openDrawer();
            },
          ),
          actions: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.white,
                    size: 20.0,
                  ),
                  onPressed: () {
                    _.logout();
                  },
                ),
                const Text(
                  "Cerrar Sesión",
                  style: TextStyle(color: Colors.white, fontSize: 13.0),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.0),
                ),
              ],
            )
          ],
        ),
        backgroundColor: Utils.appSkyBlue,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
            
                const Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),
            
                GestureDetector(
                  onTap: () { _.showAlertDialog(); },
                  child: CircleAvatar(
                    backgroundImage: AssetImage(_.imagePath),
                    backgroundColor: Utils.appSkyBlue,
                    radius: (width * .20),
                  ),
                ),

                const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),

                Text(
                  '${_.name} ${_.lastName}',
                  style: const TextStyle(
                    fontSize: 18.0
                  ),
                ),

                const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),

                const Text(
                  "Mis Datos:",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22.0,
                    fontWeight: FontWeight.bold
                  ),
                ),

                const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
            
                Container(
                    color: Utils.appSkyBlue,
                    key: Key("mysuperkey-" +  _.numberOfSteps.toString()),
                    child: Stepper(
                      currentStep: _.currentStep,
                      onStepContinue: () {
                        setState(() {
                          _.nextStep();
                        });
                      },
                      onStepCancel: () {
                        setState(() {
                          _.previewStep();
                        });
                      },
                      onStepTapped: (step) {
                        setState(() {
                          _.stepTaped(step);
                        });
                      },
                      connectorColor: Utils.materialAppSecondBlue,
                      physics: const ClampingScrollPhysics(),
                      controlsBuilder: (context, details) {
                        return Padding(
                          padding: const EdgeInsets.only(top: 25.0),
                          child: Row(
                            children: <Widget>[
                              ElevatedButton(
                                onPressed: details.onStepContinue,
                                style: ButtonStyle(
                                  side: MaterialStateProperty.all(const BorderSide(color: Utils.appSecondBlue)),
                                  backgroundColor: MaterialStateProperty.all(Utils.appSkyBlue)
                                ),
                                child: Text(
                                  _.lastStep == _.currentStep ? 'Registrarme!' : 'Sig.',
                                  style: const TextStyle(
                                    color: Utils.appSecondBlue
                                  ),
                                ),
                              ),
                              if (_.currentStep != 0)
                                TextButton(
                                  onPressed: details.onStepCancel,
                                  child: const Text(
                                    'Atrás',
                                    style: TextStyle(color: Colors.grey),
                                  ),
                                ),
                            ],
                          ),
                        );
                      },
                      steps: [
                    
                        //##############//
                        //    STEP 1    //
                        //##############//
                    
                        Step(
                          title: const Text(""),
                          content: Step1(con: _, key: step1Key,),
                          isActive: _.currentStep == 0,
                          state: _.stepState(0)
                        ),
                    
                        //##############//
                        //    STEP 2    //
                        //##############//
                    
                        Step(
                          title: const Text(""),
                          isActive: _.currentStep == 1,
                          state: _.stepState(1),
                          content: Step2(con: _),
                        ),
                        Step(
                          title: const Text(""),
                          content: Step3(con: _),
                          isActive: _.currentStep == 2,
                          state: _.stepState(2),
                        ),
                        Step(
                          title: const Text(""),
                          content: Step4(con: _, key: step4Key,),
                          isActive: _.currentStep == 3,
                          state: _.stepState(3),
                        ),
                        Step(
                          title: const Text(""),
                          content: Step5(con: _, key: step5Key,),
                          isActive: _.currentStep == 4,
                          state: _.stepState(4),
                        ),
                        Step(
                          title: const Text(""),
                          content: Step6(con: _),
                          isActive: _.currentStep == 5,
                          state: _.stepState(5),
                        ),
                    
                        if(_.numberOfSteps  > 5 )
                          ..._.optionalSteps 
                        else  
                          const Step(title: Text(""), content: SizedBox(height: 80.0,)), 
                          
                        
                      ],
                    ),
                  ),
            
            
              ],
            ),
          ),
        ),
      ),
    );
  }
}