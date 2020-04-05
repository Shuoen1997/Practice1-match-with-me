import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice1/models/transaction.dart';
import 'custom_textfield.dart';
import 'package:intl/intl.dart';

class InputTransaction extends StatefulWidget {
  final Function addTx;

  InputTransaction({this.addTx});

  @override
  _InputTransactionState createState() => _InputTransactionState();
}

class _InputTransactionState extends State<InputTransaction> {
  static const originalCategoryInput = Category.Other;
  Category _categoryInput = originalCategoryInput;

  DateTime _dateTime = DateTime.now();
  bool _isDatePickerVisible = false;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  bool _isInputFieldVisible = false;

  void resetInputs() {
    amountController.clear();
    titleController.clear();
    _categoryInput = originalCategoryInput;
    _isInputFieldVisible = false;
    _isDatePickerVisible = false;
  }

  void submitData() {
    String submittedTitle = titleController.text;
    double submittedAmount = -0.01;
    if (amountController.text.isNotEmpty) {
      submittedAmount = double.parse(amountController.text);
    } else {
      print('cannot be negative!');
    }

    if (submittedTitle.isEmpty || submittedAmount.isNegative) {
      // Do some validation check
      return;
    }

    widget.addTx(submittedTitle, submittedAmount, _categoryInput, _dateTime);
    resetInputs();
    // Hide the keyboard upon completing the editing
    FocusScope.of(context).unfocus();
    setState(() {
      _isInputFieldVisible = false;
      _isDatePickerVisible = false;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                child: MyTextField(
                  currentCategoryColor: _currentCategoryColor,
                  textEditingController: titleController,
                  icon: Icon(Icons.local_offer),
                  hint: 'Enter Transaction title...',
                  isNumericInput: false,
                ),
                visible: _isInputFieldVisible,
              ),
              Visibility(
                child: MyTextField(
                  currentCategoryColor: _currentCategoryColor,
                  textEditingController: amountController,
                  icon: Icon(Icons.local_atm),
                  hint: 'Enter Transaction amount...',
                  isNumericInput: true,
                ),
                visible: _isInputFieldVisible,
              ),
              Row(
                children: <Widget>[
                  Visibility(
                    child: DropdownButton(
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
                          child: Text(
                            'Add Transaction',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          borderSide: _isInputFieldVisible
                              ? BorderSide(color: _currentCategoryColor)
                              : BorderSide(color: Colors.grey),
                          onPressed: _isInputFieldVisible
                              ? submitData
                              : () {
                                  setState(() {
                                    _isInputFieldVisible = true;
                                  });
                                },
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Visibility(
                        child: OutlineButton(
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          borderSide: BorderSide(
                              color: Theme.of(context).primaryColorLight),
                          onPressed: () {
                            setState(() {
                              resetInputs();
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
