import 'package:flutter/material.dart';


import '../../../color.dart';
import '../../../widget/custom_appbar_homepage.dart';
import '../../../widget/custom_drawer.dart';
import '../../../widget/custom_patient_card.dart';
import 'add_apppointments.dart';

class PatientAppointments extends StatelessWidget {
  final GlobalKey<ScaffoldState> scaffoldstate = GlobalKey();

  final List<Map<String, dynamic>> appointment = [
    {
      'name': 'Mahmoud',
      'age': 30,
      'location': 'Damascus',
      'reportImage': 'images/t2.png',
      'description': 'Patient has a mild headache.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldstate,
      drawer: const CustomDrawer(),
      body: Column(
        children: [
          CustomAppbarHomepage(scaffoldstate: scaffoldstate),
          Expanded(
            child: ListView.builder(
              itemCount: appointment.length,
              itemBuilder: (context, index) {
                return PatientCard(
                  patient: appointment[index],
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Appcolor.maincolor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddApppointments(),
            ),
          );
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add,color: Appcolor.med,),
      ),
    );
  }
}
