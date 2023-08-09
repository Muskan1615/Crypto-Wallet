import 'package:flutter/material.dart';
import '/screens/secure_wallet/success_wallet_screen.dart';
import '../../theme/color_coding.dart';
import '../../theme/gradient.dart';
import '../../theme/text_theme.dart';

class ConfirmSeedPhraseScreen extends StatefulWidget {
  const ConfirmSeedPhraseScreen({super.key});

  @override
  State<ConfirmSeedPhraseScreen> createState() =>
      _ConfirmSeedPhraseScreenState();
}

class _ConfirmSeedPhraseScreenState extends State<ConfirmSeedPhraseScreen> {
  List<String> phrases1 = [
    "organ",
    "use",
    "abuse",
    "bubble",
    "disagree",
    "exit",
  ];
  bool confirmSeedPhrase = false;
  String selectedPhrase = '';
  int currentStep = 1;

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
                  'Confirm Seed Phrase',
                  style: textTheme.titleMedium!.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 18,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 64),
              child: Text(
                "Select each word in the order it was presented to you",
                textAlign: TextAlign.center,
                style: textTheme.bodyMedium!.copyWith(
                  height: 1.5,
                  wordSpacing: 2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 100,
                bottom: 120,
              ),
              child: confirmSeedPhrase
                  ? ShaderMask(
                      shaderCallback: (bounds) => Gradients.customShader(
                        bounds,
                        Gradients.gradient6,
                      ),
                      child: Text(
                        currentStep == 1
                            ? "3. $selectedPhrase"
                            : currentStep == 2
                                ? "7. $selectedPhrase"
                                : "12. $selectedPhrase",
                        style: textTheme.displayMedium!.copyWith(
                          fontSize: 40,
                          height: 1.5,
                          wordSpacing: 2,
                        ),
                      ),
                    )
                  : Text(
                      currentStep == 1
                          ? "3."
                          : currentStep == 2
                              ? "7."
                              : "12.",
                      textAlign: TextAlign.center,
                      style: textTheme.displayMedium!.copyWith(
                        color: surfaceSwatch[12],
                        fontSize: 40,
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
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 70,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(2),
                      child: LinearProgressIndicator(
                        value: currentStep >= 1 ? 1.0 : 0.0,
                        color: surfaceSwatch[23],
                        valueColor: AlwaysStoppedAnimation<Color>(
                            currentStep >= 1
                                ? primarySwatch[5]!
                                : Colors.transparent),
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
                        value: currentStep >= 2 ? 1.0 : 0.0,
                        color: surfaceSwatch[23],
                        valueColor: AlwaysStoppedAnimation<Color>(
                            currentStep >= 2
                                ? primarySwatch[5]!
                                : Colors.transparent),
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
                        value: currentStep >= 3 ? 1.0 : 0.0,
                        color: surfaceSwatch[23],
                        valueColor: AlwaysStoppedAnimation<Color>(
                            currentStep >= 3
                                ? primarySwatch[5]!
                                : Colors.transparent),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 64),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: primarySwatch.withOpacity(0.05999999865889549),
                  ),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  spacing: 17,
                  runSpacing: 16,
                  children: phrases1.map((phrase) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedPhrase = phrase;
                          confirmSeedPhrase = true;
                        });
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 16),
                        decoration: BoxDecoration(
                          color: surfaceSwatch[22],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          phrase,
                          style: textTheme.bodySmall!.copyWith(
                            wordSpacing: 2,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: confirmSeedPhrase
          ? Container(
              padding: const EdgeInsets.only(bottom: 42, left: 24, right: 24),
              child: Container(
                decoration: BoxDecoration(
                  gradient: Gradients.gradient2,
                  borderRadius: BorderRadius.circular(80),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    if (currentStep == 1 && selectedPhrase == phrases1[2]) {
                      setState(() {
                        confirmSeedPhrase = false;
                        currentStep++;
                      });
                    } else if (currentStep == 2 &&
                        selectedPhrase == phrases1[5]) {
                      setState(() {
                        confirmSeedPhrase = false;
                        currentStep++;
                      });
                    } else if (currentStep == 3 &&
                        selectedPhrase == phrases1[0]) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const SuccessWalletScreen();
                          },
                        ),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text('Incorrect seed phrase selected.'),
                          backgroundColor: surfaceSwatch[22],
                          duration: const Duration(
                            seconds: 2,
                          ),
                        ),
                      );
                    }
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
