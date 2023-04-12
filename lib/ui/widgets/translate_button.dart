import 'package:flutter/material.dart';

class TranslateButton extends StatelessWidget {
  const TranslateButton({
    required this.onPressed,
    required this.text,
    Key? key,
  }) : super(key: key);

  final Function onPressed;
  final String  text;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => onPressed(),
      style: ElevatedButton.styleFrom(
        elevation: 0,
        primary: Color(0xff232527),
        padding: EdgeInsets.symmetric(horizontal: 35,vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16)
        )

      ),
      
      child: Text(
        text,
        style: TextStyle(
          fontSize: 16
        ),

      ),
    );
  }
}