import 'package:firebase_auth/firebase_auth.dart';

import '../models/blood_bank.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/donation_booking.dart';

const collectionBloodBanks = 'bloodBanks';
const collectionBookedDonations = 'bookedDonations';
const fieldUserID = 'userID';

class CloudDataSourceImpl {
  final FirebaseFirestore firestoreInstance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  CloudDataSourceImpl(this.firestoreInstance);

  // Read Data from Firestore

  Future<List<BloodBank>> getDbBloodBanks() async {
    QuerySnapshot snapshot =
        await firestoreInstance.collection(collectionBloodBanks).get();
    print(snapshot.docs.length);
    if (snapshot == null || snapshot.docs.length == 0) return [];

    List<DocumentSnapshot> documents = snapshot.docs;

    return documents.map((e) => BloodBank.fromSnapShot(e)).toList();
  }

  // Create donation booking in firestore
  Future<void> createDonationBooking(DonationBooking donationBooking) async {
    var collection =
        await firestoreInstance.collection(collectionBookedDonations);
    Map<String, dynamic> data = donationBooking.toMap();
    //String? id = data['fireStoreID'];
    data.remove('fireStoreID');
    var ref = await collection.add(data);
  }

  Future<List<DonationBooking?>> getUserDonationBookings() async {
    QuerySnapshot snapshot = await firestoreInstance
        .collection(collectionBookedDonations)
        .where(fieldUserID, isEqualTo: _auth.currentUser!.uid)
        .get();

    if (snapshot == null || snapshot.docs.length == 0) return [];

    List<DocumentSnapshot> documents = snapshot.docs;

    return documents.map((e) => DonationBooking.fromSnapShot(e)).toList();
  }

  Future<void> updateDonationBooking(DonationBooking donationBooking) async {
    var docRef = await firestoreInstance
        .collection(collectionBookedDonations)
        .doc(donationBooking.fireStoreID);

    Map<String, dynamic> data = donationBooking.toMap();
    //String? id = data['fireStoreID'];
    data.remove('fireStoreID');
    var ref = await docRef.update(data);
  }

  Future<void> deleteDonationBooking(DonationBooking donationBooking) async {
    var docRef = await firestoreInstance
        .collection(collectionBookedDonations)
        .doc(donationBooking.fireStoreID);
    await docRef.delete();
  }
}
