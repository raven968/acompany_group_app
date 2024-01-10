import 'dart:async';
import 'dart:convert';

import 'package:acompany_group_app/models/area.dart';
import 'package:acompany_group_app/models/scholarship.dart';
import 'package:acompany_group_app/models/turn.dart';
import 'package:acompany_group_app/models/zone.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;

class Utils {
  static const Color appSkyBlue = Color.fromARGB(255, 223, 246, 255);
  static const Color appNavyBlue = Color.fromARGB(255, 6, 40, 61);
  static const Color appSecondBlue = Color.fromARGB(255, 19, 101, 223);
  static const Color appThirdBlue = Color.fromARGB(255, 71, 181, 255);

  static MaterialStateProperty<Color> materialAppSkyBlue = MaterialStateProperty.all(appSkyBlue);
  static MaterialStateProperty<Color> materialAppNavyBlue = MaterialStateProperty.all(appNavyBlue);
  static MaterialStateProperty<Color> materialAppSecondBlue = MaterialStateProperty.all(appSecondBlue);


  //API ROUTES// GET UTILS

  static String API_URL = 'http://10.0.2.2:8000/api';

  static Future<List<Area>> getAreas() async {
    try{
      var url = Uri.parse('$API_URL/areas');

      var response =
          await http.get(url);

      if (response.statusCode == 200) {
        //print(jsonDecode(response.body) as List);
        List<Area> areas = (jsonDecode(response.body) as List)
            .map((e) => Area.fromJson(e))
            .toList();
        return areas;
      } else {
        List<Area> areas = [];
        Get.snackbar('Error', 'Error al cargar datos');
        return areas;
      }
    }catch(e){
      List<Area> areas = [];
      print(e);
      return areas;
    }
  }

  static Future<List<String>> getStates() async {
    try{
      var url = Uri.parse('$API_URL/states');

      var response =
          await http.get(url);

      if (response.statusCode == 200) {
        List<Map<String, dynamic>> decodedJson = List<Map<String, dynamic>>.from(jsonDecode(response.body));
        
        List<String> states = decodedJson.map((item) => item['state'].toString()).toList();
        
        return states;
      } else {
        List<String> states = [];
        Get.snackbar('Error', 'Error al cargar datos');
        return states;
      }
    }catch(e){
      List<String> states = [];
      print(e);
      return states;
    }
  }

  static Future<List<String>> getCities(state) async {
    try{
      var url = Uri.parse('$API_URL/cities?state=$state');

      var response =
          await http.get(url);

      if (response.statusCode == 200) {
        List<Map<String, dynamic>> decodedJson = List<Map<String, dynamic>>.from(jsonDecode(response.body));
        
        List<String> cities = decodedJson.map((item) => item['city'].toString()).toList();
        
        return cities;
      } else {
        List<String> cities = [];
        Get.snackbar('Error', 'Error al cargar datos');
        return cities;
      }
    }catch(e){
      List<String> cities = [];
      print(e);
      return cities;
    }
  }

  static Future<List<Zone>> getZones() async {
    try{
      var url = Uri.parse('$API_URL/zones');

      var response =
          await http.get(url);

      if (response.statusCode == 200) {
        //print(jsonDecode(response.body) as List);
        List<Zone> zones = (jsonDecode(response.body) as List)
            .map((e) => Zone.fromJson(e))
            .toList();
        return zones;
      } else {
        List<Zone> zones = [];
        Get.snackbar('Error', 'Error al cargar datos');
        return zones;
      }
    }catch(e){
      List<Zone> zones = [];
      print(e);
      return zones;
    }
  }

  static Future<List<Turn>> getTurns() async {
    try{
      var url = Uri.parse('$API_URL/turns');

      var response =
          await http.get(url);

      if (response.statusCode == 200) {
        //print(jsonDecode(response.body) as List);
        List<Turn> turns = (jsonDecode(response.body) as List)
            .map((e) => Turn.fromJson(e))
            .toList();
        return turns;
      } else {
        List<Turn> turns = [];
        Get.snackbar('Error', 'Error al cargar datos');
        return turns;
      }
    }catch(e){
      List<Turn> turns = [];
      print(e);
      return turns;
    }
  }

  static Future<List<Scholarship>> getEducationLevels() async {
    try{
      var url = Uri.parse('$API_URL/education-levels');

      var response =
          await http.get(url);

      if (response.statusCode == 200) {
        //print(jsonDecode(response.body) as List);
        List<Scholarship> scholarships = (jsonDecode(response.body) as List)
            .map((e) => Scholarship.fromJson(e))
            .toList();
        return scholarships;
      } else {
        List<Scholarship> scholarships = [];
        Get.snackbar('Error', 'Error al cargar datos');
        return scholarships;
      }
    }catch(e){
      List<Scholarship> scholarships = [];
      print(e);
      return scholarships;
    }
  }

}