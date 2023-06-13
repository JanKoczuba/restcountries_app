import 'package:flutter/material.dart';

import '../../resource/app_border.dart';
import '../../resource/app_color.dart';
import '../../resource/app_text_style.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    required this.child,
    this.customTextStyle,
    this.onPressed,
    this.borderColor,
    EdgeInsetsGeometry? padding,
    Color? color,
    Key? key,
  })  : padding = padding ?? const EdgeInsets.all(18),
        color = color ?? AppColor.buttonPrimary,
        super(key: key);

  final VoidCallback? onPressed;
  final TextStyle? customTextStyle;
  final Widget child;
  final EdgeInsetsGeometry padding;
  final Color? color;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: RoundedRectangleBorder(
        borderRadius: AppBorder.baseButtonBorder,
        side: BorderSide(
          color: borderColor ?? Colors.transparent,
          width: 2,
        ),
      ),
      color: color,
      child: InkWell(
        borderRadius: AppBorder.baseButtonBorder,
        highlightColor: AppColor.buttonPrimaryHighlight,
        onTap: onPressed,
        child: DefaultTextStyle(
          style: customTextStyle ?? AppTextStyles.baseButton,
          child: Padding(
            padding: padding,
            child: Center(child: child),
          ),
        ),
      ),
    );
  }
}
