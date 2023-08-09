import 'package:flutter/material.dart';
import '../../theme/color_coding.dart';
import '../../theme/text_theme.dart';
import 'widgets/token.dart';

class SentTransactionScreen extends StatelessWidget {
  const SentTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        height: 580,
        color: surfaceSwatch[24],
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 32, right: 32, top: 20, bottom: 32),
              child: Text(
                "Sent BNB",
                style: textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  wordSpacing: 2,
                ),
              ),
            ),
            TokenListView(
              showTrailingIcon: false,
              title: 'Status',
              titleTextStyle: textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w600,
                color: surfaceSwatch[12],
              ),
              subtitle2: 'Cancelled',
              subtitle2Color: errorSwatch[5],
              trailing1: 'Date',
              trailing1TextStyle: textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w600,
                color: surfaceSwatch[12],
              ),
              trailing2: 'Mar 3 at 10:04am',
              trailing2TextStyle: textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w600,
                color: surfaceSwatch[5],
              ),
            ),
            TokenListView(
              showTrailingIcon: false,
              title: 'From',
              titleTextStyle: textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w600,
                color: surfaceSwatch[12],
              ),
              subtitle2: '0x3Dc6...DfCE',
              subtitle2Color: surfaceSwatch[5],
              trailing1: 'To',
              trailing1TextStyle: textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w600,
                color: surfaceSwatch[12],
              ),
              trailing2: '0x3Dc6...DfF9',
              trailing2TextStyle: textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w600,
                color: surfaceSwatch[5],
              ),
            ),
            TokenListView(
              showTrailingIcon: false,
              title: 'None',
              titleTextStyle: textTheme.bodySmall!.copyWith(
                fontWeight: FontWeight.w600,
                color: surfaceSwatch[12],
              ),
              subtitle2: '#0',
              subtitle2Color: surfaceSwatch[5],
              trailing1: '',
              trailing2: '',
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
                color: surfaceSwatch[20],
              ),
              child: Column(
                children: [
                  TokenListView(
                    showTrailingIcon: false,
                    padding: const EdgeInsets.only(
                      top: 12,
                      left: 16,
                      right: 16,
                    ),
                    title: 'Amount',
                    titleTextStyle: textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: surfaceSwatch[5],
                    ),
                    subtitle1: 'Network fee',
                    subtitle1TextStyle: textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: surfaceSwatch[5],
                      fontSize: 18,
                    ),
                    trailing1: '2.35 BNB',
                    trailing1TextStyle: textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: surfaceSwatch[5],
                    ),
                    trailing2: '0.21 BNB',
                    trailing2TextStyle: textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                      color: surfaceSwatch[5],
                    ),
                  ),
                  Divider(
                    color: surfaceSwatch[12],
                  ),
                  const TokenListView(
                    showTrailingIcon: false,
                    padding: EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: 8,
                    ),
                    title: 'Total Amount',
                    trailing1: '2.56 BNB',
                    trailing2: '\$594.304',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
