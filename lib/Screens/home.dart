import 'dart:convert';
import 'package:expensetracker/Screens/addScreen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatefulWidget {
  var title;
  var descrip;
  var date;
  var time;
  var dropdownValue;
  var amount;

  Home({
    Key? key,
    required this.title,
    required this.descrip,
    required this.date,
    required this.time,
    required this.dropdownValue,
    required this.amount,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var prefs;
  sharedPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    sharedPrefs();
  }

  @override
  Widget build(BuildContext context) {
    String getdata = prefs.getString('data');
    Map<String, dynamic> dataMap = jsonDecode(getdata) as Map<String, dynamic>;

    return Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddScreen()),
          );
        }),
        body: ListView.builder(
            itemBuilder: (context, index) {
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
                                    child: widget.dropdownValue == 'Income'
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
                                    padding: const EdgeInsets.only(left: 20.0),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          dataMap['title'],
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 20,
                                              color: Colors.black87),
                                        ),
                                        Text(
                                          widget.descrip,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w300,
                                              fontSize: 15,
                                              color: Colors.black54),
                                        ),
                                        Text(
                                          '${widget.date} at ${widget.time}',
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
                                children: [Text(widget.amount)],
                              )
                            ])),
                  ),
                ),
              );
            }));
  }
}
