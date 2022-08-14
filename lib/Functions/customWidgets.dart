import 'package:expensetracker/Constants/textConsts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

CustomTextField(
    {required context,
    required w,
    required limit,
    required textFieldHint,
    required minL,
    required maxL,
    required cont,
    required kbtype,
    required dispCursor}) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 10.0),
    child: SizedBox(
        width: MediaQuery.of(context).size.width * w,
        child: TextFormField(
          showCursor: dispCursor,
          controller: cont,
          keyboardType: kbtype,
          decoration: InputDecoration(
              fillColor: Colors.white,
              filled: true,
              hintText: textFieldHint,
              hintStyle: TextStyle(fontSize: 18, color: Colors.grey),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none)),
          inputFormatters: [
            LengthLimitingTextInputFormatter(limit),
          ],
          minLines: minL,
          maxLines: maxL,
        )),
  );
}

//--------------------------------------//

class CustomDate extends StatefulWidget {
  var ic;
  var textFieldHint;
  var f;
  CustomDate(
      {Key? key,
      required this.ic,
      required this.f,
      required this.textFieldHint})
      : super(key: key);

  @override
  State<CustomDate> createState() => _CustomDateState();
}

class _CustomDateState extends State<CustomDate> {
  TextEditingController dateinput = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(10)),
            height: MediaQuery.of(context).size.height * .07,
            child: IconButton(
                onPressed: widget.f,
                icon: Icon(
                  widget.ic,
                  size: 20,
                  color: Colors.blueGrey,
                ))),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: SizedBox(
              width: MediaQuery.of(context).size.width * .6,
              child: TextFormField(
                controller: dateinput,
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1950),
                      lastDate: DateTime.now());
                  if (pickedDate != null) {
                    String formattedDate =
                        DateFormat('dd-MM-yyyy').format(pickedDate);
                    setState(() {
                      dateinput.text =
                          formattedDate; //set output date to TextField value.
                    });
                  } else {
                    return showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: Text(textConst.noDate),
                        actions: [
                          TextButton(
                              onPressed: (() => Navigator.pop(context)),
                              child: Text('Ok'))
                        ],
                      ),
                    );
                  }
                },
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
}

//----------------------------//

class CustomTime extends StatefulWidget {
  var ic;
  var textFieldHint;
  var f;
  CustomTime(
      {Key? key,
      required this.ic,
      required this.f,
      required this.textFieldHint})
      : super(key: key);

  @override
  State<CustomTime> createState() => _CustomTimeState();
}

class _CustomTimeState extends State<CustomTime> {
  TextEditingController timeInput = TextEditingController();
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
            height: MediaQuery.of(context).size.height * .07,
            child: IconButton(
                onPressed: widget.f,
                icon: Icon(
                  widget.ic,
                  size: 20,
                  color: Colors.blueGrey,
                ))),
        Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: SizedBox(
              width: MediaQuery.of(context).size.width * .6,
              child: TextFormField(
                controller: timeInput,
                readOnly: true,
                onTap: () async {
                  TimeOfDay? timeOfDay = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                    initialEntryMode: TimePickerEntryMode.dial,
                  );

                  if (timeOfDay != null && timeOfDay != TimeOfDay.now()) {
                    setState(() {
                      String formattedTime =
                          timeOfDay.toString().substring(10, 15);

                      timeInput.text = formattedTime;
                    });
                  } else {
                    return showDialog(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: Text(textConst.noDate),
                        actions: [
                          TextButton(
                              onPressed: (() => Navigator.pop(context)),
                              child: Text('Ok'))
                        ],
                      ),
                    );
                  }
                },
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
}

//--------------------------//
class CustomButton extends StatelessWidget {
  final int number;
  final TextEditingController controller;

  const CustomButton({
    Key? key,
    required this.number,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0, right: 3),
      child: ElevatedButton(
        onPressed: () {
          controller.text += number.toString();
        },
        child: Text(
          number.toString(),
          style: TextStyle(color: Colors.blueGrey),
        ),
        style: ButtonStyle(
            elevation: MaterialStateProperty.all(10),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            fixedSize: MaterialStateProperty.all(Size.square(40)),
            backgroundColor: MaterialStateProperty.all(Colors.white)),
      ),
    );
  }
}