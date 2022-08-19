import 'package:expensetracker/Class/expenseClass.dart';
import 'package:pie_chart/pie_chart.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expensetracker/Screens/addScreen.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int key = 0;
  late List<ExpenseClass> _expense = [];
  Map<String, double> getCategoryData() {
    Map<String, double> catMap = {};
    for (var item in _expense) {
      if (catMap.containsKey(item.ddVal) == false) {
        catMap[item.ddVal] = 1;
      } else {
        catMap.update(item.ddVal, (String) => catMap[item.ddVal]! + 1);
      }
    }
    return catMap;
  }

  Widget pieChartExampleOne() {
    return PieChart(
      colorList: [Colors.green, Colors.red],
      // baseChartColor: Colors.blueGrey.withOpacity(.3),
      // totalValue: 100,
      chartValuesOptions: ChartValuesOptions(showChartValues: false),
      key: ValueKey(key),
      dataMap: getCategoryData(),
      animationDuration: Duration(milliseconds: 2000),
      chartType: ChartType.ring,
      chartRadius: MediaQuery.of(context).size.width / 3.2,
      ringStrokeWidth: 16,
      chartLegendSpacing: 32,
      legendOptions: LegendOptions(
          showLegendsInRow: false,
          showLegends: true,
          legendShape: BoxShape.circle,
          legendPosition: LegendPosition.right,
          legendTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          )),
    );
  }

  @override
  Widget build(BuildContext context) {
    Query<Map<String, dynamic>> expense = FirebaseFirestore.instance
        .collection('expense_tracker')
        .orderBy('date', descending: true);
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
        body: Column(
      children: [
        SafeArea(child: SizedBox()),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 18.0),
              child: ElevatedButton(
                  style: ButtonStyle(elevation: MaterialStateProperty.all(10)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => AddScreen()),
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.add),
                      Text('Add'),
                    ],
                  )),
            ),
          ],
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * .2,
          child: FutureBuilder<Object>(
            future: expense.get(),
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
        ),
        Expanded(
            child: FutureBuilder<QuerySnapshot>(
          future: expense.get(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView(
                  children:
                      snapshot.data!.docs.map((DocumentSnapshot document) {
                Map<String, dynamic> abc =
                    document.data()! as Map<String, dynamic>;
                return Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 10, top: 6),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * .12,
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      elevation: 10,
                      child: Padding(
                          padding: const EdgeInsets.only(
                              top: 8.0, left: 20, right: 20),
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    CircleAvatar(
                                      backgroundColor:
                                          Color.fromARGB(255, 228, 228, 228),
                                      radius: 28,
                                      child: abc['dropdown'] == 'Income'
                                          ? Icon(
                                              Icons.arrow_forward,
                                              color: Color(0xFF02DD09),
                                              size: 40,
                                            )
                                          : Icon(
                                              Icons.arrow_back,
                                              color: Colors.red,
                                              size: 40,
                                            ),
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 20.0),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            abc['title'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 20,
                                                color: Colors.black87),
                                          ),
                                          Text(
                                            abc['descrip'],
                                            style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 15,
                                                color: Colors.black54),
                                          ),
                                          Text(
                                            '${abc['date']} at ${abc['time']}',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                color: Colors.black45),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [Text(abc['amount'])],
                                )
                              ])),
                    ),
                  ),
                );
              }).toList());
            } else {
              return Center(child: CircularProgressIndicator());
            }
          },
        )),
      ],
    ));
  }
}
