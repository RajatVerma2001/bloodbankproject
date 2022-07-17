import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';

class DonationBooking {
  int? bbID;
  String? bloodGroup;
  String? userID;
  String? bbName;
  DateTime? date;
  String? address;
  String? fireStoreID;
  bool? isGovernment;

  DonationBooking(
      {required this.bbID,
      required this.bloodGroup,
      required this.userID,
      required this.bbName,
      required this.date,
      required this.address,
      required this.fireStoreID,
      required this.isGovernment});

  Map<String, dynamic> toMap() {
    return {
      'bbID': bbID,
      'bloodGroup': bloodGroup,
      'address': address,
      'userID': userID,
      'bbName': bbName,
      'date': date.toString(),
      'fireStoreID': fireStoreID,
      'isGov': isGovernment,
    };
  }

  static DonationBooking? fromSnapShot(DocumentSnapshot snapshot) {
    var map = snapshot.data() as Map;
    if (map == null) {
      return null;
    }

    return DonationBooking(
      bbID: map['bbID'],
      bloodGroup: map['bloodGroup'],
      address: map['address'],
      userID: map['userID'],
      bbName: map['bbName'],
      date: DateTime.parse(map['date']),
      isGovernment: map['isGov'],
      //TODO::Store doc id instead of empty string
      fireStoreID: snapshot.id,
    );
  }
}
