import 'dart:ui';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '/screens/secure_wallet/manual_secure_wallet_screen.dart';
import '/screens/secure_wallet/intro_seed_phrase_screen.dart';
import '/screens/secure_wallet/remind_me_later_screen.dart';
import '../../theme/color_coding.dart';
import '../../theme/gradient.dart';
import '../../theme/typography.dart';

class CreateSecureWalletScreen extends StatefulWidget {
  const CreateSecureWalletScreen({super.key});

  @override
  State<CreateSecureWalletScreen> createState() =>
      _CreateSecureWalletScreenState();
}

class _CreateSecureWalletScreenState extends State<CreateSecureWalletScreen> {
  bool showRemindMeLaterPage = false;
  bool showIntroSeedPhrasePage = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: showRemindMeLaterPage ? const Color(0x99222531) : null,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: showRemindMeLaterPage ? const Color(0x99222531) : null,
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
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 24, bottom: 40),
                  child: SizedBox(
                    width: 350,
                    height: 350,
                    child: Image.asset(
                      'images/slider-2.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,
                  ),
                  child: Text(
                    'Secure Your Wallet',
                    style: textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w600,
                      wordSpacing: 2,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 32,
                    right: 32,
                    top: 24,
                    bottom: 16,
                  ),
                  child: RichText(
                    text: TextSpan(
                      text:
                          "Don't risk losing your funds. protect your wallet by saving your",
                      style: textTheme.bodyMedium!.copyWith(
                        fontSize: 18,
                        color: surfaceSwatch[9],
                        height: 1.5,
                        wordSpacing: 2,
                      ),
                      children: [
                        TextSpan(
                          text: '  Seed Phrase  ',
                          style: textTheme.bodyMedium!.copyWith(
                            fontSize: 18,
                            color: secondarySwatch[5],
                            fontWeight: FontWeight.w600,
                            wordSpacing: 2,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return const IntroSeedPhraseScreen();
                                  },
                                ),
                              );
                            },
                        ),
                        TextSpan(
                          text: 'in a place you trust.',
                          style: textTheme.bodyMedium!.copyWith(
                            fontSize: 18,
                            color: surfaceSwatch[9],
                            height: 1.5,
                            wordSpacing: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    "It's the only way to recover your wallet if you get locked out of the app or get a new device.",
                    style: textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w600,
                      height: 1.5,
                      color: surfaceSwatch[9],
                      wordSpacing: 2,
                    ),
                  ),
                ),
              ],
            ),
          ),
          if (showRemindMeLaterPage)
            WillPopScope(
              onWillPop: () async {
                setState(() {
                  showRemindMeLaterPage = false;
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
                          showRemindMeLaterPage = false;
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
                    const RemindMeLaterScreen(),
                  ],
                ),
              ),
            ),
          // if (showIntroSeedPhrasePage)
          //   WillPopScope(
          //     onWillPop: () async {
          //       setState(() {
          //         showIntroSeedPhrasePage = false;
          //       });
          //       return false;
          //     },
          //     child: BackdropFilter(
          //       filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
          //       child: Stack(
          //         children: [
          //           GestureDetector(
          //             onTap: () {
          //               setState(() {
          //                 showIntroSeedPhrasePage = false;
          //               });
          //             },
          //             child: const Stack(
          //               children: [
          //                 ModalBarrier(
          //                   color: Color(0x99222531),
          //                   dismissible: true,
          //                 ),
          //               ],
          //             ),
          //           ),
          //           const IntroSeedPhraseScreen(),
          //         ],
          //       ),
          //     ),
          //   ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: !showRemindMeLaterPage
          ? Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: const EdgeInsets.all(32),
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          splashFactory: NoSplash.splashFactory),
                      onPressed: () {
                        setState(() {
                          showRemindMeLaterPage = true;
                        });
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Remind Me Later',
                          style: TextStyle(color: secondarySwatch[5]),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    padding:
                        const EdgeInsets.only(bottom: 42, left: 24, right: 24),
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
                                return ManualSecureWalletScreen(
                                  showProtectYourWalletPage: false,
                                );
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
                  ),
                ],
              ),
            )
          : null,
    );
  }
}
