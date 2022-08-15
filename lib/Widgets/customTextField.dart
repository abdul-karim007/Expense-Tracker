import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
            borderSide: BorderSide.none,
          ),
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(limit),
        ],
        minLines: minL,
        maxLines: maxL,
      ),
    ),
  );
}
