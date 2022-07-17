import 'package:bloodbankproject/models/blood_bank.dart';
import 'package:bloodbankproject/services/firestore_source.dart';
import 'package:bloodbankproject/services/routing.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import "package:flutter/material.dart";
import '../common_widgets/pageLayoutWidgets.dart';
import '../common_widgets/common_widgets.dart';

class ViewBloodBanksScreen extends StatefulWidget {
  ViewBloodBanksScreen({Key? key}) : super(key: key);
  @override
  State<ViewBloodBanksScreen> createState() => _ViewBloodBanksScreenState();
}

class _ViewBloodBanksScreenState extends State<ViewBloodBanksScreen> {
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  CollectionReference bloodBanks =
      FirebaseFirestore.instance.collection('bloodBanks');

  List<BloodBank> bb = [];

  @override
  void initState() {
    loadBloodBanks();
    super.initState();
  }

  loadBloodBanks() async {
    List<BloodBank> dbBloodBanks =
        await CloudDataSourceImpl(firebaseFirestore).getDbBloodBanks();

    setState(() {
      bb = dbBloodBanks;
    });
  }

  @override
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
      backgroundColor: priColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PageTitle(title: "Donate blood"), //donate blood
              PageSubtitle(
                subtitle: "Find nearby blood-banks",
              ),
              SizedBox(
                height: 30,
              ),

              ...showBbUi(bb)
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> showBbUi(List<BloodBank> dbBloodBanks) {
    List<Widget> myUiComps = [];
    for (var i = 0; i < dbBloodBanks.length; i++) {
      myUiComps.add(Column(
        children: [
          SizedBox(
            height: 30,
          ),
          BloodBankInfo(
            onPressed: () {
              Navigator.pushNamed(context, bookingScreenID,
                  arguments: dbBloodBanks[i]);
            },
            bloodBankName: dbBloodBanks[i].name!,
            distance: 7,
            isGovernment: dbBloodBanks[i].isGovernment!,
          ),
        ],
      ));
    }
    return myUiComps;
  }
}
