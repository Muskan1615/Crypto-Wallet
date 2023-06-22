import 'package:flutter/material.dart';
import 'package:redbelly/components/slider_sub_screen.dart';
import 'package:redbelly/utilities/custom_gradient_button.dart';
import '../utilities/custom_button.dart';
import '../utilities/custom_shader.dart';

class WalletSetupScreen extends StatelessWidget {
  const WalletSetupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 150,
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 278,
                height: 290,
                child: Image.asset(
                  'images/wallet-setup.png',
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              alignment: Alignment.center,
              child: Column(
                children: [
                  Text(
                    'Wallet Setup',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              bottom: 16,
              left: 24,
              right: 24,
            ),
            child: CustomButton(
              backgroundColor: const Color.fromRGBO(32, 40, 50, 1),
              height: 56,
              onPressed: () {},
              text: 'Import Using Seed Phase',
              width: 327,
            ),
          ),
          Container(
              padding: const EdgeInsets.only(
                bottom: 66,
                left: 24,
                right: 24,
              ),
              child: CustomGradientButton(
                  text: 'Create a New Wallet',
                  width: 327,
                  height: 56,
                  onPressed: () {})),
        ],
      ),
    );
  }
}
