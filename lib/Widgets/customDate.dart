import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:expensetracker/Constants/textConsts.dart';

class CustomDate extends StatefulWidget {
  var textFieldHint;
  var cont;
  CustomDate({Key? key, required this.textFieldHint, required this.cont})
      : super(key: key);

  @override
  State<CustomDate> createState() => _CustomDateState();
}

class _CustomDateState extends State<CustomDate> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            height: MediaQuery.of(context).size.height * .075,
            child: IconButton(
                onPressed: pickdate,
                icon: Icon(
                  Icons.calendar_month,
                  size: 20,
                  color: Colors.blueGrey,
                ))),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: SizedBox(
              width: MediaQuery.of(context).size.width * .65,
              child: TextFormField(
                controller: widget.cont,
                readOnly: true,
                onTap: pickdate,
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: widget.textFieldHint,
                    hintStyle: TextStyle(fontSize: 18, color: Colors.grey),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none)),
                minLines: 1,
                maxLines: 1,
              )),
        ),
      ],
    );
  }

  pickdate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime.now());
    if (pickedDate != null) {
      String formattedDate = DateFormat('dd MMM, yyyy').format(pickedDate);
      setState(() {
        widget.cont.text = formattedDate; //set output date to TextField value.
      });
    } else {
      return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(textConst.noDate),
          actions: [
            TextButton(
                onPressed: (() => Navigator.pop(context)), child: Text('Ok'))
          ],
        ),
      );
    }
  }
}
