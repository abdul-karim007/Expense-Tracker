import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final int number;
  final Function()? onPressed;

  CustomButton({
    Key? key,
    required this.number,
    required this.onPressed,
  }) : super(key: key);

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5.0, right: 5),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        child: Text(
          widget.number.toString(),
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
