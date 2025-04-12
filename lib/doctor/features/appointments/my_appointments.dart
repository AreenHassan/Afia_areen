
import 'package:afia2/doctor/features/appointments/patient_detail_page.dart';
import 'package:flutter/material.dart';

import '../../../color.dart';


class Myappointments extends StatefulWidget {
  const Myappointments({super.key});

  @override
  _MyappointmentsState createState() => _MyappointmentsState();
}

class _MyappointmentsState extends State<Myappointments> {
  final List<Map<String, dynamic>> patients = [
    {
      'name': 'Mahmoud',
      'age': 30,
      'location': 'Damascus',
      'reportImage': 'images/t2.png',
      'description': 'Patient has a mild headache.',
      'isChecked': false,
    },
  
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'My Appointments',
          style: TextStyle(color: Appcolor.whitecolor),
        ),
      ),
      body: ListView.builder(
        itemCount: patients.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            child: Card(
              shadowColor: Appcolor.maincolor,
              elevation: 5,
              margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 100,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(patients[index]['reportImage']),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${patients[index]['name']} (${patients[index]['age']})',
                            style: const TextStyle(
                              color: Appcolor.border,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 15),
                          Text(
                            'Location: ${patients[index]['location']}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            'Description: ${patients[index]['description']}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.grey[600],
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                         
                        ],
                      ),
                    ),
                  ),
                   IconButton(
                    iconSize: 35,
                            icon: Icon(
                              patients[index]['isChecked']
                                  ? Icons.check_circle
                                  : Icons.radio_button_unchecked,
                              color: patients[index]['isChecked']
                                  ?Appcolor.maincolor
                                  : Appcolor.grey,
                            ),
                            onPressed: () {
                              setState(() {
                                patients[index]['isChecked'] =
                                    !patients[index]['isChecked'];
                              });
                            },
                          ),
                ],
              ),
            ),
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