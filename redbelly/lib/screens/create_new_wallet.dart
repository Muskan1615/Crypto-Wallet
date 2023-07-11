import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import '../theme/color_coding.dart';
import '../widgets/input_field.dart';
import '../widgets/sign_in.dart';
import '../theme/gradient.dart';
import '../theme/input_decoration_theme.dart';
import '../theme/typography.dart';

// class CreateNewWalletScreen extends StatefulWidget {
//   const CreateNewWalletScreen({super.key});

//   @override
//   State<CreateNewWalletScreen> createState() => _CreateNewWalletScreenState();
// }

// class _CreateNewWalletScreenState extends State<CreateNewWalletScreen> {
//   final TextEditingController _newPasswordController = TextEditingController();
//   bool isChecked = false;

//   @override
//   void initState() {
//     super.initState();
//     _newPasswordController.addListener(_validateFields);
//   }

//   void _validateFields() {
//     final newPassword = _newPasswordController.text;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       resizeToAvoidBottomInset: false,
//       appBar: AppBar(
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back_ios),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//           padding: const EdgeInsets.only(left: 16.0),
//         ),
//         // title: LinearProgressIndicator(
//         //   color: primarySwatch[5],
//         // ),
//       ),
//       body: Column(
//         children: [
//           Container(
//             padding:
//                 const EdgeInsets.only(top: 40, bottom: 16, left: 24, right: 24),
//             child: ShaderMask(
//               shaderCallback: (bounds) => Gradients.customShader(
//                 bounds,
//                 Gradients.gradient6,
//               ),
//               child: Text(
//                 'Create Password',
//                 textAlign: TextAlign.center,
//                 style: textTheme.titleMedium!.copyWith(
//                   fontWeight: FontWeight.w600,
//                 ),
//               ),
//             ),
//           ),
//           Container(
//             padding: const EdgeInsets.only(left: 45, right: 45, bottom: 40),
//             child: Text(
//               'This password will unlock your Metamask wallet only on this service',
//               textAlign: TextAlign.center,
//               style: textTheme.bodyMedium!.copyWith(
//                 color: surfaceSwatch[9],
//                 height: 1.5,
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 24),
//             child: TextFormField(
//               obscureText: true,
//               obscuringCharacter: '*',
//               decoration: inputDecoration(
//                 labelText: 'New Password',
//                 hintText: '',
//                 helperText: 'Password Strength: Good',
//                 suffixIcon: const Icon(Icons.remove_red_eye_outlined),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(
//               top:24,
//               left: 24,
//               right: 24,
//               bottom: 40,
//             ),
//             child: TextFormField(
//               obscureText: true,
//               obscuringCharacter: '*',
//               decoration: inputDecoration(
//                 labelText: 'New Password',
//                 hintText: '',
//                 helperText: 'Must be at least 8 characters',
//                 suffixIcon: const Icon(Icons.remove_red_eye_outlined),
//               ),
//             ),
//           ),
//           const SignIn(),
//           Padding(
//             padding: const EdgeInsets.only(
//               right: 32,
//               left: 32,
//               top: 24,
//             ),
//             child: Row(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   padding: const EdgeInsets.only(top: 4),
//                   child: InkWell(
//                     onTap: () {
//                       setState(() {
//                         isChecked = !isChecked;
//                       });
//                     },
//                     child: Container(
//                       width: 24.0,
//                       height: 24.0,
//                       decoration: BoxDecoration(
//                         color:
//                             isChecked ? primarySwatch[5] : Colors.transparent,
//                         border: Border.all(color: primarySwatch[5]!),
//                         borderRadius: BorderRadius.circular(4.0),
//                       ),
//                       child: isChecked
//                           ? Checkbox(
//                               value: isChecked,
//                               onChanged: (bool? value) {
//                                 setState(() {
//                                   isChecked = value!;
//                                 });
//                               },
//                             )
//                           : const SizedBox(),
//                     ),
//                   ),
//                 ),
//                 const SizedBox(
//                   width: 8,
//                 ),
//                 Expanded(
//                   child: RichText(
//                     text: TextSpan(
//                       text:
//                           'I understand that DeGe cannot recover this password for me. ',
//                       style: Theme.of(context).textTheme.bodyMedium!.copyWith(
//                             fontSize: 18,
//                             height: 1.5,
//                           ),
//                       children: [
//                         TextSpan(
//                           text: 'Learn more',
//                           style:
//                               Theme.of(context).textTheme.bodyMedium!.copyWith(
//                                     fontSize: 18,
//                                     color: secondarySwatch[5],
//                                   ),
//                           recognizer: TapGestureRecognizer()..onTap = () {},
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           const Spacer(),
//           Container(
//             padding: const EdgeInsets.only(bottom: 42, left: 24, right: 24),
//             child: Container(
//               decoration: BoxDecoration(
//                 gradient: Gradients.gradient2,
//                 borderRadius: BorderRadius.circular(80),
//               ),
//               child: ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (BuildContext context) {
//                         return const CreateNewWalletScreen();
//                       },
//                     ),
//                   );
//                 },
//                 child: Container(
//                   alignment: Alignment.center,
//                   child: const Text('Create Password'),
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

class CreateNewWalletScreen extends StatefulWidget {
  const CreateNewWalletScreen({Key? key}) : super(key: key);

  @override
  _CreateNewWalletScreenState createState() => _CreateNewWalletScreenState();
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
            padding: const EdgeInsets.only(top: 40, bottom: 16),
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
          Container(
            padding: const EdgeInsets.only(left:48,right:48,bottom: 40),
            child: Text(
              'This password will unlock your Metamask wallet only on this service',
              textAlign: TextAlign.center,
              style: textTheme.bodyMedium!.copyWith(
                color: surfaceSwatch[9],
                height: 1.5,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child:InputField(
                  controller: _newPasswordController,
                  decoration: const InputDecoration(
                    labelText: 'New Password',
                    hintText: '',
                    suffixIcon: Icon(Icons.remove_red_eye_outlined),
                    helperText: 'Password Strength: Good',
                  ),
                  obscureText: true,
                  maxLines: 1,
                ),
          ),
          const SizedBox(height: 24),
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
          const SizedBox(height: 40),
          const SignIn(),
          Padding(
            padding: const EdgeInsets.only(
              right: 32,
              left: 32,
              top: 24,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(top: 4),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        isChecked = !isChecked;
                      });
                    },
                    child: Container(
                      width: 24.0,
                      height: 24.0,
                      decoration: BoxDecoration(
                        color: isChecked ? primarySwatch[5] : Colors.transparent,
                        border: Border.all(color: primarySwatch[5]!),
                        borderRadius: BorderRadius.circular(4.0),
                      ),
                      child: isChecked
                          ? Checkbox(
                              value: isChecked,
                              onChanged: (bool? value) {
                                setState(() {
                                  isChecked = value!;
                                });
                              },
                            )
                          : const SizedBox(),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: 'I understand that DeGe cannot recover this password for me. ',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                            fontSize: 18,
                            height: 1.5,
                          ),
                      children: [
                        TextSpan(
                          text: 'Learn more',
                          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                                fontSize: 18,
                                color: secondarySwatch[5],
                              ),
                          recognizer: TapGestureRecognizer()..onTap = () {},
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 330),
          Container(
            padding: const EdgeInsets.only(left:24,right: 24, bottom: 42),
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
