import 'package:acompany_group_app/controllers/my_account_page_controller.dart';
import 'package:acompany_group_app/utils.dart';
import 'package:acompany_group_app/widgets/side_menu.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({super.key});

  @override
  State<MyAccountPage> createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
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
          child: Column(
            children: [

              const Padding(padding: EdgeInsets.symmetric(vertical: 20.0)),

              GestureDetector(
                onTap: () { _.showAlertDialog(); },
                child: CircleAvatar(
                  backgroundImage: AssetImage(_.imagePath),
                  backgroundColor: Colors.white,
                  radius: (width * .20),
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}