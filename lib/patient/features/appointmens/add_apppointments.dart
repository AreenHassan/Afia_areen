import 'package:flutter/material.dart';
import '../../../color.dart';
import '../../../widget/custom_appbar_homepage.dart';
import '../../../widget/custom_textfield.dart';

class AddApppointments extends StatefulWidget {
  AddApppointments({super.key});

  @override
  State<AddApppointments> createState() => _AddApppointmentsState();
}

class _AddApppointmentsState extends State<AddApppointments> {
  final GlobalKey<ScaffoldState> scaffoldstate = GlobalKey();

  List<Map<String, String>> doctors = [
    {'id': '1', 'name': 'اختصاص 1'},
    {'id': '2', 'name': 'اختصاص 2'},
    {'id': '3', 'name': 'اختصاص 3'},
  ];

  String? selectedDoctor;

  String? _validateInput(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName must not be empty';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldstate,
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomAppbarHomepage(scaffoldstate: scaffoldstate),
            Container(
              margin: EdgeInsets.only(top: 30),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  fillColor: Appcolor.med,
                  filled: true,
                  label: const Text("اختصاص المعاينة"),
                  prefixIcon: const Icon(Icons.health_and_safety,
                      color: Appcolor.maincolor),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                value: selectedDoctor,
                items: doctors.map((category) {
                  return DropdownMenuItem<String>(
                    value: category['id'],
                    child: Text(category['name']!),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedDoctor = value;
                  });
                },
                validator: (value) =>
                    value == null ? 'الرجاء اختيار اختصاص المعاينة' : null,
              ),
            ),
            CustomTextField(
              label: 'شرح عن المعاينة (مع اختيار وقت مفضل)',
              prefixIcon: Icons.description,
              keyboardType: TextInputType.text,
              validator: (value) => _validateInput(value, 'description'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 50),
                  width: 120,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Appcolor.maincolor,
                  ),
                  child: TextButton(
                    child: const Text(
                      "تم",
                      style: TextStyle(color: Appcolor.whitecolor,fontSize: 20),
                    ),
                    onPressed: () {},
                  ),
                ),
                SizedBox(width: 10,),
                Container(
                  margin: EdgeInsets.only(top: 50),
                  width: 120,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Appcolor.maincolor,
                  ),
                  child: TextButton(
                    child: const Text(
                      "إلغاء",
                      style: TextStyle(color: Appcolor.whitecolor,fontSize: 20),
                    ),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
