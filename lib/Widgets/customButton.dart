import 'package:flutter/material.dart';

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
