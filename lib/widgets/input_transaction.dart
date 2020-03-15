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
      child: Card(
        margin: EdgeInsets.all(20),
        elevation: 15,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            side: BorderSide(color: Transaction.typeToColor(_categoryInput))),
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextField(
                  controller: titleController,
                  decoration: InputDecoration(
                      icon: Icon(Icons.grade),
                      hintText: 'Enter Transaction title...')),
              TextField(
                controller: amountController,
                keyboardType: TextInputType.numberWithOptions(),
                decoration: InputDecoration(
                    icon: Icon(Icons.attach_money),
                    hintText: 'Enter Transaction amount...'),
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
                          SizedBox(width: 16,),
                          Text(
                            category.toString().split('.').last,
                            textAlign: TextAlign.start,
                          )

                        ],
                      ),
                    );
                  }).toList()),
              SizedBox(
                width: double.infinity ,
                child: OutlineButton(
                  child: Text(
                    'Add transactions',
                    style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  borderSide: BorderSide(color: Transaction.typeToColor(_categoryInput)),
                  onPressed: () => widget.addTx(titleController.text,
                      double.parse(amountController.text), _categoryInput),
                  
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
