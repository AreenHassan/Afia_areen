import 'package:afia2/doctor/features/appointments/patient_detail_page.dart';
import 'package:flutter/material.dart';
import '../../../color.dart';
import '../../../widget/custom_patient_card.dart';

class CompletedAppointments extends StatelessWidget {
  CompletedAppointments({super.key});

  final List<Map<String, dynamic>> patients = [
    {
      'name': 'Mahmoud',
      'age': 30,
      'location': 'Damascus',
      'reportImage': 'images/t2.png',
      'description': 'Patient has a mild headache.',
    },
    {
      'name': 'Sarah',
      'age': 25,
      'location': 'Aleppo',
      'reportImage': 'images/t2.png',
      'description': 'Patient is experiencing fatigue.',
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
        'Completed Appointmentsz',
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(color: Appcolor.whitecolor),
      )),
      body: ListView.builder(
        itemCount: patients.length,
        itemBuilder: (context, index) {
          return PatientCard(
            patient: patients[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PatientDetail(
                    patient: patients[index],
                  ),
                ),
              );
            },
          );
        },
      ),

    );
  }
}
