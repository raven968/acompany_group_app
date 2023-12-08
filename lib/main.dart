import 'package:acompany_group_app/views/home_page.dart';
import 'package:acompany_group_app/views/login_page.dart';
import 'package:acompany_group_app/views/register_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:get/get_navigation/src/routes/transitions_type.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Acompany Group',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      initialRoute: "/login",
      getPages: AppRoutes.pages,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
       ],
      supportedLocales: const [
        Locale('en'),
        Locale('es')
      ],
    );
  }
}

class AppRoutes {
  static final pages = [
    //Pagina de inicio
    GetPage(
      name: "/login", 
      page: () => const LoginPage(), 
      transition: Transition.fadeIn
    ),

    GetPage(
      name: "/register",
      page: () => const RegisterPage(),
      transition: Transition.circularReveal
    ),

    GetPage(
      name: "/home",
      page: () => const HomePage(),
      transition: Transition.circularReveal
    )
  ];
}
