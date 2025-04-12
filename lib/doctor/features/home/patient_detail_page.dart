import 'package:flutter/material.dart';

import '../../../color.dart';
import '../../../widget/custom_textfield_date.dart';


class PatientDetailPage extends StatelessWidget {
  final Map<String, dynamic> patient;

 PatientDetailPage({super.key, required this.patient});
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
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Appcolor.maincolor,
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  _showApprovalDialog(context);
                },
                child: const Text(
                  'Approve Request',
                  style: TextStyle(
                    fontSize: 18,
                    color: Appcolor.whitecolor,
                  ),
                ),
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
  }

  void _showApprovalDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Set Appointment Date and Time'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              customTextFieldDate(controller:nameController ,errorText: 'Please enter a date',formKey:nameValidator ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Appcolor.maincolor,
              ),
              onPressed: () {
                Navigator.of(context).pop();
                print('Appointment approved');
                // هنا يمكن تنفيذ منطق حفظ الموعد المختار.
              },
              child: const Text('Confirm'),
            ),
          ],
        );
      },
    );
  }
}