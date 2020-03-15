import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final Color currentCategoryColor;
  final TextEditingController textEditingController;
  final Icon icon;
  final String hint;
  final bool isNumericInput;
  MyTextField(
      {this.currentCategoryColor,
      this.textEditingController,
      this.icon,
      this.hint,
      this.isNumericInput});
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: currentCategoryColor,
      controller: textEditingController,
      keyboardType: isNumericInput? TextInputType.numberWithOptions(decimal: true):TextInputType.text,
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: currentCategoryColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: currentCategoryColor),
          ),
          fillColor: currentCategoryColor,
          icon: icon,
          hintText: hint),
    );
  }
}
