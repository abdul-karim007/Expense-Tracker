import 'package:expensetracker/Screens/addScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Home extends StatelessWidget {
  var title;
  Home({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddScreen()),
          );
        }),
        body: ListView.builder(
            itemCount: 8,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(title.toString()),
              );
            }));
  }
}
