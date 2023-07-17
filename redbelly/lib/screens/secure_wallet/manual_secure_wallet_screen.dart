import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:redbelly/screens/secure_wallet/tap_view_seed_phrase_screen.dart';
import '/screens/secure_wallet/protect_your_wallet_screen.dart';
import '../../theme/color_coding.dart';
import '../../theme/gradient.dart';
import '../../theme/typography.dart';

class ManualSecureWalletScreen extends StatefulWidget {
  late final bool? showProtectYourWalletPage;

  // ignore: prefer_const_constructors_in_immutables
  ManualSecureWalletScreen({
    Key? key,
    this.showProtectYourWalletPage,
  }) : super(key: key);

  @override
  State<ManualSecureWalletScreen> createState() =>
      _ManualSecureWalletScreenState();
}

class _ManualSecureWalletScreenState extends State<ManualSecureWalletScreen> {
  List<String> risks = [
    "You lose it",
    "You forget where you put it",
    "Someone else finds it",
  ];
  List<String> tips = [
    "Store in bank vault",
    "Store in a safe",
    "store in multiple scret places",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            widget.showProtectYourWalletPage! ? const Color(0x99222531) : null,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: widget.showProtectYourWalletPage!
                ? const Color(0x99222531)
                : null,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          padding: const EdgeInsets.only(left: 16.0),
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 24,
                    bottom: 16,
                    left: 32,
                    right: 32,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Align(
                          alignment: Alignment.center,
                          child: ShaderMask(
                            shaderCallback: (bounds) => Gradients.customShader(
                              bounds,
                              Gradients.gradient6,
                            ),
                            child: Text(
                              'Secure Your Wallet',
                              style: textTheme.titleMedium!.copyWith(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Icon(Icons.info_outline),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: RichText(
                    text: TextSpan(
                      text: "Secure your wallet's ",
                      style: textTheme.bodyMedium!.copyWith(
                            color: surfaceSwatch[9],
                            fontSize: 18,
                            height: 1.5,
                            wordSpacing: 2,
                          ),
                      children: [
                        TextSpan(
                          text: '"Seed Phrase"',
                          style:
                              textTheme.bodyMedium!.copyWith(
                                    fontSize: 18,
                                    color: secondarySwatch[5],
                                    wordSpacing: 2,
                                  ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 32,
                    right: 32,
                    top: 40,
                    bottom: 16,
                  ),
                  child: Text(
                    "Manual",
                    style: textTheme.bodyMedium!.copyWith(
                      wordSpacing: 2,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    'Write down your seed phrase on a piece of paper and store in a safe place.',
                    style: textTheme.bodyMedium!.copyWith(
                      height: 1.5,
                      wordSpacing: 2,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 32,
                    right: 32,
                    top: 16,
                    bottom: 24,
                  ),
                  child: Text(
                    'Security Level: Very Strong',
                    style: textTheme.bodyMedium!.copyWith(
                      height: 1.5,
                      wordSpacing: 2,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 70,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(2),
                          child: LinearProgressIndicator(
                            value: 1,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                onPrimarySwatch[5]!),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      SizedBox(
                        width: 70,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(2),
                          child: LinearProgressIndicator(
                            value: 1,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                onPrimarySwatch[5]!),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      SizedBox(
                        width: 70,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(2),
                          child: LinearProgressIndicator(
                            value: 1,
                            valueColor: AlwaysStoppedAnimation<Color>(
                                onPrimarySwatch[5]!),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 32,
                    right: 32,
                    top: 24,
                    bottom: 16,
                  ),
                  child: Text(
                    "Risks are:",
                    style: textTheme.bodyMedium!.copyWith(
                      wordSpacing: 2,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 32,
                    right: 32,
                  ),
                  child: Column(
                    children: risks.map((risk) {
                      return Row(children: [
                        const Text(
                          "\u2022",
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            risk,
                            style: textTheme.bodyMedium!.copyWith(
                              wordSpacing: 2,
                              height: 1.5,
                            ),
                          ),
                        )
                      ]);
                    }).toList(),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 32),
                  child: Text(
                    "Other options: Doesn't have to be paper!",
                    style: textTheme.bodyMedium!.copyWith(
                      wordSpacing: 2,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 32,
                    right: 32,
                    bottom: 16,
                  ),
                  child: Text(
                    "Tips:",
                    style: textTheme.bodyMedium!.copyWith(
                      wordSpacing: 2,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 32,
                    right: 32,
                    bottom: 16,
                  ),
                  child: Column(
                    children: tips.map((tip) {
                      return Row(children: [
                        const Text(
                          "\u2022",
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            tip,
                            style: textTheme.bodyMedium!.copyWith(
                              wordSpacing: 2,
                              height: 1.5,
                            ),
                          ),
                        )
                      ]);
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          if (widget.showProtectYourWalletPage!)
            WillPopScope(
              onWillPop: () async {
                setState(() {
                  widget.showProtectYourWalletPage = false;
                });
                return false;
              },
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
                child: Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          widget.showProtectYourWalletPage = false;
                        });
                      },
                      child: const Stack(
                        children: [
                          ModalBarrier(
                            color: Color(0x99222531),
                            dismissible: true,
                          ),
                        ],
                      ),
                    ),
                    const ProtectYourWalletScreen(),
                  ],
                ),
              ),
            ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: !widget.showProtectYourWalletPage!
          ? Container(
              padding: const EdgeInsets.only(bottom: 42, left: 24, right: 24),
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
                          return const TapViewSeedPhraseScreen();
                        },
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text('Start'),
                  ),
                ),
              ),
            )
          : null,
    );
  }
}
