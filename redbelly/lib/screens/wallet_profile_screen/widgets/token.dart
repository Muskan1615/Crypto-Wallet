import 'package:flutter/material.dart';
import '/theme/color_coding.dart';
import '../../../theme/text_theme.dart';

class TokenListView extends StatelessWidget {
  final EdgeInsets? padding;
  final String? leading;
  final Color? leadingColor;
  final double? width;
  final double? height;
  final double? radius;
  final String? title;
  final String? subtitle1;
  final String? subtitle2;
  final Color? subtitle2Color;
  final String trailing1;
  final String trailing2;
  final bool? showTrailingIcon;
  final IconData? trailingIcon;
  final Color? trailingIconColor;
  final void Function()? onTap;
  final TextStyle? titleTextStyle;
  final TextStyle? subtitle1TextStyle;
  final TextStyle? subtitle2TextStyle;
  final TextStyle? trailing1TextStyle;
  final TextStyle? trailing2TextStyle;

  const TokenListView({
    this.padding,
    this.leading,
    this.leadingColor,
    this.width,
    this.height,
    this.radius,
    this.title,
    this.subtitle1,
    this.subtitle2,
    this.subtitle2Color,
    required this.trailing1,
    required this.trailing2,
     this.showTrailingIcon,
     this.trailingIcon,
     this.trailingIconColor,
    this.onTap,
    this.titleTextStyle,
    this.subtitle1TextStyle,
    this.subtitle2TextStyle,
    this.trailing1TextStyle,
    this.trailing2TextStyle,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: padding ?? const EdgeInsets.only(bottom: 24),
      leading: leading != null
          ? Container(
              width: width ?? 50,
              height: height ?? 50,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(radius ?? 50)),
                image: DecorationImage(
                  colorFilter: ColorFilter.mode(
                      leadingColor ?? Colors.transparent, BlendMode.srcATop),
                  fit: BoxFit.cover,
                  image: AssetImage(leading!),
                ),
              ),
            )
          : null,
      title: Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Text(
          title!,
          style: titleTextStyle ??
              textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
        ),
      ),
      subtitle: RichText(
        text: TextSpan(
          text: subtitle1,
          style: subtitle1TextStyle ??
              textTheme.bodySmall!.copyWith(
                  color: surfaceSwatch[13],
                  fontSize: 16,
                  fontWeight: FontWeight.w600),
          children: [
            TextSpan(
              text: subtitle2,
              style: subtitle2TextStyle ??
                  textTheme.bodySmall!.copyWith(
                      color: subtitle2Color,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Visibility(
            visible: showTrailingIcon!,
            child: Icon(
              trailingIcon,
              color: trailingIconColor,
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                trailing1,
                style: trailing1TextStyle ??
                    textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 13),
              Text(
                trailing2,
                style: trailing2TextStyle ??
                    textTheme.bodySmall!.copyWith(
                      fontWeight: FontWeight.w600,
                      color: surfaceSwatch[12],
                    ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
