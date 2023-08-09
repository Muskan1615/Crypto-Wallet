import 'package:flutter/material.dart';
import '/screens/wallet_profile_screen/widgets/token.dart';
import '../../theme/color_coding.dart';
import '../../theme/text_theme.dart';
import 'wallet_home_screen.dart';

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
                "Account",
                style: textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  wordSpacing: 2,
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: TokenListView(
                showTrailingIcon: false,
                leading: 'images/profile_pic4.webp',
                title: 'Account 1',
                subtitle1: '9.2362 ETH',
                trailing1: '',
                trailing2: '',
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: TokenListView(
                showTrailingIcon: false,
                leading: 'images/profile_pic1.jpg',
                title: 'Account 2',
                subtitle1: '2.43 ETH',
                trailing1: '',
                trailing2: '',
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: TokenListView(
                showTrailingIcon: false,
                leading: 'images/profile_pic4.webp',
                title: 'Account 3',
                subtitle1: '1.27 ETH',
                trailing1: '',
                trailing2: '',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const WalletHomeScreen(
                            showCreateAccountScreen: true);
                      },
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Create New Account',
                    style: TextStyle(color: secondarySwatch[5]),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 32,
                left: 32,
                top: 8,
                bottom: 42,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const WalletHomeScreen(
                            showImportAccountScreen: true);
                      },
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Import Account',
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
