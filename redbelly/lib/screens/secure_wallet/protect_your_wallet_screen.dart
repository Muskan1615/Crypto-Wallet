import 'package:flutter/material.dart';
import '/screens/secure_wallet/manual_secure_wallet_screen.dart';
import '../../theme/color_coding.dart';
import '../../theme/gradient.dart';
import '../../theme/typography.dart';

class ProtectYourWalletScreen extends StatelessWidget {
  const ProtectYourWalletScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 386,
        color: surfaceSwatch[24],
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
              child: Text(
                "Protect Your Wallet",
                style: textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  wordSpacing: 2,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
              child: Text(
                "Dont’t risk losing your funds. Protect your wallet by saving your seed phrase in a place you trust.",
                style: textTheme.bodyMedium!.copyWith(
                  height: 1.5,
                  wordSpacing: 2,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
              child: Text(
                "It’s the only way to recover your wallet if you get locked out of the app or get a new device.",
                style: textTheme.bodyMedium!.copyWith(
                  height: 1.5,
                  wordSpacing: 2,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 60,
                left: 60,
                top: 50,
                bottom: 42,
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: Gradients.gradient2,
                  borderRadius: BorderRadius.circular(80),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return ManualSecureWalletScreen(showProtectYourWalletPage:false,);
                        },
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text('I Got It'),
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
