
import 'package:flutter/material.dart';

import '../utils/theme/font_styles.dart';


class CustomTextButton extends StatelessWidget {
  const CustomTextButton({super.key, this.onPressed, required this.text, this.textStyle,});
  final void Function()? onPressed ;
  final String text;
  final TextStyle? textStyle;



  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child:  Text(
        text,
        style:textStyle ??  FontStyles.font14PrimaryBold,
      ),
    );
  }
}