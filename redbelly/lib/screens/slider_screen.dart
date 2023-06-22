import 'package:flutter/material.dart';
import '/screens/wallet_setup_screen.dart';
import '/utilities/custom_button.dart';
import '../components/slider_sub_screen.dart';
import '../utilities/custom_shader.dart';

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
                  shader: customShader,
                  image: 'images/slider-1.png',
                  width: 214,
                  height: 220,
                  title: 'Property',
                  subtitle: 'Diversity',
                ),
                SliderSubScreen(
                  shader: customShader,
                  image: 'images/slider-2.png',
                  width: 295,
                  height: 295,
                  title: 'Safe',
                  subtitle: 'Security',
                ),
                SliderSubScreen(
                  shader: customShader,
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
            padding:
                const EdgeInsets.only(bottom: 42, top: 8, left: 24, right: 24),
            child: CustomButton(
              text: 'Get Start',
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (BuildContext context) {
                    return const WalletSetupScreen();
                  }),
                );
              },
              backgroundColor: const Color.fromRGBO(32, 40, 50, 1),
              height: 48,
              width: 327,
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
        color: pageIndex == _currentPage ? Colors.blue : Colors.grey,
      ),
    );
  }
}
