import 'dart:ui';
import 'package:flutter/material.dart';
import '../token_sent_to/change_account_screen.dart';
import '/screens/wallet_profile_screen/received_transaction.dart';
import '/screens/wallet_profile_screen/sent_transaction_screen.dart';
import '../token_sent_to/token_sent_screen.dart';
import '../../theme/color_coding.dart';
import '../../theme/gradient.dart';
import '../../theme/text_theme.dart';
import 'widgets/token.dart';

class TokenBNBScreen extends StatefulWidget {
  final bool? showChangeAccountScreen;
  
  const TokenBNBScreen({
    super.key,
    this.showChangeAccountScreen,
  });

  @override
  State<TokenBNBScreen> createState() => _TokenBNBScreenState();
}

class _TokenBNBScreenState extends State<TokenBNBScreen> {
  int currentIndex = 0;
  bool showReceivedScreen = false;
  bool showSentScreen = false;
  bool showTokenSentScreen = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: showReceivedScreen ||
                showSentScreen ||
                showTokenSentScreen ||
                widget.showChangeAccountScreen == true
            ? const Color(0x99222531)
            : null,
        title: const Text('BNB'),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: showReceivedScreen ||
                    showSentScreen ||
                    showTokenSentScreen ||
                    widget.showChangeAccountScreen == true
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
            physics: const NeverScrollableScrollPhysics(),
            child: Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 54,
                      bottom: 24,
                    ),
                    child: ShaderMask(
                      shaderCallback: (bounds) => Gradients.customShader(
                        bounds,
                        Gradients.gradient6,
                      ),
                      child: Text(
                        '19.2371 BNB',
                        style: textTheme.displaySmall,
                      ),
                    ),
                  ),
                ),
                Center(
                  child: Text(
                    "\$4,360.8582",
                    style: textTheme.bodySmall!.copyWith(
                        fontSize: 18,
                        color: surfaceSwatch[4],
                        fontWeight: FontWeight.w500),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40,
                    bottom: 10,
                  ),
                  child: Wrap(
                    spacing: 10,
                    children: [
                      ElevatedButton(
                        style: ButtonStyle(
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.all(12)),
                          backgroundColor:
                              MaterialStatePropertyAll(surfaceSwatch[21]),
                          fixedSize:
                              const MaterialStatePropertyAll(Size(110, 48)),
                          textStyle:
                              MaterialStatePropertyAll(textTheme.titleSmall),
                        ),
                        onPressed: () {
                          setState(() {
                            showTokenSentScreen = true;
                          });
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              'images/sent.png',
                              color: primarySwatch,
                            ),
                            const Text(
                              'Sent',
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          padding: const MaterialStatePropertyAll(
                              EdgeInsets.all(12)),
                          backgroundColor:
                              MaterialStatePropertyAll(surfaceSwatch[21]),
                          fixedSize:
                              const MaterialStatePropertyAll(Size(145, 48)),
                          textStyle:
                              MaterialStatePropertyAll(textTheme.titleSmall),
                        ),
                        onPressed: () {},
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              'images/receive.png',
                              color: primarySwatch,
                            ),
                            const Text(
                              'Receive',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.maxFinite,
                  height: double.maxFinite,
                  child: ListView(
                    padding: const EdgeInsets.symmetric(
                        vertical: 32, horizontal: 40),
                    children: [
                      Text(
                        'Mar 3 at 10:04am',
                        style: textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: surfaceSwatch[12],
                        ),
                      ),
                      TokenListView(
                        showTrailingIcon: false,
                        width: 35,
                        height: 35,
                        radius: 0,
                        leading: 'images/receive.png',
                        leadingColor: primarySwatch,
                        title: 'Received BNB',
                        subtitle2: 'Confirmed',
                        subtitle2Color: onPrimarySwatch[5],
                        trailing1: '0.04 BNB',
                        trailing2: '\$9.58799',
                        onTap: () {
                          setState(() {
                            showReceivedScreen = true;
                          });
                        },
                      ),
                      Text(
                        'Mar 3 at 10:04am',
                        style: textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: surfaceSwatch[12],
                        ),
                      ),
                      TokenListView(
                        showTrailingIcon: false,
                        width: 35,
                        height: 35,
                        radius: 0,
                        leading: 'images/sent.png',
                        leadingColor: primarySwatch,
                        title: 'Sent BNB',
                        subtitle2: 'Cancelled',
                        subtitle2Color: errorSwatch[5],
                        trailing1: '2.35 BNB',
                        trailing2: '\$547.5265',
                        onTap: () {
                          setState(() {
                            showSentScreen = true;
                          });
                        },
                      ),
                      Text(
                        'Mar 3 at 10:04am',
                        style: textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: surfaceSwatch[12],
                        ),
                      ),
                      TokenListView(
                        showTrailingIcon: false,
                        width: 35,
                        height: 35,
                        radius: 0,
                        leading: 'images/receive.png',
                        leadingColor: primarySwatch,
                        title: 'Received BNB',
                        subtitle2: 'Confirmed',
                        subtitle2Color: onPrimarySwatch[5],
                        trailing1: '1.876 BNB',
                        trailing2: '\$436.11371',
                      ),
                      Text(
                        'Mar 3 at 10:04am',
                        style: textTheme.bodySmall!.copyWith(
                          fontWeight: FontWeight.w600,
                          color: surfaceSwatch[12],
                        ),
                      ),
                      TokenListView(
                        showTrailingIcon: false,
                        width: 35,
                        height: 35,
                        radius: 0,
                        leading: 'images/sent.png',
                        leadingColor: primarySwatch,
                        title: 'Sent BNB',
                        subtitle2: 'Confirmed',
                        subtitle2Color: onPrimarySwatch[5],
                        trailing1: '0.04 BNB',
                        trailing2: '\$9.58799',
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          if (showReceivedScreen)
            WillPopScope(
              onWillPop: () async {
                setState(() {
                  showReceivedScreen = false;
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
                          showReceivedScreen = false;
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
                    const ReceivedTransactionScreen(),
                  ],
                ),
              ),
            ),
          if (showSentScreen)
            WillPopScope(
              onWillPop: () async {
                setState(() {
                  showSentScreen = false;
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
                          showSentScreen = false;
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
                    const SentTransactionScreen(),
                  ],
                ),
              ),
            ),
          if (showTokenSentScreen)
            WillPopScope(
              onWillPop: () async {
                setState(() {
                  showTokenSentScreen = false;
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
                          showTokenSentScreen = false;
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
                    const TokenSentScreen(),
                  ],
                ),
              ),
            ),
          if (widget.showChangeAccountScreen == true)
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).maybePop();
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
                  const ChangeAccountScreen(),
                ],
              ),
            ),
        ],
      ),
      bottomNavigationBar: (showReceivedScreen ||
              showSentScreen ||
              showTokenSentScreen ||
              widget.showChangeAccountScreen == true)
          ? null
          : BottomNavigationBar(
              backgroundColor: surfaceSwatch[24],
              currentIndex: currentIndex,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
              },
              unselectedItemColor: surfaceSwatch[12],
              unselectedFontSize: 14,
              selectedLabelStyle: textTheme.labelLarge!.copyWith(
                foreground: Paint()
                  ..shader = Gradients.customShader(
                      const Rect.fromLTWH(0.0, 0.0, 150.0, 200.0),
                      Gradients.gradient2),
              ),
              unselectedLabelStyle:
                  textTheme.labelLarge!.copyWith(color: surfaceSwatch[12]),
              items: [
                BottomNavigationBarItem(
                  icon: currentIndex == 0
                      ? ShaderMask(
                          shaderCallback: (bounds) => Gradients.customShader(
                            bounds,
                            Gradients.gradient2,
                          ),
                          child: const Icon(Icons.wallet_outlined),
                        )
                      : const Icon(Icons.wallet_outlined),
                  label: 'Wallet',
                ),
                BottomNavigationBarItem(
                  icon: currentIndex == 1
                      ? ShaderMask(
                          shaderCallback: (bounds) => Gradients.customShader(
                            bounds,
                            Gradients.gradient2,
                          ),
                          child:
                              const Icon(Icons.swap_horizontal_circle_outlined),
                        )
                      : const Icon(Icons.swap_horizontal_circle_outlined),
                  label: 'Swap',
                ),
                BottomNavigationBarItem(
                  icon: currentIndex == 2
                      ? ShaderMask(
                          shaderCallback: (bounds) => Gradients.customShader(
                            bounds,
                            Gradients.gradient2,
                          ),
                          child: const Icon(Icons.settings_outlined),
                        )
                      : const Icon(Icons.settings_outlined),
                  label: 'Settings',
                ),
              ],
            ),
    );
  }
}
