import 'package:flutter/material.dart';

class MyTextField extends StatefulWidget {
  final Key key;
  final Color currentCategoryColor;
  final TextEditingController textEditingController;
  final Icon icon;
  final String hint;
  final bool isNumericInput;
  final bool displayError;
  MyTextField(
      {
      @required this.key,
      this.currentCategoryColor,
      this.textEditingController,
      this.icon,
      this.hint,
      this.isNumericInput,
      this.displayError});

  @override
  _MyTextFieldState createState() => _MyTextFieldState();
}

class _MyTextFieldState extends State<MyTextField> {

  @override
  Widget build(BuildContext context) {
    print(widget.textEditingController.text);
    return TextFormField(
      onChanged: (value)=>setState((){}),
      cursorColor: widget.currentCategoryColor,
      controller: widget.textEditingController,
      keyboardType: widget.isNumericInput
          ? TextInputType.numberWithOptions(decimal: true)
          : TextInputType.text,
      decoration: InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: widget.currentCategoryColor),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: widget.currentCategoryColor),
          ),
          fillColor: widget.currentCategoryColor,
          icon: widget.icon,
          hintText: widget.hint,
          errorText: (widget.textEditingController.text.isEmpty && widget.displayError)?'This field cannot be empty!':null,
          errorStyle: TextStyle(color: Colors.red[300], ),
          errorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
          focusedErrorBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red[300]))),
    );
  }
}
