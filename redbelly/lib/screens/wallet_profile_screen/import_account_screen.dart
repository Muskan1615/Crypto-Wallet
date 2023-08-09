import 'package:flutter/material.dart';
import '/widgets/qr_scanner.dart';
import '/widgets/input_field.dart';
import '../../theme/color_coding.dart';
import '../../theme/gradient.dart';
import '../../theme/text_theme.dart';

class ImportAccountScreen extends StatefulWidget {
  const ImportAccountScreen({super.key});

  @override
  State<ImportAccountScreen> createState() => _ImportAccountScreenState();
}

class _ImportAccountScreenState extends State<ImportAccountScreen> {
  final TextEditingController _privateKeyController = TextEditingController();

  bool _isButtonDisabled = true;
  @override
  void initState() {
    super.initState();
    _privateKeyController.addListener(_validateFields);
  }

  void _validateFields() {
    final privateKey = _privateKeyController.text;

    setState(() {
      _isButtonDisabled = privateKey.isEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 490,
        color: surfaceSwatch[24],
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 24, right: 24, top: 10, bottom: 30),
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
                        "Import Account",
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
              child: Text(
                "Imported accounts are viewable in your wallet but are not recoverable with your DeGe seed phrase.",
                style: textTheme.bodyMedium!.copyWith(
                  wordSpacing: 2,
                  height: 1.5,
                  color: surfaceSwatch[4],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                "Learn more about imported accounts here.",
                style: textTheme.bodyMedium!.copyWith(
                  wordSpacing: 2,
                  height: 1.5,
                  color: surfaceSwatch[4],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 32,
              ),
              child: Text(
                "Paste your private key string",
                style: textTheme.titleMedium!.copyWith(
                  wordSpacing: 2,
                  height: 3,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
              child: InputField(
                controller: _privateKeyController,
                decoration: const InputDecoration(hintText: ''),
                maxLines: null,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                right: 32,
                left: 32,
                top: 50,
                bottom: 42,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: const ButtonStyle(
                      fixedSize: MaterialStatePropertyAll(
                        Size(183, 48),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return const QRScanner();
                          },
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Scan a QR code',
                        style: TextStyle(color: secondarySwatch[5]),
                      ),
                    ),
                  ),
                  _isButtonDisabled
                      ? ElevatedButton(
                          style: ButtonStyle(
                            fixedSize: const MaterialStatePropertyAll(
                              Size(183, 48),
                            ),
                            backgroundColor:
                                MaterialStatePropertyAll(surfaceSwatch[21]),
                          ),
                          onPressed: null,
                          child: Container(
                            alignment: Alignment.center,
                            child: Text(
                              'Import',
                              style: TextStyle(color: surfaceSwatch[18]),
                            ),
                          ),
                        )
                      : Container(
                          decoration: BoxDecoration(
                            gradient: Gradients.gradient2,
                            borderRadius: BorderRadius.circular(80),
                          ),
                          child: ElevatedButton(
                            style: const ButtonStyle(
                              fixedSize: MaterialStatePropertyAll(
                                Size(183, 48),
                              ),
                            ),
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
                              child: const Text('Import'),
                            ),
                          ),
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
