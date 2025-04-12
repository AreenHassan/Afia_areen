import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../../../widget/custom_textfield.dart';
import '../../../color.dart';

class AddDonation extends StatefulWidget {
  const AddDonation({super.key});

  @override
  State<AddDonation> createState() => _AddDonationState();
}

class _AddDonationState extends State<AddDonation> {
  final GlobalKey<ScaffoldState> scaffoldstate = GlobalKey();
  File? file; // To hold the selected image file
  final ImagePicker _picker = ImagePicker(); // Initialize the ImagePicker

  String? _validateInput(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName must not be empty';
    }
    return null;
  }

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        file = File(pickedFile.path); // Store the selected image file
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldstate,
      appBar: AppBar(
        title: const Text(
          "Add donation",
          style: TextStyle(color: Appcolor.whitecolor),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10,bottom: 20),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 40),
                height: 200,
                width: 400,
                child: const Image(
                  image: AssetImage("images/Afia.PNG"),
                ),
              ),
            ),
            // Image Display Section
            Center(
              child: (file == null)
                  ? Column(
                      children: [
                        const Text(
                          'No image selected',
                          style: TextStyle(fontSize: 16),
                        ),
                        Container(
                          height: 50,
                          width: 320,
                          child: ElevatedButton(
                            onPressed: _pickImage, // Trigger image selection
                            child: const Text("Choose Image"),
                          ),
                        ),
                      ],
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: Image.file(
                        file!,
                        height: 100,
                        width: 320,
                        fit: BoxFit.cover,
                      ),
                    ),
            ),
            CustomTextField(
              label: 'عدد وحدات الدم',
              prefixIcon: Icons.description,
              keyboardType: TextInputType.text,
              validator: (value) => _validateInput(value, 'عدد وحدات الدم'),
            ),
            CustomTextField(
              label: 'زمرة الدم',
              prefixIcon: Icons.description,
              keyboardType: TextInputType.text,
              validator: (value) => _validateInput(value, 'زمرة الدم'),
            ),
            CustomTextField(
              label: 'المحافظة',
              prefixIcon: Icons.description,
              keyboardType: TextInputType.text,
              validator: (value) => _validateInput(value, 'المحافظة'),
            ),
            CustomTextField(
              label: 'رقم للتواصل',
              prefixIcon: Icons.description,
              keyboardType: TextInputType.text,
              validator: (value) => _validateInput(value, 'رقم للتواصل'),
            ),
            Container(
              margin: const EdgeInsets.only(top: 50),
              width: 170,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Appcolor.maincolor,
              ),
              child: TextButton(
                child: const Text(
                  "تم",
                  style: TextStyle(color: Appcolor.whitecolor, fontSize: 20),
                ),
                onPressed: () {
                  // Add submit functionality here
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
