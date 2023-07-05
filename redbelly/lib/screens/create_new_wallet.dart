import 'package:flutter/material.dart';
import 'package:redbelly/theme/color_coding.dart';
import 'package:redbelly/utilities/custom_password_field.dart';
import 'package:redbelly/widgets/sign_in.dart';

import '../theme/gradient.dart';
import '../theme/typography.dart';

class CreateNewWalletScreen extends StatefulWidget {
  const CreateNewWalletScreen({super.key});

  @override
  State<CreateNewWalletScreen> createState() => _CreateNewWalletScreenState();
}

class _CreateNewWalletScreenState extends State<CreateNewWalletScreen> {
  final TextEditingController _newPasswordController = TextEditingController();
  bool isChecked = false;

  @override
  void initState() {
    super.initState();
    _newPasswordController.addListener(_validateFields);
  }

  void _validateFields() {
    final newPassword = _newPasswordController.text;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Padding(
          padding: EdgeInsets.only(left: 16),
          child: Icon(Icons.arrow_back_ios),
        ),
        // title: LinearProgressIndicator(
        //   color: primarySwatch[5],
        // ),
      ),
      body: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(top: 40, bottom: 16, left: 24, right: 24),
            child: ShaderMask(
              shaderCallback: (bounds) => Gradients.customShader(
                bounds,
                Gradients.gradient6,
              ),
              child: Text(
                'Create Password',
                textAlign: TextAlign.center,
                style: textTheme.titleMedium!.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32, right: 32, bottom: 40),
            child: Text(
              'This password will unlock your Metamask wallet only on this service',
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium!.copyWith(
                color: surfaceSwatch[9],
              ),
            ),
          ),
          CustomPasswordField(
            controller: _newPasswordController,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            width: 327,
            height: 64,
            prefixText: 'New Password',
            hintText: '',
            helperText: 'Password Strength: Good',
            suffixIcon: const Icon(Icons.remove_red_eye_outlined),
            suffixIconColor: Colors.white,
          ),
          CustomPasswordField(
            controller: _newPasswordController,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
            width: 327,
            height: 64,
            prefixText: 'New Password',
            hintText: '',
            helperText: 'Must be at least 8 characters',
            suffixIcon: const Icon(Icons.remove_red_eye_outlined),
            suffixIconColor: Colors.white,
          ),
          const SignIn(),
          Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    isChecked = !isChecked;
                  });
                },
                child: Container(
                  width: 24.0,
                  height: 24.0,
                  // padding: const EdgeInsets.all(
                  //     1.0), // Adjust the padding values as needed
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: primarySwatch[5]!), // Checkbox border color
                    borderRadius: BorderRadius.circular(
                        4.0), // Adjust the radius as needed
                  ),
                  child: isChecked
                      ? 
                      Checkbox(
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value!;
                      });
                    },
                  )
                      // Container(
                      //     decoration: BoxDecoration(
                      //       color: Colors
                      //           .white, // Color of the checkmark when checkbox is checked
                      //       borderRadius: BorderRadius.circular(
                      //           2.0), // Adjust the radius as needed
                      //     ),
                      //   )
                      : SizedBox(),
                ),
              ),
              // Transform.scale(
              //   scale: 1.5,
              //   child: ButtonTheme(
              //     padding: const EdgeInsets.all(24),
              //     child: Checkbox(
              //       value: isChecked,
              //       onChanged: (bool? value) {
              //         setState(() {
              //           isChecked = value!;
              //         });
              //       },
              //     ),
              //   ),
              // ),
            ],
          ),
          const Spacer(),
          Container(
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
                  child: const Text('Create Password'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
