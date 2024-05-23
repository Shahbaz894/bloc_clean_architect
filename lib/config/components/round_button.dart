import 'package:bloc_clean_architect/config/color/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final double height;
  final double width;
  const RoundButton({super.key, required this.title, required this.onPress, required this.height, required this.width});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          boxShadow: const [BoxShadow(
            offset: Offset(0, 3),
            blurRadius: 1,
            spreadRadius: 0,
          ),],
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: Colors.blue)
        ),
        child: Center(child: Text(title,style: TextStyle(color: Colors.black),)),
      ),
    );
  }
}
