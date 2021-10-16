import 'package:flutter/material.dart';

class TextFieldContainer extends StatelessWidget {
  final Widget icon;
  final String text;
  final bool security;
  final Function setText;

  const TextFieldContainer({
    Key key,  
    this.icon, 
    this.text, 
    this.security, 
    this.setText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
      margin: EdgeInsets.only(bottom: 5),
      width: size.width * 0.8,
      decoration: BoxDecoration(
        color: Colors.amber.shade50,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        obscureText: security,
        onChanged: (text){
          setText(text);
        },
        decoration: InputDecoration(
          hintText: text,
          icon: icon,
          border: InputBorder.none,
        ),
      ),
    );
  }
}

class Bolean {
}