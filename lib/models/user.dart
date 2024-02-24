// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';


String userToJson(User data) => json.encode(data.toJson());

class User {
    String name;
    String lastNameFather;
    String lastNameMother;
    String cellphone;
    String birthday;
    String street;
    String streetNumber;
    String colony;
    String zip;
    String state;
    String city;
    String genre;
    String maritalStatus;
    String economicDependents;
    int? educationLevelId;
    String educationStatus;
    String firstWork;
    String fiscalSituation;
    String position1;
    String company1;
    String antiquity1;
    String finishYear1;
    String specialty1;
    String position2;
    String company2;
    String antiquity2;
    String finishYear2;
    String specialty2;
    String position3;
    String company3;
    String antiquity3;
    String finishYear3;
    String specialty3;
    String description;
    List zones;
    List areas;
    List turns;
    String password;

    User({
        required this.name,
        required this.lastNameFather,
        required this.lastNameMother,
        required this.cellphone,
        required this.birthday,
        required this.street,
        required this.streetNumber,
        required this.colony,
        required this.zip,
        required this.state,
        required this.city,
        required this.genre,
        required this.maritalStatus,
        required this.economicDependents,
        this.educationLevelId,
        required this.educationStatus,
        required this.firstWork,
        required this.fiscalSituation,
        required this.position1,
        required this.company1,
        required this.antiquity1,
        required this.finishYear1,
        required this.specialty1,
        required this.position2,
        required this.company2,
        required this.antiquity2,
        required this.finishYear2,
        required this.specialty2,
        required this.position3,
        required this.company3,
        required this.antiquity3,
        required this.finishYear3,
        required this.specialty3,
        required this.description,
        required this.zones,
        required this.areas,
        required this.turns,
        required this.password,
    });

    Map<String, dynamic> toJson() => {
        "name": name,
        "last_name_father": lastNameFather,
        "last_name_mother": lastNameMother,
        "cellphone": cellphone,
        "birthday": birthday,
        "street": street,
        "street_number": streetNumber,
        "colony": colony,
        "zip": zip,
        "state": state,
        "city": city,
        "genre": genre,
        "marital_status": maritalStatus,
        "economic_dependents": economicDependents,
        "education_level_id": educationLevelId,
        "education_status": educationStatus,
        "first_work": firstWork,
        "fiscal_situation": fiscalSituation,
        "position1": position1,
        "company1": company1,
        "antiquity1": antiquity1,
        "finish_year1": finishYear1,
        "specialty1": specialty1,
        "position2": position2,
        "company2": company2,
        "antiquity2": antiquity2,
        "finish_year2": finishYear2,
        "specialty2": specialty2,
        "position3": position3,
        "company3": company3,
        "antiquity3": antiquity3,
        "finish_year3": finishYear3,
        "specialty3": specialty3,
        "description": description,
        "zones": zones,
        "areas": areas,
        "turns": turns,
        "password": password,
    };
}