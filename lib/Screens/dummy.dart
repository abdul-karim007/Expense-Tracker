import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expensetracker/Class/expenseClass.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class Dummy extends StatefulWidget {
  const Dummy({Key? key}) : super(key: key);

  @override
  State<Dummy> createState() => _DummyState();
}

class _DummyState extends State<Dummy> {
  int key = 0;
  late List<ExpenseClass> _expense = [];
  Map<String, double> getCategoryData() {
    Map<String, double> catMap = {};
    for (var item in _expense) {
      print(item.ddVal);
      if (catMap.containsKey(item.ddVal) == false) {
        catMap[item.ddVal] = 1;
      } else {
        catMap.update(item.ddVal, (String) => catMap[item.ddVal]! + 1);
        // test[item.category] = test[item.category]! + 1;
      }
      print(catMap);
    }
    return catMap;
  }

  Widget pieChartExampleOne() {
    return PieChart(
      key: ValueKey(key),
      dataMap: getCategoryData(),
      initialAngleInDegree: 0,
      animationDuration: Duration(milliseconds: 2000),
      chartType: ChartType.ring,
      chartRadius: MediaQuery.of(context).size.width / 3.2,
      ringStrokeWidth: 16,
      chartLegendSpacing: 32,
      legendOptions: LegendOptions(
          showLegendsInRow: false,
          showLegends: true,
          legendShape: BoxShape.rectangle,
          legendPosition: LegendPosition.right,
          legendTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    final Query<Map<String, dynamic>> expStream =
        FirebaseFirestore.instance.collection('expense_tracker');
    void getExpfromSanapshot(snapshot) {
      if (snapshot.docs.isNotEmpty) {
        _expense = [];
        for (int i = 0; i < snapshot.docs.length; i++) {
          var a = snapshot.docs[i];
          // print(a.data());
          ExpenseClass exp = ExpenseClass.fromMap(a.data());
          _expense.add(exp);
          // print(exp);
        }
      }
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 50,
            ),
            FutureBuilder<Object>(
              future: expStream.get(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text("something went wrong");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                }
                final data = snapshot.requireData;
                print("Data: $data");
                getExpfromSanapshot(data);
                return pieChartExampleOne();
              },
            ),
          ],
        ),
      ),
    );
  }
}
