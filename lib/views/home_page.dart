import 'package:acompany_group_app/controllers/home_page_controller.dart';
import 'package:acompany_group_app/utils.dart';
import 'package:acompany_group_app/widgets/side_menu.dart';
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

    //SiZES OF THE DEVICE
    double height = MediaQuery.of(context).size.height;
    //double width = MediaQuery.of(context).size.width;

    return GetBuilder<HomePageController>(
      init: HomePageController(),
      builder: (_) => Scaffold(
        key: _.scaffoldKey,
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