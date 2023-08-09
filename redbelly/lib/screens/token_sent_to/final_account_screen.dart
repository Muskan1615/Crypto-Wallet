import 'package:flutter/material.dart';
import '../../theme/color_coding.dart';
import '../../theme/gradient.dart';
import '../../theme/text_theme.dart';
import '../wallet_profile_screen/token_bnb_screen.dart';
import '../wallet_profile_screen/widgets/token.dart';

class FinalAccountScreen extends StatelessWidget {
  const FinalAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 900,
          color: surfaceSwatch[24],
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          "Sent To",
                          style: textTheme.bodyLarge!.copyWith(
                            fontWeight: FontWeight.w600,
                            wordSpacing: 2,
                          ),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(
                        Icons.close,
                      ),
                      onPressed: () {
                        Navigator.of(context).maybePop();
                      },
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                child: Text(
                  'From',
                  style:
                      textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              TokenListView(
                showTrailingIcon: true,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
                leading: 'images/profile_pic4.webp',
                title: 'Account 1',
                subtitle1: 'Balance: 19.2371 BNB',
                trailing1: '',
                trailing2: '',
                trailingIcon: Icons.arrow_forward_ios,
                trailingIconColor: primarySwatch,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const TokenBNBScreen(
                            showChangeAccountScreen: true);
                      },
                    ),
                  );
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                child: Text(
                  'To',
                  style:
                      textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  gradient: Gradients.gradient2,
                  // borderRadius: BorderRadius.circular(80),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) {
                          return const Scaffold();
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
            ],
          ),
        ),
      ),
    );
  }
}
