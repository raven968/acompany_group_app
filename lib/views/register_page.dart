import 'package:acompany_group_app/controllers/register_page_controller.dart';
import 'package:acompany_group_app/utils.dart';
import 'package:acompany_group_app/views/register_page_steps/step_1.dart';
import 'package:acompany_group_app/views/register_page_steps/step_2.dart';
import 'package:acompany_group_app/widgets/register_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterPageController>(
      init: RegisterPageController(),
      builder: (_) => GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          body: SafeArea(
            child: Container(
              color: Utils.appSkyBlue,
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
                connectorColor: Utils.materialAppNavyBlue,
                controlsBuilder: (context, details) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 25.0),
                    child: Row(
                      children: <Widget>[
                        ElevatedButton(
                          onPressed: details.onStepContinue,
                          style: ButtonStyle(
                            side: MaterialStateProperty.all(const BorderSide(color: Utils.appNavyBlue)),
                            backgroundColor: MaterialStateProperty.all(Utils.appSkyBlue)
                          ),
                          child: const Text(
                            'Sig.',
                            style: TextStyle(
                              color: Utils.appNavyBlue
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
                    content: Step1(con: _),
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
                    content: SizedBox(height: 110.0,),
                    isActive: _.currentStep == 2,
                    state: _.stepState(2),
                  ),
                  Step(
                    title: Text("STEP 4"),
                    content: SizedBox(height: 110.0,),
                    isActive: _.currentStep == 3,
                    state: _.stepState(3),
                  ),
                  Step(
                    title: Text("STEP 5"),
                    content: SizedBox(height: 110.0,),
                    isActive: _.currentStep == 4,
                    state: _.stepState(4),
                  ),
                  Step(
                    title: Text("STEP 6"),
                    content: SizedBox(height: 110.0,),
                    isActive: _.currentStep == 5,
                    state: _.stepState(5),
                  ),
                  Step(
                    title: Text("STEP 7"),
                    content: SizedBox(height: 110.0,),
                    isActive: _.currentStep == 6,
                    state: _.stepState(6),
                  ),
                  Step(
                    title: Text("STEP 8"),
                    content: SizedBox(height: 110.0,),
                    isActive: _.currentStep == 7,
                    state: _.stepState(7),
                  ),
                  Step(
                    title: Text("STEP 9"),
                    content: SizedBox(height: 110.0,),
                    isActive: _.currentStep == 8,
                    state: _.stepState(8),
                  ),
                ],
              ),
            ),
          ),
        ),
      )
    );
  }
}
