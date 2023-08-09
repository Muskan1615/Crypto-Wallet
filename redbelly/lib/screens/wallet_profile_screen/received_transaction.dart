import 'package:flutter/material.dart';
import 'package:redbelly/screens/wallet_profile_screen/token_bnb_screen.dart';

import '../../theme/color_coding.dart';
import '../../theme/text_theme.dart';
import 'widgets/token.dart';

class ReceivedTransactionScreen extends StatelessWidget {
  const ReceivedTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 40),
        height: 564,
        color: surfaceSwatch[24],
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 32, right: 32, top: 20, bottom: 32),
              child: Text(
                "Received BNB",
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
              subtitle2: 'Confirmed',
              subtitle2Color: onPrimarySwatch[5],
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
              padding: const EdgeInsets.only(
                top: 12,
                left: 16,
                right: 16,
                bottom: 8,
              ),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
                color: surfaceSwatch[20],
              ),
              child: const TokenListView(
                showTrailingIcon: false,
                padding: EdgeInsets.zero,
                title: 'Total Amount',
                trailing1: '0.04 BNB',
                trailing2: '\$9.58799',
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 32,
                left: 32,
                top: 20,
                bottom: 42,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const TokenBNBScreen();
                      },
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'View on Mainnet',
                    style: TextStyle(color: secondarySwatch[5]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
