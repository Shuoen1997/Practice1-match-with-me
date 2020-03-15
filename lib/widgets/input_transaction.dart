import 'package:flutter/material.dart';
import 'package:practice1/models/transaction.dart';

class InputTransaction extends StatefulWidget {
  final Function addTx;

  InputTransaction({this.addTx});

  @override
  _InputTransactionState createState() => _InputTransactionState();
}

class _InputTransactionState extends State<InputTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  Category _categoryInput = Category.Other;

  @override
  Widget build(BuildContext context) {

    
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          TextField(controller: titleController),
          TextField(
            controller: amountController,
            keyboardType: TextInputType.numberWithOptions(),
            decoration: InputDecoration(hintText: '10.99'),
          ),
          DropdownButton(
            value: _categoryInput,
            onChanged: (Category newvalue){
              setState(() {
                _categoryInput = newvalue;
              });
            },
              items: Category.values
                  .map<DropdownMenuItem<Category>>((Category category) {
            return DropdownMenuItem<Category>(
              value: category,
              child: Text(category.toString()),
            );
          }).toList()),
          RaisedButton(
            child: Text(
              'Add transactions',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            color: Transaction.typeToColor(_categoryInput),
            onPressed: () => widget.addTx(
                titleController.text, double.parse(amountController.text), _categoryInput),
          )
        ],
      ),
    );
  }
}
