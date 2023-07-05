import 'package:flutter/material.dart';
import '../theme/color_coding.dart';
import '../theme/gradient.dart';
import '/screens/wallet_setup_screen.dart';
import '../widgets/slider_sub_screen.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({super.key});

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  final PageController _pageController = PageController(initialPage: 0);
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _pageController,
              onPageChanged: (int page) {
                setState(() {
                  _currentPage = page;
                });
              },
              children: const [
                SliderSubScreen(
                  shader: Gradients.customShader,
                  image: 'images/slider-1.png',
                  width: 214,
                  height: 220,
                  title: 'Property',
                  subtitle: 'Diversity',
                ),
                SliderSubScreen(
                  shader: Gradients.customShader,
                  image: 'images/slider-2.png',
                  width: 295,
                  height: 295,
                  title: 'Safe',
                  subtitle: 'Security',
                ),
                SliderSubScreen(
                  shader: Gradients.customShader,
                  image: 'images/slider-3.png',
                  width: 185,
                  height: 220,
                  title: 'Convenient',
                  subtitle: 'Transaction',
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                buildPageIndicator(0),
                buildPageIndicator(1),
                buildPageIndicator(2),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.only(
              bottom: 42,
              top: 8,
              left: 24,
              right: 24,
            ),
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(surfaceSwatch[21]),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return const WalletSetupScreen();
                    },
                  ),
                );
              },
              child: Container(
                alignment: Alignment.center,
                child: const Text('Get Start'),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPageIndicator(int pageIndex) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: pageIndex == _currentPage ? 8 : 8,
      height: pageIndex == _currentPage ? 8 : 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: pageIndex == _currentPage ? primarySwatch[5] : surfaceSwatch[18],
      ),
    );
  }
}
