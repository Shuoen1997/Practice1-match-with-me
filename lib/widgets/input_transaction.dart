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

  @override
  Widget build(BuildContext context) {
    Color _currentCategoryColor = Transaction.typeToColor(_categoryInput);
    return Container(
      child: Card(
        margin: EdgeInsets.all(20),
        elevation: 15,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            side: BorderSide(color: _currentCategoryColor)),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              MyTextField(
                currentCategoryColor: _currentCategoryColor,
                textEditingController: titleController,
                icon: Icon(Icons.grade),
                hint: 'Enter Transaction title...',
                isNumericInput: false,
              ),
              MyTextField(
                currentCategoryColor: _currentCategoryColor,
                textEditingController: titleController,
                icon: Icon(Icons.attach_money),
                hint: 'Enter Transaction amount...',
                isNumericInput: true,
              ),
              DropdownButton(
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
              // Use the SizedBox to set width to infinity so its width can match the parent 
              SizedBox(
                width: double.infinity,
                // Outline button to match the style of the transaction records 
                child: OutlineButton(
                    child: Text(
                      'Add transactions',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    borderSide: BorderSide(color: _currentCategoryColor),
                    onPressed: () {
                      // Reset the input fields 
                      widget.addTx(titleController.text,
                          double.parse(amountController.text), _categoryInput);
                      amountController.clear();
                      titleController.clear();
                      _categoryInput = originalCategoryInput;
                      // Hide the keyboard upon completing the editing 
                      FocusScope.of(context).unfocus();
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
