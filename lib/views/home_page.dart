import 'package:acompany_group_app/controllers/home_page_controller.dart';
import 'package:acompany_group_app/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      init: HomePageController(),
      builder: (_) => Scaffold(
        backgroundColor: Utils.appSkyBlue,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
          
              Image.asset(
                'assets/img/acompany1.png',
                width: 150.0,
              ),
          
              const Text(
                "Pronto Podrás Buscar el empleo de tus sueños",
                style: TextStyle(
                  fontSize: 20.0,
                  color: Utils.appNavyBlue
                ),
                textAlign: TextAlign.center,
              ),
          
          
            ],
          ),
        ),
      ),
    );
  }
}