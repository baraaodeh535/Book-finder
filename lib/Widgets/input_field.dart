import 'package:flutter/material.dart';

class InputField extends StatelessWidget {

  final String hintText;
  final IconData textIcon;
  final Function onChanged;

  InputField({this.hintText,this.textIcon,this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primaryColor: Color(0xff00A388),
          primaryColorDark: Colors.lightGreenAccent),
      child: Material(
        elevation: 10,
        borderRadius: BorderRadius.circular(30),
        child: TextField(textAlign: TextAlign.center,

          decoration: InputDecoration(
              hintText: hintText,
              prefixIcon: Icon(textIcon),

              focusedBorder:  OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff00A388),
                    width: 3.5),
                borderRadius: BorderRadius.circular(30),

              ),


              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Color(0xff00A388),
                    width: 2.0),
                borderRadius: BorderRadius.circular(30),

              )

          ),
          onChanged: onChanged,
        ),
      ),
    );
  }
}
