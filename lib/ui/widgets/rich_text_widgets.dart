import 'package:flutter/material.dart';

class RichTextWidget extends StatelessWidget {
  const RichTextWidget({
    Key? key,
    required this.text,
    required this.subText,
  }) : super(key: key);

  final String text;
  final String subText;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: TextSpan(
            text: text,
            style: const TextStyle(fontSize: 13, color: Colors.grey),
            children:  <TextSpan>[
          TextSpan(
              text:subText == '' ? '' :'($subText)',
              style: TextStyle(
                  color: Colors.white.withOpacity(.8),
                  fontWeight: FontWeight.w600,
                  fontSize: 14))
        ]));
  }
}
