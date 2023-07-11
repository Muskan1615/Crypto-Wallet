import 'package:flutter/material.dart';
import '../widgets/input_field.dart';
import '../screens/create_new_wallet.dart';
import '../theme/color_coding.dart';
import '../theme/gradient.dart';
import '../widgets/sign_in.dart';
import '../widgets/terms_conditions.dart';

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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
          padding: const EdgeInsets.only(left: 16.0),
        ),
      ),
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    right: 72,
                    top: 40,
                    bottom: 24,
                  ),
                  child: InputField(
                    controller: _seedPhraseController,
                    decoration: const InputDecoration(
                      labelText: 'Seed Phrase',
                      hintText: '',
                      suffixIcon: Icon(Icons.remove_red_eye_outlined),
                    ),
                    maxLines: null,
                  ),
                ),
                Positioned(
                  top: 40,
                  child: IconButton(
                    padding: const EdgeInsets.all(16),
                    color: primarySwatch[5],
                    icon: const Icon(Icons.qr_code_scanner_outlined),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: InputField(
              controller: _newPasswordController,
              decoration: const InputDecoration(
                labelText: 'New Password',
                hintText: '',
                suffixIcon: Icon(Icons.remove_red_eye_outlined),
                helperText: 'Must be at least 8 characters',
              ),
              obscureText: true,
              maxLines: 1,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            child: InputField(
              controller: _confirmPasswordController,
              decoration: const InputDecoration(
                labelText: 'Confirm Password',
                hintText: '',
                suffixIcon: Icon(Icons.remove_red_eye_outlined),
              ),
              obscureText: true,
              maxLines: 1,
            ),
          ),
          const SignIn(),
          const TermsConditions(),
          const SizedBox(height: 390),
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

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Import From Seed'),
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           padding: const EdgeInsets.only(left: 16.0),
//         ),
//       ),
//       body: Column(
//         children: [
//           SingleChildScrollView(
//             child: Column(
//               children: [
//                 Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 24),
//                   child: Stack(
//                     alignment: Alignment.topRight,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(
//                             right: 72, top: 40, bottom: 24),
//                         child: Expanded(
//                           child: InputField(
//                             controller: _seedPhraseController,
//                             decoration: const InputDecoration(
//                               labelText: 'Seed Phrase',
//                               hintText: '',
//                               suffixIcon: Icon(Icons.remove_red_eye_outlined),
//                             ),
//                             maxLines: null,
//                           ),
//                         ),
//                       ),
//                       Positioned(
//                         top: 40,
//                         child: IconButton(
//                           padding: const EdgeInsets.all(16),
//                           color: primarySwatch[5],
//                           icon: const Icon(Icons.qr_code_scanner_outlined),
//                           onPressed: () {},
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 24),
//                   child: InputField(
//                     controller: _newPasswordController,
//                     decoration: const InputDecoration(
//                       labelText: 'New Password',
//                       hintText: '',
//                       suffixIcon: Icon(Icons.remove_red_eye_outlined),
//                       helperText: 'Must be at least 8 characters',
//                     ),
//                     obscureText: true,
//                     maxLines: 1,
//                   ),
//                 ),
//                 Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
//                   child: InputField(
//                     controller: _confirmPasswordController,
//                     decoration: const InputDecoration(
//                       labelText: 'Confirm Password',
//                       hintText: '',
//                       suffixIcon: Icon(Icons.remove_red_eye_outlined),
//                     ),
//                     obscureText: true,
//                     maxLines: 1,
//                   ),
//                 ),
//                 const SignIn(),
//                 const TermsConditions(),
//               ],
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.only(bottom: 42, left: 24, right: 24),
//             child: _isButtonDisabled
//                 ? ElevatedButton(
//                     style: ButtonStyle(
//                       backgroundColor:
//                           MaterialStatePropertyAll(surfaceSwatch[21]),
//                     ),
//                     onPressed: () {},
//                     child: Container(
//                       alignment: Alignment.center,
//                       child: Text(
//                         'Import',
//                         style: TextStyle(color: surfaceSwatch[18]),
//                       ),
//                     ),
//                   )
//                 : Container(
//                     decoration: BoxDecoration(
//                       gradient: Gradients.gradient2,
//                       borderRadius: BorderRadius.circular(80),
//                     ),
//                     child: ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                             builder: (BuildContext context) {
//                               return const CreateNewWalletScreen();
//                             },
//                           ),
//                         );
//                       },
//                       child: Container(
//                         alignment: Alignment.center,
//                         child: const Text('Import'),
//                       ),
//                     ),
//                   ),
//           ),
//         ],
//       ),
//     );
//   }
// }
