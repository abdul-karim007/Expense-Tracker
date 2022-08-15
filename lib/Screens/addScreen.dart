import 'package:expensetracker/Constants/textConsts.dart';
import 'package:expensetracker/Functions/customWidgets.dart';
import 'package:expensetracker/Screens/home.dart';
import 'package:flutter/material.dart';

class AddScreen extends StatefulWidget {
  const AddScreen({Key? key}) : super(key: key);

  @override
  State<AddScreen> createState() => _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  var choice = [textConst.income, textConst.expense];
  var dropdownvalue = textConst.income;
  late DateTime _selectedDate;
  TextEditingController title = TextEditingController();
  TextEditingController descrip = TextEditingController();
  TextEditingController amount = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController time = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      floatingActionButton: FloatingActionButton(
        
        onPressed: null,
        // () {
        //   Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //         builder: (context) => Home(
        //               title: title.text,
        //             )),
        //   );
        // },
        child: Icon(Icons.check),
        backgroundColor: onPressed != null ? ,
      ),
      backgroundColor: Color.fromARGB(255, 201, 204, 206),
      body: Padding(
        padding: EdgeInsets.all(50),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomTextField(
                dispCursor: true,
                kbtype: TextInputType.multiline,
                w: .8,
                context: context,
                limit: 30,
                textFieldHint: textConst.title,
                minL: 1,
                maxL: 1,
                cont: title),
            CustomTextField(
                dispCursor: true,
                kbtype: TextInputType.multiline,
                context: context,
                cont: descrip,
                limit: 100,
                textFieldHint: textConst.desc,
                minL: 5,
                maxL: 5,
                w: .8),
            CustomDate(
                ic: Icons.calendar_month,
                f: () {},
                textFieldHint: textConst.date),
            CustomTime(
                ic: Icons.access_time, f: () {}, textFieldHint: textConst.time),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                height: MediaQuery.of(context).size.height * .07,
                width: MediaQuery.of(context).size.width * .8,
                child: DropdownButtonHideUnderline(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                      value: dropdownvalue,
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.blueGrey,
                      ),
                      items: choice.map((String items) {
                        return DropdownMenuItem(
                          value: items,
                          child: Text(
                            items,
                            style: TextStyle(color: Colors.blueGrey),
                          ),
                        );
                      }).toList(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownvalue = newValue!;
                        });
                      },
                    ),
                  ),
                ),
              ),
            ),
            CustomTextField(
                dispCursor: true,
                kbtype: TextInputType.none,
                cont: amount,
                context: context,
                w: .8,
                limit: null,
                textFieldHint: textConst.amount,
                minL: 1,
                maxL: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  number: 1,
                  controller: amount,
                ),
                CustomButton(
                  number: 2,
                  controller: amount,
                ),
                CustomButton(
                  number: 3,
                  controller: amount,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(number: 4, controller: amount),
                CustomButton(number: 5, controller: amount),
                CustomButton(
                  number: 6,
                  controller: amount,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  number: 7,
                  controller: amount,
                ),
                CustomButton(
                  number: 8,
                  controller: amount,
                ),
                CustomButton(
                  number: 9,
                  controller: amount,
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                  number: 0,
                  controller: amount,
                ),
                ElevatedButton(
                    onPressed: () {
                      amount.text =
                          amount.text.substring(0, amount.text.length - 1);
                    },
                    child: Text(textConst.delete),
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(10),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      // fixedSize: MaterialStateProperty.all(
                      //   Size.square(60),
                      // ),
                      minimumSize: MaterialStateProperty.all(
                        Size(120, 40),
                      ),
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
