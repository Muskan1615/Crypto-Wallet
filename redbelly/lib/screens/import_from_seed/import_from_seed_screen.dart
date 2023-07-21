import 'package:flutter/material.dart';
import '../../widgets/input_field.dart';
import '../../theme/color_coding.dart';
import '../../theme/gradient.dart';
import '../secure_wallet/success_wallet_screen.dart';
import 'widgets/sign_in.dart';
import 'widgets/terms_conditions.dart';

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
  bool viewSeedPhrase = false;
  bool viewNewPassword = false;
  bool viewConfirmPassword = false;
  String? _newPassword;


  bool validateStructure(String value) {
    String pattern = r'^[A-Za-z0-9!@#\$&*~]{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  validate() {
    if (_newPasswordController.text.isEmpty) {
      setState(() {
        _newPassword = 'Must be at least 8 characters';
      });
      return;
    }

    if (_newPasswordController.text.length < 8) {
      setState(() {
        _newPassword = 'Password should be at least 8 characters';
      });
      return;
    }

    if (!validateStructure(_newPasswordController.text)) {
      setState(() {
        _newPassword = 'Password Strength: Weak';
      });
    } else {
      if (_newPasswordController.text.contains(RegExp(r'[A-Z]')) &&
          _newPasswordController.text.contains(RegExp(r'[a-z]')) &&
          _newPasswordController.text.contains(RegExp(r'[0-9]')) &&
          _newPasswordController.text.contains(RegExp(r'[!@#\$&*~]'))) {
        setState(() {
          _newPassword = 'Password Strength: Strong';
        });
      } else {
        setState(() {
          _newPassword = 'Password Strength: Good';
        });
      }
    }
  }

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
      _isButtonDisabled = seedPhrase.isEmpty ||
          newPassword.isEmpty ||
          newPassword.length < 8 ||
          confirmPassword.isEmpty ||
          newPassword != confirmPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Import From Seed'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
          padding: const EdgeInsets.only(left: 16.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Stack(
                alignment: Alignment.topRight,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(right: 72, top: 40, bottom: 24),
                    child: InputField(
                      controller: _seedPhraseController,
                      decoration: InputDecoration(
                        labelText: 'Seed Phrase',
                        hintText: '',
                        suffixIcon: IconButton(
                          icon: Icon(viewSeedPhrase
                              ? Icons.visibility_off_outlined
                              : Icons.remove_red_eye_outlined),
                          onPressed: () {
                            setState(() {
                              viewSeedPhrase = !viewSeedPhrase;
                            });
                          },
                        ),
                      ),
                      maxLines: null,
                    ),
                  ),
                  Positioned(
                    top: 40,
                    child: Stack(
                      children: [
                        IconButton(
                          padding: const EdgeInsets.all(16),
                          color: primarySwatch[5],
                          icon: const Icon(Icons.crop_free),
                          onPressed: () {},
                        ),
                        IconButton(
                          padding: const EdgeInsets.all(16),
                          color: primarySwatch[5],
                          icon: const Icon(Icons.remove),
                          onPressed: () {},
                        ),
                       
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: InputField(
                controller: _newPasswordController,
                validator: validate(),
                decoration: InputDecoration(
                  labelText: 'New Password',
                  hintText: '',
                  suffixIcon: IconButton(
                    icon: Icon(viewNewPassword
                        ? Icons.remove_red_eye_outlined
                        : Icons.visibility_off_outlined),
                    onPressed: () {
                      setState(() {
                        viewNewPassword = !viewNewPassword;
                      });
                    },
                  ),
                  helperText: _newPassword,
                ),
                obscureText: !viewNewPassword,
                maxLines: 1,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
              child: InputField(
                controller: _confirmPasswordController,
                decoration: InputDecoration(
                  labelText: 'Confirm Password',
                  hintText: '',
                  suffixIcon: IconButton(
                    icon: Icon(viewConfirmPassword
                        ? Icons.remove_red_eye_outlined
                        : Icons.visibility_off_outlined),
                    onPressed: () {
                      setState(() {
                        viewConfirmPassword = !viewConfirmPassword;
                      });
                    },
                  ),
                  errorText: (_newPasswordController.text.isNotEmpty &&
                          _confirmPasswordController.text.isNotEmpty &&
                          _newPasswordController.text !=
                              _confirmPasswordController.text)
                      ? 'Your passwords must match. Please try again.'
                      : null,
                ),
                obscureText: !viewConfirmPassword,
                maxLines: 1,
              ),
            ),
            const SignIn(),
            const TermsConditions(),
            const SizedBox(height: 330),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: _isButtonDisabled
          ? Container(
              padding: const EdgeInsets.only(bottom: 42, left: 24, right: 24),
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(surfaceSwatch[21]),
                ),
                onPressed: null,
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
                          return const SuccessWalletScreen();
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
    );
  }
}
