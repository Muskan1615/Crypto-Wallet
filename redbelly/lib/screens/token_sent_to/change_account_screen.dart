import 'package:flutter/material.dart';
import '../../theme/color_coding.dart';
import '../../theme/text_theme.dart';
import '../wallet_profile_screen/widgets/token.dart';

class ChangeAccountScreen extends StatelessWidget {
  const ChangeAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 524,
        color: surfaceSwatch[24],
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 32, right: 32, top: 20, bottom: 32),
              child: Text(
                "Accounts",
                style: textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  wordSpacing: 2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TokenListView(
                showTrailingIcon: true,
                leading: 'images/profile_pic4.webp',
                title: 'Account 1',
                subtitle1: '0x4Dc6...DxR9',
                trailing1: '',
                trailing2: '',
                trailingIcon: Icons.check_circle_outline,
                trailingIconColor: onPrimarySwatch[7],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: TokenListView(
                showTrailingIcon: false,
                leading: 'images/profile_pic1.jpg',
                title: 'Account 2',
                subtitle1: '0x3Dc6...DxE9',
                trailing1: '',
                trailing2: '',
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: TokenListView(
                showTrailingIcon: false,
                leading: 'images/profile_pic2.jpg',
                title: 'Account 3',
                subtitle1: '0x2Dc6...DcT9',
                trailing1: '',
                trailing2: '',
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: TokenListView(
                showTrailingIcon: false,
                leading: 'images/profile_pic3.jpg',
                title: 'Account 4',
                subtitle1: '0x3R2E...DxR9',
                trailing1: '',
                trailing2: '',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
