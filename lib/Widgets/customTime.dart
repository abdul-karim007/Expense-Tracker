import 'package:flutter/material.dart';
import 'package:expensetracker/Constants/textConsts.dart';

class CustomTime extends StatefulWidget {
  var textFieldHint;
  var time;
  CustomTime({Key? key, required this.textFieldHint, required this.time})
      : super(key: key);

  @override
  State<CustomTime> createState() => _CustomTimeState();
}

class _CustomTimeState extends State<CustomTime> {
  late TimeOfDay selectedTime;

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
                onPressed: pickTime,
                icon: Icon(
                  Icons.access_time,
                  size: 20,
                  color: Colors.blueGrey,
                ))),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: SizedBox(
              width: MediaQuery.of(context).size.width * .65,
              child: TextFormField(
                controller: widget.time,
                readOnly: true,
                onTap: pickTime,
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

  pickTime() async {
    TimeOfDay? timeOfDay = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.dial,
    );

    if (timeOfDay != null) {
      setState(() {
        String formattedTime = timeOfDay.format(context);
        widget.time.text = formattedTime;
      });
    } else {
      return showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(textConst.noTime),
          actions: [
            TextButton(
                onPressed: (() => Navigator.pop(context)), child: Text('Ok'))
          ],
        ),
      );
    }
  }
}
