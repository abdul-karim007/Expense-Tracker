import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  var w;
  var limit;
  var textFieldHint;
  var minL;
  var maxL;
  var cont;
  var kbtype;
  var dispCursor;
  CustomTextField(
      {Key? key,
      required this.w,
      required this.limit,
      required this.textFieldHint,
      required this.minL,
      required this.maxL,
      required this.cont,
      required this.kbtype,
      required this.dispCursor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 5.0),
      child: SizedBox(
          width: MediaQuery.of(context).size.width * w,
          child: TextField(
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
}
