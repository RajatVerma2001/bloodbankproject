import 'package:flutter/material.dart';
import 'package:bloodbankproject/models/donation_booking.dart';
import 'package:bloodbankproject/screens/loginScreen.dart';
import 'package:bloodbankproject/screens/homeScreen.dart';
import '../screens/viewBloodBankScreen.dart';
import "../screens/bookingscreen.dart";
import '../models/blood_bank.dart';
import 'package:bloodbankproject/screens/firstScreen.dart';

const bookingScreenID = "/bookingScreen";
const viewBloodBankScreenID = "/viewBloodBankScreen";
const loginScreenID = "/loginScreen";
const homeScreenID = "/homeScreen";
const firstScreenID = "/firstScreen";

Route<dynamic>? routing(RouteSettings settings) {
  switch (settings.name) {
    case firstScreenID:
      {
        return MaterialPageRoute(
          builder: (_) => FirstScreen(),
        );
      }
    case bookingScreenID:
      {
        if (settings.arguments is BloodBank) {
          final BloodBank bloodBank = settings.arguments as BloodBank;
          return MaterialPageRoute(
              builder: (_) => BookingScreen(bloodBank: bloodBank));
        } else {
          final DonationBooking donationBooking =
              settings.arguments as DonationBooking;
          return MaterialPageRoute(
              builder: (_) => BookingScreen.fromBookingInfo(
                    donationBooking: donationBooking,
                  ));
        }
      }
    case homeScreenID:
      {
        return MaterialPageRoute(
          builder: (_) => HomeScreen(),
        );
      }
    case viewBloodBankScreenID:
      {
        return MaterialPageRoute(
          builder: (_) => ViewBloodBanksScreen(),
        );
      }
    case loginScreenID:
      {
        return MaterialPageRoute(
          builder: (_) => LoginScreen(),
        );
      }
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}
