import 'package:bloodbankproject/common_widgets/common_widgets.dart';
import 'package:bloodbankproject/models/donation_booking.dart';
import 'package:bloodbankproject/services/firestore_source.dart';
import 'package:bloodbankproject/services/routing.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import "package:flutter/material.dart";
import '../common_widgets/pageLayoutWidgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isDataLoaded = false;
  List<DonationBooking?> donationBookings = [];
  FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void initState() {
    loadUserDonationBookings();
    super.initState();
  }

  loadUserDonationBookings() async {
    var x = await CloudDataSourceImpl(widget.firebaseFirestore);
    donationBookings = await x.getUserDonationBookings();
    setState(() {
      isDataLoaded = true;
    });
  }

  List<Widget> getBookings(BuildContext context) {
    List<Widget> widgets = [];

    for (int i = 0; i < donationBookings.length; i++) {
      if (donationBookings[i] != null) {
        widgets.add(
          BookingInfo(
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  bookingScreenID,
                  arguments: donationBookings[i],
                );
              },
              bloodBankName: donationBookings[i]!.bbName!,
              date: donationBookings[i]!.date!,
              isGovernment: donationBookings[i]!.isGovernment!),
        );
        widgets.add(
          SizedBox(
            height: 10,
          ),
        );
      }
    }
    return widgets;
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secColor,
        actions: [
          TextButton(
            child: Icon(Icons.logout_rounded, color: Colors.white),
            onPressed: () async {
              try {
                await _auth.signOut();
                Navigator.pushNamedAndRemoveUntil(
                    context, loginScreenID, (route) => false);
              } on FirebaseAuthException catch (e) {
                print(e.code);
              } catch (e) {
                print(e.toString());
              }
            },
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        child: Icon(
          Icons.add,
          color: priColor,
          size: 32,
        ),
        onPressed: () {
          Navigator.pushNamed(context, viewBloodBankScreenID);
        },
      ),
      backgroundColor: priColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PageTitle(title: "My Bookings"), //donate blood
                SizedBox(
                  height: 30,
                ),

                ...getBookings(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
