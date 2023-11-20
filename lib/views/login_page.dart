import 'package:acompany_group_app/controllers/login_page_controller.dart';
import 'package:acompany_group_app/utils.dart';
import 'package:acompany_group_app/widgets/field.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {

    //Sizes
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    return GetBuilder<LoginPageController>(
      init: LoginPageController(),
      builder: (_) => GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
              width: width,
              height: height,
              color: Utils.appSkyBlue,
              child: Stack(
                children: [
                  CustomPaint(
                    size: Size.square(height),
                    painter: CurvePainter(),
                  ),
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
          
                        const Padding(padding: EdgeInsets.symmetric(vertical: 8.0)),
          
                        //--- IMAGE ---//
          
                        Image.asset(
                          'assets/img/acompany1.png',
                          width: 150.0,
                        ),
          
                        //--- IMAGE ENDS ---//
          
                        const Padding(padding: EdgeInsets.symmetric(vertical: 25.0)),
          
                        //--- FIELDS ---//
          
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                          maxWidth: 300, minWidth: 300),
                          child: Column(
                            children: <Widget>[
                              Field(
                                  type: 'usuario',
                                  controller: _.emailController
                              ),
          
                              const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
                              
                              TextFormField(
                                controller: _.passwordController,
                                textAlignVertical: TextAlignVertical.center,
                                decoration: InputDecoration(
                                  hintText: 'Contraseña',
                                  hintStyle: const TextStyle(
                                    color: Color.fromARGB(125, 6, 40, 61)
                                  ),
                                  prefixIcon: const Icon(
                                    Icons.lock,
                                    color: Utils.appNavyBlue,
                                  ),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Utils.appNavyBlue
                                    )
                                  ),
                                  focusedBorder: const UnderlineInputBorder(),
                                  contentPadding: const EdgeInsets.fromLTRB(0, 1, 0, 1),
                                  suffixIcon: GestureDetector(
                                    child: Icon(
                                      !_.show ? Icons.visibility : Icons.visibility_off,
                                      color: Utils.appNavyBlue,
                                    ),
                                    onTap: () {_.changeShowPassword();},
                                  ), 
                                ),
                                obscureText: _.show,
                                autocorrect: false,
                                enableSuggestions: false,
                                
                              ),
          
                              const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),
          
                              const Text(
                                'Tu Contraseña es tu fecha de nacimiento en 8 dígitos Ejem: 13091996.',
                                style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.black54
                                ),
                                textAlign: TextAlign.center,
                              )
          
                            ],
                          ),
                        ),
          
                        //--- FIELD ENDS ---//

                        const Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),

                        //--- SING IN BUTTONS ---//
                        ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxWidth: 300,
                            minWidth: 300,
                          ),
                          child: Column(
                            children: [

                              //--- LOGIN BUTTON ---//
                              ElevatedButton(
                                onPressed: () {},
                                style: ButtonStyle(
                                  backgroundColor: Utils.materialAppNavyBlue,
                                  minimumSize: MaterialStateProperty.all(const Size(300,50)),
                                ),
                                child: const Text(
                                  'Iniciar Sesión',
                                  style: TextStyle(
                                    color: Colors.white
                                  ),
                                ),
                                
                              ),

                              const Padding(padding: EdgeInsets.symmetric(vertical: 10.0)),
                              const Text(
                                'Aun no tienes Cuenta?',
                                style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 10.0,
                                ),
                              ),
                              const Padding(padding: EdgeInsets.symmetric(vertical: 5.0)),

                              //--- REGISTER BUTTON ---//
                              ElevatedButton(
                                onPressed: () {
                                  _.goToRegisterPage();
                                },
                                style: ButtonStyle(
                                  backgroundColor: Utils.materialAppSkyBlue,
                                  minimumSize: MaterialStateProperty.all(const Size(300,50)),
                                  side: MaterialStateProperty.all(const BorderSide(color: Utils.appNavyBlue))
                                ),
                                child: const Text(
                                  'Regístrate',
                                  style: TextStyle(
                                    color: Utils.appNavyBlue
                                  ),
                                ),
                                
                              ),


                            ],
                          ),
                        ),
                        //--- SING IN BUTTONS ENDS ---//
          
          
                      ],
                    ),
                  ),
                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CurvePainter extends CustomPainter {
  @override
 void paint(Canvas canvas, Size size) {
    var paint = Paint();
    paint.color = Utils.appNavyBlue;
    paint.style = PaintingStyle.fill;

    var path = Path();

    path.moveTo(0, size.height * 0.9167);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.875,
        size.width * 0.5, size.height * 0.9167);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9584,
        size.width * 1.0, size.height * 0.9167);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
