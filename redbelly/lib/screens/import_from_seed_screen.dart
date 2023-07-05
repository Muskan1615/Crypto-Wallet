import 'package:flutter/material.dart';
import '../screens/create_new_wallet.dart';
import '../theme/color_coding.dart';
import '../theme/gradient.dart';
import '../widgets/sign_in.dart';
import '../widgets/terms_conditions.dart';
import '../utilities/custom_input_field.dart';
import '../utilities/custom_password_field.dart';

class ImportFromSeedScreen extends StatefulWidget {
  const ImportFromSeedScreen({super.key});

  @override
  State<ImportFromSeedScreen> createState() => _ImportFromSeedScreenState();
}

class _ImportFromSeedScreenState extends State<ImportFromSeedScreen> {
  final TextEditingController _seedPhraseController = TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  bool _isButtonDisabled = true;

  @override
  void initState() {
    super.initState();
    _seedPhraseController.addListener(_validateFields);
    _newPasswordController.addListener(_validateFields);
    _confirmPasswordController.addListener(_validateFields);
  }

  void _validateFields() {
    final seedPhrase = _seedPhraseController.text;
    final newPassword = _newPasswordController.text;
    final confirmPassword = _confirmPasswordController.text;

    setState(() {
      _isButtonDisabled =
          seedPhrase.isEmpty || newPassword.isEmpty || confirmPassword.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Import From Seed'),
        leading: const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                CustomInputField(
                  controller: _seedPhraseController,
                  padding:
                      const EdgeInsets.only(right: 72, top: 40, bottom: 24),
                  width: 255,
                  height: 64,
                  prefixText: 'Seed Phrase',
                  hintText: '',
                  suffixIcon: const Icon(Icons.remove_red_eye_outlined),
                  suffixIconColor: Colors.white,
                ),
                Positioned(
                  top: 40,
                  child: IconButton(
                    padding: const EdgeInsets.all(16),
                    iconSize: 24,
                    color: primarySwatch[5],
                    icon: const Icon(Icons.qr_code_scanner_outlined),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          CustomPasswordField(
            controller: _newPasswordController,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            width: 327,
            height: 64,
            prefixText: 'New Password',
            hintText: '',
            helperText: 'Must be at least 8 characters',
            suffixIcon: const Icon(Icons.remove_red_eye_outlined),
            suffixIconColor: Colors.white,
          ),
          CustomPasswordField(
            controller: _confirmPasswordController,
            padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
            width: 327,
            height: 64,
            prefixText: 'Confirm Password',
            hintText: '',
            suffixIcon: const Icon(Icons.remove_red_eye_outlined),
            suffixIconColor: Colors.white,
          ),
          const SignIn(),
          const TermsConditions(),
          const Spacer(),
          _isButtonDisabled
              ? Container(
                  padding:
                      const EdgeInsets.only(bottom: 42, left: 24, right: 24),
                  child: ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStatePropertyAll(surfaceSwatch[21]),
                    ),
                    onPressed: () {},
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Import',
                        style: TextStyle(color: surfaceSwatch[18]),
                      ),
                    ),
                  ),
                )
              : Container(
                  padding:
                      const EdgeInsets.only(bottom: 42, left: 24, right: 24),
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
                        child: const Text('Import'),
                      ),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
