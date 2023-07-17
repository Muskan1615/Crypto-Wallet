import 'package:flutter/material.dart';
import '/screens/secure_wallet/manual_secure_wallet_screen.dart';
import '../../theme/color_coding.dart';
import '../../theme/gradient.dart';
import '../../theme/typography.dart';

class RemindMeLaterScreen extends StatefulWidget {
  const RemindMeLaterScreen({super.key});

  @override
  State<RemindMeLaterScreen> createState() => _RemindMeLaterScreenState();
}

class _RemindMeLaterScreenState extends State<RemindMeLaterScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 280,
        color: surfaceSwatch[24],
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
              child: Text(
                'Skip Account Security?',
                style: textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  wordSpacing: 2,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 32,
                left: 32,
                top: 24,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.only(top: 4),
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          isChecked = !isChecked;
                        });
                      },
                      child: Container(
                        width: 24.0,
                        height: 24.0,
                        decoration: BoxDecoration(
                          color:
                              isChecked ? primarySwatch[5] : Colors.transparent,
                          border: Border.all(color: primarySwatch[5]!),
                          borderRadius: BorderRadius.circular(4.0),
                        ),
                        child: isChecked
                            ? Checkbox(
                                value: isChecked,
                                onChanged: (bool? value) {
                                  setState(() {
                                    isChecked = value!;
                                  });
                                },
                              )
                            : const SizedBox(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: RichText(
                      text: TextSpan(
                        text:
                            'I understand that if I lose my seed phrase, I will not be able to access my wallet.',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontSize: 18,
                              height: 1.5,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 60,
                left: 60,
                top: 50,
                bottom: 42,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: const ButtonStyle(
                      fixedSize: MaterialStatePropertyAll(
                        Size(156, 48),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return ManualSecureWalletScreen(showProtectYourWalletPage: true);
                          },
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Secure',
                        style: TextStyle(color: secondarySwatch[5]),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      gradient: Gradients.gradient2,
                      borderRadius: BorderRadius.circular(80),
                    ),
                    child: ElevatedButton(
                      style: const ButtonStyle(
                        fixedSize: MaterialStatePropertyAll(
                          Size(156, 48),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) {
                              return ManualSecureWalletScreen(showProtectYourWalletPage: false,);
                            },
                          ),
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        child: const Text('Skip'),
                      ),
                    ),
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
