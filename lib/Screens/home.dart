import 'package:expensetracker/Screens/addScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatelessWidget {
  var title;
  var descrip;
  var date;
  var time;
  var dropdownValue;
  var amount;
  Home(
      {Key? key,
      required this.title,
      required this.descrip,
      required this.date,
      required this.time,
      required this.dropdownValue,
      required this.amount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(floatingActionButton: FloatingActionButton(onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => AddScreen()),
      );
    }), body: ListView.builder(itemBuilder: (context, index) {
      return ListTile(
        title: Text(title),
        subtitle: Text(date),
        trailing: Text(amount),
      );
    }));
  }
}
