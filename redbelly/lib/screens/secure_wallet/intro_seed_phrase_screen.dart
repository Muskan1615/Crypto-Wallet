import 'package:flutter/material.dart';
import '../../theme/color_coding.dart';
import '../../theme/gradient.dart';
import '../../theme/text_theme.dart';
import 'create_secure_wallet_screen.dart';

class IntroSeedPhraseScreen extends StatelessWidget {
  const IntroSeedPhraseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 582,
        color: surfaceSwatch[24],
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
              child: Text(
                "What is a 'Seed Phrase'",
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
                "A seed phrase is a set of twelve words that contains all the information about your wallet, including your funds. It's like a secret code used to access your entire wallet.",
                style: textTheme.bodyMedium!.copyWith(
                  wordSpacing: 2,
                  height: 1.5,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
              child: Text(
                "You must keep your seed phrase secret and safe. If someone gets your seed phrase, they'll gain control over your accounts.",
                style: textTheme.bodyMedium!.copyWith(
                  wordSpacing: 2,
                  height: 1.5,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
              child: Text(
                "Save it in a place where only you can access it. If you lose it, not even MetaMask can help you recover it.",
                style: textTheme.bodyMedium!.copyWith(
                  wordSpacing: 2,
                  height: 1.5,
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
                          return const CreateSecureWalletScreen();
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
