import 'package:color_package/color_package.dart';
import 'package:flutter/material.dart';
import 'package:shared_resources/shared_resources.dart';

class DatePickerWithTextFieldState extends StatefulWidget {
  final TextEditingController controller;
  final String customHintText;
  final String msg;

  const DatePickerWithTextFieldState({
    super.key,
    required this.controller,
    required this.customHintText,
    required this.msg,
  });

  @override
  State<DatePickerWithTextFieldState> createState() =>
      _DatePickerWithTextFieldStateState();
}

class _DatePickerWithTextFieldStateState
    extends State<DatePickerWithTextFieldState> {
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      // Format the date (optional: use intl package for custom formats)
      String formattedDate =
          "${pickedDate.year}-${pickedDate.month.toString().padLeft(2, '0')}-${pickedDate.day.toString().padLeft(2, '0')}";

      widget.controller.text = formattedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: TextFormField(
        readOnly: true,
        onTap: () => _selectDate(context),
        controller: widget.controller,
        decoration: InputDecoration(
          hintText: widget.customHintText,
          hintStyle: TextStyle(
            fontFamily: AppFonts.poppins,
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: AppColors.grey00000070, //#00000070
          ),
          filled: true,
          fillColor: AppColors.white, //#FFFFFF
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.elliptical(10, 10)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.blue0085FF, //#0085FF
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        textAlign: TextAlign.center,
        validator: (String? value) {
          if (value == null || value.isEmpty) {
            return widget.msg;
          }
          return null;
        },
      ),
    );
  }
}
