import 'package:flutter/material.dart';
import 'package:redbelly/screens/create_new_wallet_screen.dart';
import '/screens/secure_wallet/manual_secure_wallet_screen.dart';
import '../../theme/color_coding.dart';
import '../../theme/gradient.dart';
import '../../theme/typography.dart';

class SuccessWalletScreen extends StatefulWidget {
  const SuccessWalletScreen({super.key});

  @override
  State<SuccessWalletScreen> createState() => _SuccessWalletScreenState();
}

class _SuccessWalletScreenState extends State<SuccessWalletScreen> {
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
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: SizedBox(
                    width: 300,
                    height: 300,
                    child: Image.asset(
                      'images/success.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 32,vertical: 32
                  ),
                  child: ShaderMask(
                    shaderCallback: (bounds) => Gradients.customShader(
                      bounds,
                      Gradients.gradient6,
                    ),
                    child: Text(
                      'Success!',
                      style: textTheme.displayMedium!.copyWith(
                        fontSize: 40,
                        wordSpacing: 2,
                        height: 1.5,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 45, vertical: 24),
                  child: Text(
                    "You've successfully protected your wallet. Remember to keep your seed phrase safe, it's your responsibility!",
                   textAlign: TextAlign.center,
                    style: textTheme.bodyMedium!.copyWith(
                      height: 1.5,
                      wordSpacing: 2,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 8,),
                  child: Text(
                    "DefiSquid cannot recover your wallet should you lose it. You can find your seed phrase in Setings > Security & Privacy",
                   textAlign: TextAlign.center, style: textTheme.bodyMedium!.copyWith(
                      height: 1.5,
                      wordSpacing: 2,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Container(
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
                    return const CreateNewWalletScreen();
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
      ),
    );
  }
}
