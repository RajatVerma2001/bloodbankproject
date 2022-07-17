import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class BloodBank {
  int? id;
  String? name;
  String? address;
  int? lat;
  int? long;
  double? minEmergencyBlood;
  bool? isGovernment;
  //"B+", "B-", "O+", "AB-"
  Map<String, double>? currentBloodStatus;

  BloodBank(
      {required this.id,
      required this.name,
      this.address,
      this.lat,
      this.long,
      this.minEmergencyBlood,
      this.isGovernment});

  bool donateBlood(String bloodGroup, double quantity) {
    return true;
  }

  bool acceptBlood(String bloodGroup, double quantity) {
    return true;
  }

  String testBloodGroup(String patientReport) {
    return "AB-";
  }

  Map<String, dynamic> toMap(BloodBank bloodBank) {
    return {
      'id': bloodBank.id,
      'name': bloodBank.name,
      'address': bloodBank.address,
      'isGov': bloodBank.isGovernment
    };
  }

  static BloodBank fromSnapShot(DocumentSnapshot snapshot) {
    var map = snapshot.data() as Map;
    if (map == null) {
      return BloodBank(id: -1, name: "");
    }

    return BloodBank(
      name: map['name'],
      id: map['id'],
      address: map['address'],
      isGovernment: map['isGov'],
    );
  }

  String toJson(Map<String, dynamic> map) {
    return jsonEncode(map);
  }

  static Map<String, dynamic> fromJson(String json) {
    return jsonDecode(json);
  }

  static BloodBank fromMap(Map<String, dynamic> map) {
    return BloodBank(
        id: map['id'],
        name: map['name'],
        address: map['address'],
        isGovernment: map['isGov']);
  }

  bool validateBlood() {
    return true;
  }
}
