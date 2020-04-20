import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'custom_textfield.dart';
import 'custom_textstyle.dart';
import '../models/transaction.dart';
import 'package:intl/intl.dart';
import 'package:practice1/constant.dart' as constant;

class InputTransaction extends StatefulWidget {
  final Function addTx;

  InputTransaction({this.addTx});

  @override
  _InputTransactionState createState() => _InputTransactionState();
}

class _InputTransactionState extends State<InputTransaction> {
  static Category originalCategoryInput = Category.Other;
  final titleController = TextEditingController();
  final amountController = TextEditingController();
  final DateTime _currentDateTime = DateTime.now();

  var _categoryInput = originalCategoryInput;
  var _dateTime = DateTime.now();
  var _isDatePickerVisible = false;
  var _isInputFieldVisible = false;
  var _displayError = false;

  void _resetInputs() {
    amountController.clear();
    titleController.clear();
    _categoryInput = originalCategoryInput;
    _isInputFieldVisible = false;
    _isDatePickerVisible = false;
    _displayError = false;
  }

  bool isThisInputValid(TextEditingController tec) {
    return tec.text.isNotEmpty;
  }

  void submitData() {
    if (!isThisInputValid(amountController) ||
        !isThisInputValid(titleController)) {
      _displayError = true;
      setState(() {});
      return;
    }
    String submittedTitle = titleController.text;
    double submittedAmount = double.parse(amountController.text);

    widget.addTx(submittedTitle, submittedAmount, _categoryInput, _dateTime);
    _resetInputs();
    // Hide the keyboard upon completing the editing
    FocusScope.of(context).unfocus();
    print('Data is submitted');
  }

  @override
  Widget build(BuildContext context) {
    print('build again');
    Color _currentCategoryColor = Transaction.typeToColor(_categoryInput);
    return Container(
      child: Card(
        margin: EdgeInsets.all(10),
        elevation: 15,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            side: _isInputFieldVisible
                ? BorderSide(color: _currentCategoryColor)
                : BorderSide(color: Colors.grey)),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Visibility(
                child: MyTextField(key: Key('title'),
                    currentCategoryColor: _currentCategoryColor,
                    textEditingController: titleController,
                    icon: Icon(Icons.face),
                    hint: constant.TRANSACTION_TITLE_TEXTFIELD,
                    isNumericInput: false,
                    displayError: _displayError,
                    ),
                visible: _isInputFieldVisible,
              ),
              Visibility(
                child: MyTextField(
                    key: Key('amount'),
                    currentCategoryColor: _currentCategoryColor,
                    textEditingController: amountController,
                    icon: Icon(Icons.local_atm),
                    hint: constant.TRANSACTION_AMOUNT_TEXTFIELD,
                    isNumericInput: true,
                    displayError: _displayError,),
                visible: _isInputFieldVisible,
              ),
              Row(
                children: <Widget>[
                  Visibility(
                    child: DropdownButton(
                        key: Key('categoryDropdownButton'),
                        value: _categoryInput,
                        onChanged: (Category newvalue) {
                          setState(() {
                            _categoryInput = newvalue;
                          });
                        },
                        items: Category.values.map<DropdownMenuItem<Category>>(
                            (Category category) {
                          return DropdownMenuItem<Category>(
                            value: category,
                            child: Row(
                              children: <Widget>[
                                Transaction.typeToIcon(category, 24),
                                SizedBox(
                                  width: 16,
                                ),
                                Text(
                                  category.toString().split('.').last,
                                  textAlign: TextAlign.start,
                                )
                              ],
                            ),
                          );
                        }).toList()),
                    visible: _isInputFieldVisible,
                  ),
                  Visibility(
                    visible: _isInputFieldVisible,
                    child: OutlineButton(
                      key: Key('datePickerButton'),
                      child: Text(DateFormat.yMd().format(_dateTime)),
                      onPressed: () {
                        setState(() {
                          _isDatePickerVisible = true;
                        });
                      },
                    ),
                  )
                ],
              ),

              // Use the SizedBox to set width to infinity so its width can match the parent
              SizedBox(
                  width: double.infinity,
                  // Outline button to match the style of the transaction records
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: OutlineButton(
                          key: Key('addTransactionButton'),
                          child: MyTextStyle(
                            constant.ADD_TRANSACTION_BUTTON,
                          ),
                          borderSide: _isInputFieldVisible
                              ? BorderSide(color: _currentCategoryColor)
                              : BorderSide(color: Colors.grey),
                          onPressed: _isInputFieldVisible
                              ? submitData
                              : () {
                                  setState(() {
                                    _isInputFieldVisible = true;
                                    print('Add Transaction button clicked!');
                                  });
                                },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Visibility(
                        child: OutlineButton(
                          child: MyTextStyle(
                            constant.CANCEL_BUTTON,
                          ),
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColorLight),
                          onPressed: () {
                            setState(() {
                              _resetInputs();
                            });
                          },
                        ),
                        visible: _isInputFieldVisible,
                      )
                    ],
                  )),
              Visibility(
                visible: _isDatePickerVisible && _isInputFieldVisible,
                child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 100,
                      child: CupertinoDatePicker(
                        maximumYear: _currentDateTime.year,
                        initialDateTime: _dateTime,
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (dateTime) {
                          setState(() {
                            _dateTime = dateTime;
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 50,
                      child: OutlineButton(
                        key: Key('confirmDatePickerButton'),
                        child: MyTextStyle(constant.CONFIRM_BUTTON),
                        onPressed: () {
                          setState(() {
                            _isDatePickerVisible = false;
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
