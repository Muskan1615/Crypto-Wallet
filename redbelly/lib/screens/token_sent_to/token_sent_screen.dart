import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:redbelly/screens/token_sent_to/final_account_screen.dart';
import '/screens/wallet_profile_screen/token_bnb_screen.dart';
import '/widgets/input_field.dart';
import '../../theme/color_coding.dart';
import '../../theme/text_theme.dart';
import '../../widgets/qr_scanner.dart';
import '../wallet_profile_screen/widgets/token.dart';

class TokenSentScreen extends StatefulWidget {
  const TokenSentScreen({super.key});

  @override
  State<TokenSentScreen> createState() => _TokenSentScreenState();
}

class _TokenSentScreenState extends State<TokenSentScreen> {
  final TextEditingController _addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Align(
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: InputField(
                controller: _addressController,
                decoration: InputDecoration(
                  labelText: '',
                  hintText: 'Search, public address (0x), or ENS',
                  suffixIcon: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const QRScanner();
                          },
                        ),
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      width: 24,
                      height: 24,
                      child: Image.asset(
                        'images/scanner.png',
                        color: primarySwatch,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 50),
              child: RichText(
                text: TextSpan(
                  text: 'Transfer Between My Accounts',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 18,
                        color: secondarySwatch[5],
                        decoration: TextDecoration.underline,
                      ),
                  recognizer: TapGestureRecognizer()..onTap = () {},
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
              child: Text(
                'Recent',
                style: textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w600, color: surfaceSwatch[13]),
              ),
            ),
            TokenListView(
              showTrailingIcon: false,
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
              leading: 'images/profile_pic1.jpg',
              title: 'Beexay',
              subtitle1: '0x3Dc6...DxE9',
              trailing1: '',
              trailing2: '',
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const FinalAccountScreen();
                    },
                  ),
                );
              },
            ),
            const TokenListView(
              showTrailingIcon: false,
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
              leading: 'images/profile_pic2.jpg',
              title: 'Dasun Bussi',
              subtitle1: '0x3Dc6...DxT9',
              trailing1: '',
              trailing2: '',
            ),
            const TokenListView(
              showTrailingIcon: false,
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 12),
              leading: 'images/profile_pic3.jpg',
              title: 'Smart Gevan',
              subtitle1: '0x3R2E...DxR9',
              trailing1: '',
              trailing2: '',
            ),
          ],
        ),
      ),
    );
  }
}
