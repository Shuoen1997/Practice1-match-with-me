import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:practice1/models/transaction.dart';
import 'custom_textfield.dart';

class InputTransaction extends StatefulWidget {
  final Function addTx;

  InputTransaction({this.addTx});

  @override
  _InputTransactionState createState() => _InputTransactionState();
}

class _InputTransactionState extends State<InputTransaction> {
  static const originalCategoryInput = Category.Other;
  Category _categoryInput = originalCategoryInput;

  final titleController = TextEditingController();
  final amountController = TextEditingController();

  bool isInputFieldVisible = false;

  void resetInputs(){
    amountController.clear();
    titleController.clear();
    _categoryInput = originalCategoryInput;
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

    widget.addTx(submittedTitle, submittedAmount, _categoryInput);
    resetInputs();
    // Hide the keyboard upon completing the editing
    FocusScope.of(context).unfocus();
    setState(() {
      isInputFieldVisible = false;
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
            side: isInputFieldVisible
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
                visible: isInputFieldVisible,
              ),
              Visibility(
                child: MyTextField(
                  currentCategoryColor: _currentCategoryColor,
                  textEditingController: amountController,
                  icon: Icon(Icons.local_atm),
                  hint: 'Enter Transaction amount...',
                  isNumericInput: true,
                ),
                visible: isInputFieldVisible,
              ),
              Visibility(
                child: DropdownButton(
                    value: _categoryInput,
                    onChanged: (Category newvalue) {
                      setState(() {
                        _categoryInput = newvalue;
                      });
                    },
                    items: Category.values
                        .map<DropdownMenuItem<Category>>((Category category) {
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
                visible: isInputFieldVisible,
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
                          borderSide: isInputFieldVisible ? BorderSide(color: _currentCategoryColor) :  BorderSide(color: Colors.grey),
                          onPressed: isInputFieldVisible
                              ? submitData
                              : () {
                                  setState(() {
                                    isInputFieldVisible = true;
                                  });
                                },
                        ),
                      ),
                      SizedBox(width: 10,),
                      Visibility(
                        child: OutlineButton(
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          borderSide: BorderSide(color: Theme.of(context).primaryColorLight),
                          onPressed: () {
                            resetInputs();
                            setState(() {
                              isInputFieldVisible = false;
                            });
                          },
                        ),
                      visible: isInputFieldVisible,)
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
