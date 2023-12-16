import 'package:acompany_group_app/controllers/side_menu_controller.dart';
import 'package:acompany_group_app/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class SideMenu extends StatefulWidget {
  const SideMenu({super.key});

  @override
  State<SideMenu> createState() => _SideMenuState();
}

class _SideMenuState extends State<SideMenu> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SideMenuController>(
      init: SideMenuController(),
      builder: (_) => Drawer(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0))),
        //CHILD OF DRAWER
        child: ListView(
          children: [

            ListTile(
              title: const Text("Inicio"),
              leading: const Icon(
                Icons.home,
                color: Utils.appSecondBlue,
              ),
              onTap: () {
                _.goToHomePage();
              },
            ),

            ListTile(
              title: const Text("Mi Cuenta"),
              leading: const Icon(
                Icons.person,
                color: Utils.appSecondBlue,
              ),
              onTap: () {
                _.goToMyAccountPage();
              },
            ),

            const Divider(
              height: 20.0,
              indent: 20.0,
              endIndent: 20.0,
            ),

            GestureDetector(
              child: const ListTile(
                title: Text(
                  "Cerrar Sesión",
                  style: TextStyle(
                      color: Utils.appSecondBlue,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold),
                ),
              ),
              onTap: () {
                _.logout();
              },
            ),
            
          ],
        ),
      ),
    );
  }
}