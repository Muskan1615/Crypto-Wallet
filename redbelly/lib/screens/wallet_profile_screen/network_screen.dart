import 'package:flutter/material.dart';
import '/screens/wallet_profile_screen/wallet_home_screen.dart';
import '../../theme/color_coding.dart';
import '../../theme/text_theme.dart';

class NetworkScreen extends StatelessWidget {
  const NetworkScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 510,
        color: surfaceSwatch[24],
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 32, right: 32, top: 20, bottom: 32),
              child: Text(
                "Network",
                style: textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.w600,
                  wordSpacing: 2,
                ),
              ),
            ),
            NetworkTile(
              leading: Icons.circle,
              leadingColor: secondarySwatch[5],
              title: 'Ethereium Main',
              trailing: Icons.check_circle_outline,
              trailingColor: onPrimarySwatch[7],
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 40, top: 26, bottom: 24),
                child: Text(
                  'Other Network',
                  style: textTheme.titleMedium!.copyWith(
                      color: surfaceSwatch[12], fontWeight: FontWeight.w600),
                ),
              ),
            ),
            NetworkTile(
              leading: Icons.circle,
              leadingColor: errorSwatch[5],
              title: 'Ropsten Test',
            ),
            NetworkTile(
              leading: Icons.circle,
              leadingColor: onSecondarySwatch[5],
              title: 'Kovan Test',
            ),
            NetworkTile(
              leading: Icons.circle,
              leadingColor: onPrimarySwatch[5],
              title: 'Goerli Test',
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 32,
                left: 32,
                top: 50,
                bottom: 42,
              ),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return const WalletHomeScreen();
                      },
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    'Close',
                    style: TextStyle(color: secondarySwatch[5]),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NetworkTile extends StatelessWidget {
  final IconData? leading;
  final Color? leadingColor;
  final String? title;
  final IconData? trailing;
  final Color? trailingColor;

  const NetworkTile({
    this.leading,
    this.leadingColor,
    this.title,
    this.trailing,
    this.trailingColor,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.only(left: 40, right: 40),
      leading: Icon(
        leading,
        color: leadingColor,
        size: 16,
      ),
      title: Text(
        title!,
        style: textTheme.bodyMedium,
      ),
      trailing: Icon(
        trailing,
        color: trailingColor,
        size: 24,
      ),
    );
  }
}
