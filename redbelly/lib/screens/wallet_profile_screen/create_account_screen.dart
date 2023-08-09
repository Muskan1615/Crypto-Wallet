import 'package:flutter/material.dart';
import '/widgets/input_field.dart';
import '/screens/secure_wallet/create_new_wallet_screen.dart';
import '../../theme/color_coding.dart';
import '../../theme/gradient.dart';
import '../../theme/text_theme.dart';

class CreateAccountScreen extends StatelessWidget {
  const CreateAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 537,
        color: surfaceSwatch[24],
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 10, bottom: 52),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.arrow_back_ios,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  Expanded(
                    child: Center(
                      child: Text(
                        "Create New Account",
                        style: textTheme.bodyLarge!.copyWith(
                          fontWeight: FontWeight.w600,
                          wordSpacing: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 70,
              height: 70,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.all(Radius.circular(50)),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage('images/profile_pic2.jpg'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24.0),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(surfaceSwatch[21]),
                  fixedSize: const MaterialStatePropertyAll(
                    Size(160, 40),
                  ),
                  textStyle: MaterialStatePropertyAll(textTheme.titleSmall),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(
                      horizontal: 10.0,
                    ),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                onPressed: () {},
                child: Container(
                  alignment: Alignment.center,
                  child: const Text('Choose an icon'),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: InputField(
                decoration: InputDecoration(
                  labelText: 'Account Name',
                  hintText: '',
                ),
                maxLines: 1,
              ),
            ),
            Container(
              padding: const EdgeInsets.only(
                  bottom: 42, left: 24, right: 24, top: 65),
              child: Container(
                decoration: BoxDecoration(
                  gradient: Gradients.gradient2,
                  borderRadius: BorderRadius.circular(80),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const CreateNewWalletScreen();
                          },
                        ),
                      );
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    child: const Text('Create'),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
