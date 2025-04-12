import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


Widget customTextFieldDate({
  required String errorText,
  required GlobalKey<FormState> formKey,
  required TextEditingController controller,
}) {
  return Form(
    key: formKey,
    child: TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return errorText;
        }
        return null;
      },
      controller: controller,
      decoration: const InputDecoration(
        labelText: 'Date and Time',
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Color(0xFF5669ff),
          ),
        ),
      ),
      onTap: () async {
        FocusScope.of(formKey.currentContext!).requestFocus(FocusNode());

        DateTime? selectedDate = await showDatePicker(
          context: formKey.currentContext!,
          initialDate: DateTime.now(),
          firstDate: DateTime(2000),
          lastDate: DateTime(2101),
        );

        if (selectedDate != null) {
          TimeOfDay? selectedTime = await showTimePicker(
            context: formKey.currentContext!,
            initialTime: TimeOfDay.now(),
          );

          if (selectedTime != null) {
            // Combine date and time
            DateTime dateTime = DateTime(
              selectedDate.year,
              selectedDate.month,
              selectedDate.day,
              selectedTime.hour,
              selectedTime.minute,
            );

            // Format to 'yyyy-MM-dd HH:mm' format
            String formattedDateTime = DateFormat('yyyy-MM-dd HH:mm').format(dateTime);

            // Set the formatted date and time to the controller
            controller.text = formattedDateTime;
          }
        }
      },
    ),
  );
}
