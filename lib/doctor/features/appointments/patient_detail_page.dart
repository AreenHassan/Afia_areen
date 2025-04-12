import 'package:flutter/material.dart';

import '../../../color.dart';


class PatientDetail extends StatelessWidget {
  final Map<String, dynamic> patient;

 PatientDetail({super.key, required this.patient});
 final GlobalKey<FormState> nameValidator = GlobalKey<FormState>();
 final TextEditingController nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Appcolor.whitecolor,
      appBar: AppBar(
        backgroundColor: Appcolor.maincolor,
        title: Text(
          '${patient['name']}\'s Details',
          style: const TextStyle(color: Appcolor.whitecolor),
        ),
        iconTheme: const IconThemeData(color: Appcolor.whitecolor),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: GestureDetector(
                onTap: () {
                  _showFullImage(context, patient['reportImage']);
                },
                child: Container(
                  height: 180,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Appcolor.border,
                    image: DecorationImage(
                      image: AssetImage(patient['reportImage']),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                patient['name'],
                style: const TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color: Appcolor.blackcolor,
                ),
              ),
            ),
            const SizedBox(height: 5),
            Center(
              child: Text(
                'Age: ${patient['age']}',
                style: TextStyle(
                  fontSize: 18,
                  color: Appcolor.blackcolor.withOpacity(0.7),
                ),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                const Icon(Icons.location_on, color: Appcolor.maincolor),
                const SizedBox(width: 8),
                Text(
                  patient['location'],
                  style: const TextStyle(
                    fontSize: 16,
                    color: Appcolor.blackcolor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            const Text(
              'Patient Condition:',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Appcolor.maincolor,
              ),
            ),
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Appcolor.whitecolor,
                border: Border.all(color: Appcolor.border),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                patient['description'],
                style: const TextStyle(fontSize: 16, color: Appcolor.blackcolor),
              ),
            ),
          
          ],
        ),
      ),
    );
  }

  void _showFullImage(BuildContext context, String imagePath) {
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.transparent,
          child: GestureDetector(
            onTap: () => Navigator.of(context).pop(),
            child: InteractiveViewer(
              child: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imagePath),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }}