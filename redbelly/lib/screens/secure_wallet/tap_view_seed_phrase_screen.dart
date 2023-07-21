import 'dart:ui';
import 'package:flutter/material.dart';
import '/screens/secure_wallet/confirm_seed_phrase_screen.dart';
import '../../theme/color_coding.dart';
import '../../theme/gradient.dart';
import '../../theme/typography.dart';

class TapViewSeedPhraseScreen extends StatefulWidget {
  const TapViewSeedPhraseScreen({super.key});

  @override
  State<TapViewSeedPhraseScreen> createState() =>
      _TapViewSeedPhraseScreenState();
}

class _TapViewSeedPhraseScreenState extends State<TapViewSeedPhraseScreen> {
  List<String> phrases1 = [
    "1. future",
    "2. use",
    "3. abuse",
    "4. bubble",
    "5. disagree",
    "6. yard",
  ];
  List<String> phrases2 = [
    "7. exit",
    "8. enact",
    "9. drum",
    "10. frequent",
    "11. target",
    "12. organ",
  ];
  bool viewSeedPhrase = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          padding: const EdgeInsets.only(left: 16.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 24,
                bottom: 16,
                left: 32,
                right: 32,
              ),
              child: ShaderMask(
                shaderCallback: (bounds) => Gradients.customShader(
                  bounds,
                  Gradients.gradient6,
                ),
                child: Text(
                  'Write Down Your Seed Phrase',
                  style: textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                "This is your seed phrase. Write it down on a paper and keep it in a safe place. You'll be asked to re-enter this phrase (in order) on the next step.",
                style: textTheme.bodyMedium!.copyWith(
                  color: surfaceSwatch[9],
                  height: 1.5,
                  wordSpacing: 2,
                ),
              ),
            ),
            Stack(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
                  child: Container(
                    padding: const EdgeInsets.only(
                        top: 24, left: 24, right: 24, bottom: 8),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: primarySwatch.withOpacity(0.05999999865889549),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: phrases1.map((phrase) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16),
                              child: Container(
                                width: 175,
                                height: 40,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: surfaceSwatch[22],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    phrase,
                                    style: textTheme.bodyMedium!.copyWith(
                                      wordSpacing: 2,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                        Column(
                          children: phrases2.map((phrase) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 16.0),
                              child: Container(
                                width: 175,
                                height: 40,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 4,
                                ),
                                decoration: BoxDecoration(
                                  color: surfaceSwatch[22],
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Text(
                                    phrase,
                                    textAlign: TextAlign.center,
                                    style: textTheme.bodyMedium!.copyWith(
                                      wordSpacing: 2,
                                    ),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
                if (!viewSeedPhrase)
                  ClipRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 8.0, sigmaY: 8.0),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 32, vertical: 64),
                        child: Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 24, vertical: 105),
                          decoration: BoxDecoration(
                            color: const Color(0x99222531),
                            border: Border.all(
                              color: primarySwatch
                                  .withOpacity(0.05999999865889549),
                            ),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  bottom: 18,
                                ),
                                child: Text(
                                  'Tap to reveal your seed phrase',
                                  style: textTheme.bodyMedium!.copyWith(
                                    fontWeight: FontWeight.w600,
                                    wordSpacing: 2,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 43),
                                child: Text(
                                  'Make sure no one is watching your screen',
                                  style: textTheme.bodySmall!.copyWith(
                                    color: surfaceSwatch[9],
                                    height: 1.5,
                                    wordSpacing: 2,
                                  ),
                                ),
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  padding: const MaterialStatePropertyAll(
                                      EdgeInsets.all(16)),
                                  backgroundColor: MaterialStatePropertyAll(
                                      surfaceSwatch[21]),
                                  fixedSize: const MaterialStatePropertyAll(
                                      Size(110, 56)),
                                ),
                                onPressed: () {
                                  setState(() {
                                    viewSeedPhrase = true;
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Icon(
                                        Icons.remove_red_eye_outlined,
                                        color: primarySwatch[5],
                                      ),
                                      const Text(
                                        'View',
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: viewSeedPhrase
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
                          return const ConfirmSeedPhraseScreen();
                        },
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text('Next'),
                  ),
                ),
              ),
            )
          : Container(
              padding: const EdgeInsets.only(bottom: 42, left: 24, right: 24),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(surfaceSwatch[21]),
                ),
                onPressed: null,
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Next',
                    style: TextStyle(color: surfaceSwatch[18]),
                  ),
                ),
              ),
            ),
    );
  }
}
