import 'package:flutter/material.dart';

class CustomOutlinedButton extends StatelessWidget {

  final Function onPressed;
  final String text;
  final Color color;
  final bool filled;

  const CustomOutlinedButton({super.key, required this.onPressed, required this.text, this.color = Colors.blue, this.filled = false});

  @override
  Widget build(BuildContext context){
    return OutlinedButton(
      style: ButtonStyle(
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(30))
        ),
        side: MaterialStateProperty.all(
          BorderSide(color: color)
        ),
        backgroundColor: MaterialStateProperty.all(
          filled ? color : Colors.transparent
        )
      ),
      onPressed: () => onPressed(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(text, style: TextStyle(color: color, fontSize: 16),),
      ),
    );
  }
}