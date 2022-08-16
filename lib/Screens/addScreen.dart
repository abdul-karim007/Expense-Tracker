import 'package:expensetracker/Constants/textConsts.dart';
import 'package:expensetracker/Screens/home.dart';
import 'package:expensetracker/Widgets/customButton.dart';
import 'package:expensetracker/Widgets/customDate.dart';
import 'package:expensetracker/Widgets/customTime.dart';
import 'package:expensetracker/Widgets/customTextField.dart';
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
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Home(
                title: title.text,
                descrip: descrip.text,
                date: date.text,
                time: time.text,
                dropdownValue: dropdownvalue,
                amount: amount.text,
              ),
            ),
          );
        },
        child: Icon(Icons.check),
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
              cont: title,
            ),
            CustomTextField(
              dispCursor: true,
              kbtype: TextInputType.multiline,
              context: context,
              cont: descrip,
              limit: 100,
              textFieldHint: textConst.desc,
              minL: 5,
              maxL: 5,
              w: .8,
            ),
            CustomDate(
              ic: Icons.calendar_month,
              f: () {},
              textFieldHint: textConst.date,
              cont: date,
            ),
            CustomTime(
              ic: Icons.access_time,
              f: () {},
              textFieldHint: textConst.time,
              time: time,
            ),
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
              maxL: 1,
            ),
            // TextFormField(
            //   onChanged: (d) {
            //     print("akjhsddh");
            //     amount.selection = TextSelection.fromPosition(
            //       TextPosition(
            //         offset: amount.text.length - d.length,
            //         affinity: TextAffinity.downstream,
            //       ),
            //     );

            //     print("akjhsddh  ${amount.selection}");
            //     amount.text += d.toString();
            //   },
            //   controller: amount,
            //   // enableInteractiveSelection: true,
            //   keyboardType: TextInputType.none,
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 1; i <= 3; i++)
                  CustomButton(
                    number: i,
                    onPressed: () {
                      var cursorPos = amount.selection.base.offset;
                      if (cursorPos > 0) {
                        String suffixText = amount.text.substring(cursorPos);

                        String prefixText = amount.text.substring(0, cursorPos);

                        amount.text = prefixText + i.toString() + suffixText;

                        amount.selection = TextSelection(
                          baseOffset: cursorPos + 1,
                          extentOffset: cursorPos + 1,
                        );
                      } else {
                        amount.text += i.toString();
                      }
                    },
                  ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 4; i <= 6; i++)
                  CustomButton(
                    number: i,
                    onPressed: () {
                      var cursorPos = amount.selection.base.offset;
                      if (cursorPos > 0) {
                        String suffixText = amount.text.substring(cursorPos);

                        String prefixText = amount.text.substring(0, cursorPos);

                        amount.text = prefixText + i.toString() + suffixText;

                        amount.selection = TextSelection(
                          baseOffset: cursorPos + 1,
                          extentOffset: cursorPos + 1,
                        );
                      } else {
                        amount.text += i.toString();
                      }
                    },
                  ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                for (int i = 7; i <= 9; i++)
                  CustomButton(
                    number: i,
                    onPressed: () {
                      var cursorPos = amount.selection.base.offset;
                      if (cursorPos > 0) {
                        String suffixText = amount.text.substring(cursorPos);

                        String prefixText = amount.text.substring(0, cursorPos);

                        amount.text = prefixText + i.toString() + suffixText;

                        amount.selection = TextSelection(
                          baseOffset: cursorPos + 1,
                          extentOffset: cursorPos + 1,
                        );
                      } else {
                        amount.text += i.toString();
                      }
                    },
                  ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomButton(
                    number: 0,
                    onPressed: () {
                      var cursorPos = amount.selection.base.offset;
                      if (cursorPos > 0) {
                        String suffixText = amount.text.substring(cursorPos);

                        String prefixText = amount.text.substring(0, cursorPos);

                        amount.text = prefixText + 0.toString() + suffixText;

                        amount.selection = TextSelection(
                          baseOffset: cursorPos + 1,
                          extentOffset: cursorPos + 1,
                        );
                      } else {
                        amount.text += 0.toString();
                      }
                    }),
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
                    minimumSize: MaterialStateProperty.all(
                      Size(120, 40),
                    ),
                    backgroundColor: MaterialStateProperty.all(Colors.red),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
