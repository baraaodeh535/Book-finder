import 'package:flutter/material.dart';

class ClickableText extends StatelessWidget {

  final String title;
  final Function onPressed;

  ClickableText({this.title,this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(title,style: TextStyle(
          fontSize: 20,color: Color(0xffDC3269)
      ),
      ),
      onTap: onPressed,
    );
  }
}