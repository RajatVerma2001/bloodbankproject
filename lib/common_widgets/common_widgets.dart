import 'package:bloodbankproject/common_widgets/pageLayoutWidgets.dart';
import "package:flutter/material.dart";
import "package:intl/intl.dart";

class BloodBankInfo extends StatelessWidget {
  const BloodBankInfo({
    Key? key,
    required this.bloodBankName,
    required this.distance,
    required this.isGovernment,
    this.displayBloodGroupAvailability = false,
    required this.onPressed,
  }) : super(key: key);

  final String bloodBankName;
  final double distance;
  final bool isGovernment;
  final bool displayBloodGroupAvailability;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return PressableGenericInfoCard(
      onPressed: onPressed,
      leadingWidget: BloodBankTypeIndicator(isGovernment: isGovernment),
      titleWidget: BloodBankNameDisplay(bloodBankName: bloodBankName),
      info: "${distance} km",
    );
  }
}

class BookingInfo extends StatelessWidget {
  const BookingInfo({
    Key? key,
    required this.bloodBankName,
    required this.date,
    required this.isGovernment,
    required this.onPressed,
  }) : super(key: key);

  final String bloodBankName;
  final DateTime date;
  final bool isGovernment;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return PressableGenericInfoCard(
      onPressed: onPressed,
      leadingWidget: BloodBankTypeIndicator(isGovernment: isGovernment),
      titleWidget: BloodBankNameDisplay(bloodBankName: bloodBankName),
      info: DateFormat('dd MMMM yyyy').format(date),
    );
  }
}

class BloodBankTypeIndicator extends StatelessWidget {
  const BloodBankTypeIndicator({Key? key, required this.isGovernment})
      : super(key: key);

  final bool isGovernment;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          width: 20,
          height: 20,
          decoration: BoxDecoration(
            color: isGovernment ? Color(0xFFEA6C6C) : Color(0xFF699B61),
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
        ),
      ),
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}

class BloodBankNameDisplay extends StatelessWidget {
  const BloodBankNameDisplay({Key? key, required this.bloodBankName})
      : super(key: key);

  final String bloodBankName;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          bloodBankName,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
        Text(
          "Blood Bank",
          style: TextStyle(
            color: Colors.black,
            fontSize: 16,
          ),
        ),
      ],
    );
  }
}

class PressableGenericInfoCard extends StatelessWidget {
  const PressableGenericInfoCard({
    Key? key,
    required this.leadingWidget,
    required this.titleWidget,
    required this.info,
    required this.onPressed,
  }) : super(key: key);

  final String info;
  final Widget leadingWidget;
  final Widget titleWidget;
  final void Function() onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        primary: Color(0xFFECEBEB),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(
              8,
            ),
          ),
        ),
      ),
      child: GenericInfoCard(
        leadingWidget: leadingWidget,
        titleWidget: titleWidget,
        info: info,
      ),
    );
  }
}

class GenericInfoCard extends StatelessWidget {
  const GenericInfoCard({
    Key? key,
    required this.leadingWidget,
    required this.titleWidget,
    required this.info,
  }) : super(key: key);

  final String info;
  final Widget leadingWidget;
  final Widget titleWidget;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 12, 0, 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              leadingWidget,
              SizedBox(width: 10),
              titleWidget,
            ],
          ),
          Text(
            info,
            style: TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
