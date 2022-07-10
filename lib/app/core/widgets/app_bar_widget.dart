import 'package:flutter/material.dart';
import 'package:qrg/app/core/styles/app_text_styles.dart';
import 'package:qrg/app/core/widgets/login_icon_widget.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subTitle;
  final bool loginbutton;
  const AppBarWidget({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.loginbutton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 20, left: 20),
      decoration: const BoxDecoration(color: Colors.black87),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTextStyles.appBarTitle),
                Text(subTitle, style: AppTextStyles.appBarSubtitle),
              ]),
          if (loginbutton) LoginIconButton(),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(75);
}
