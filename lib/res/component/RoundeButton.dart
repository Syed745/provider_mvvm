import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:mvvm/res/constant/colors.dart';

class RoundedButton extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  final bool loading;
  const RoundedButton(
      {super.key,
      required this.title,
      required this.onPress,
      this.loading = false});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        color: backGroundColor,
        width: double.infinity,
        height: 60,
        child: Center(
          child: loading
              ? LoadingAnimationWidget.fourRotatingDots(
                  color: Colors.white,
                  size: 50,
                )
              : Text(
                  title,
                  style: TextStyle(color: Colors.white),
                ),
        ),
      ),
    );
  }
}
