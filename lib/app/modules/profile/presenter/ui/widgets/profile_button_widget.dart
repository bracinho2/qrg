import 'package:flutter/material.dart';

class ProfileButtonWidget extends StatelessWidget {
  final Color? color;
  final String label;
  final void Function()? onPressed;

  const ProfileButtonWidget({
    Key? key,
    this.color,
    required this.label,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 35,
      width: 200,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          label,
          //style: AppTextStyles.loginButton,
        ),
      ),
    );
  }
}
