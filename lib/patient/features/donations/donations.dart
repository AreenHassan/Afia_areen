import 'package:flutter/material.dart';


import '../../../color.dart';
import '../../../widget/custom_patient_card.dart';
import 'add_donation.dart';
class Donations extends StatelessWidget {
  Donations({super.key});

  final List<Map<String, dynamic>> donation = [
    {
      'name': 'donation 1',
      'age': 30,
      'location': 'Damascus',
      'reportImage': 'images/t2.png',
      'description': 'Patient donation.',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'Donations',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(color: Appcolor.whitecolor),
          )),
      body: ListView.builder(
        itemCount: donation.length,
        itemBuilder: (context, index) {
          return PatientCard(
            patient: donation[index],
            onTap: () {},
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Appcolor.maincolor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddDonation(),
            ),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add,color: Appcolor.med,),
      ),
    );
  }
}
