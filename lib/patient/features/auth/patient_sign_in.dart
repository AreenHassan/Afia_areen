import 'package:flutter/material.dart';

import '../../../color.dart';
import '../../../widget/custom_textfield.dart';


class PatientSignInPage extends StatefulWidget {
  const PatientSignInPage({super.key});

  @override
  State<PatientSignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<PatientSignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  bool _obscureText2 = true;

  String? _validateInput(String? value, String fieldName) {
    if (value == null || value.isEmpty) {
      return '$fieldName must not be empty';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Afia',
          style: TextStyle(color: Appcolor.whitecolor),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 40),
                  height: 200,
                  width: 400,
                  child: const Image(
                    image: AssetImage("images/Afia.PNG"),
                  ),
                ),
              ),
              Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 35, vertical: 10),
                  child: const Text('Sign Up ',
                      style:
                          TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start)),
              Column(
                children: [
                  CustomTextField(
                    label: 'Full Name',
                    prefixIcon: Icons.person,
                    keyboardType: TextInputType.text,
                    validator: (value) => _validateInput(value, 'Name'),
                  ),
                  CustomTextField(
                    label: 'Phone number',
                    prefixIcon: Icons.phone,
                    keyboardType: TextInputType.number,
                    validator: (value) => _validateInput(value, 'Phone number'),
                    obscureText: false,
                  ),
                  CustomTextField(
                    label: 'National number',
                    prefixIcon: Icons.flag,
                    keyboardType: TextInputType.number,
                    validator: (value) =>
                        _validateInput(value, 'National number'),
                  ),
                  CustomTextField(
                    label: 'Governorate',
                    prefixIcon: Icons.location_on,
                    keyboardType: TextInputType.text,
                    validator: (value) => _validateInput(value, 'Governorate'),
                  ),
                  CustomTextField(
                    label: 'Password',
                    prefixIcon: Icons.lock,
                    obscureText: _obscureText,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) => _validateInput(value, 'Password'),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Appcolor.maincolor,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                  CustomTextField(
                    label: 'Confirm Password',
                    prefixIcon: Icons.lock,
                    obscureText: _obscureText2,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (value) =>
                        _validateInput(value, 'Confirm Password'),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText2 ? Icons.visibility : Icons.visibility_off,
                        color: Appcolor.maincolor,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText2 = !_obscureText2;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 50, top: 15),
                    child: Container(
                      width: 200,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Appcolor.maincolor,
                      ),
                      child: TextButton(
                        child: const Text(
                          "Sign in",
                          style: TextStyle(
                              color: Appcolor.whitecolor, fontSize: 20),
                        ),
                        onPressed: () {},
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
