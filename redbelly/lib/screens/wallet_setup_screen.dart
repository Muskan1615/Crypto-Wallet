import 'package:flutter/material.dart';
import '../screens/import_from_seed_screen.dart';
import '../theme/color_coding.dart';
import '../theme/gradient.dart';

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
            flex: 5,
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
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontSize: 40,
                        ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              bottom: 66,
              left: 24,
              right: 24,
            ),
            child: Column(
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: const MaterialStatePropertyAll(
                      Size(500, 56),
                    ),
                    backgroundColor:
                        MaterialStatePropertyAll(surfaceSwatch[21]),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const ImportFromSeedScreen();
                        },
                      ),
                    );
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text('Import Using Seed Phrase'),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Container(
                  width: 500,
                  height: 56,
                  decoration: BoxDecoration(
                    gradient: Gradients.gradient2,
                    borderRadius: BorderRadius.circular(80),
                  ),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      fixedSize: MaterialStatePropertyAll(
                        Size(500, 56),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const WalletSetupScreen();
                          },
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: const Text('Create a New Wallet'),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
