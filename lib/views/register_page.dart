import 'dart:math';

import 'package:acompany_group_app/controllers/register_page_controller.dart';
import 'package:acompany_group_app/utils.dart';
import 'package:acompany_group_app/views/register_page_steps/step_1.dart';
import 'package:acompany_group_app/views/register_page_steps/step_2.dart';
import 'package:acompany_group_app/views/register_page_steps/step_3.dart';
import 'package:acompany_group_app/views/register_page_steps/step_4.dart';
import 'package:acompany_group_app/views/register_page_steps/step_5.dart';
import 'package:acompany_group_app/views/register_page_steps/step_6.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  static GlobalKey<Step1State> step1Key = GlobalKey<Step1State>();
  static GlobalKey<Step1State> step4Key = GlobalKey<Step1State>();
  static GlobalKey<Step1State> step5Key = GlobalKey<Step1State>();

  @override
  Widget build(BuildContext context) {

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return GetBuilder<RegisterPageController>(
      init: RegisterPageController(),
      builder: (_) => GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          backgroundColor: Utils.appSkyBlue,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: height * .21,
                  width: width,
                  child: CustomPaint(
                    painter: CurvePainter(),
                  ),
                ),
                const Text(
                  "Regístrate!",
                  style: TextStyle(
                    color: Utils.appNavyBlue,
                    fontSize: 24.0,
                    
                  ),
                ),
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
                              onPressed: _.lastStep == _.currentStep ? _.register : details.onStepContinue,
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
      )
    );
  }
}


class CurvePainter extends CustomPainter {
  @override
 void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Utils.appSecondBlue;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * 0.65);
    path.quadraticBezierTo(size.width / 2, size.height / 2,
        size.width, size.height * 0.65);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
