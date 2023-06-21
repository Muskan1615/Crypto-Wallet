import 'package:flutter/material.dart';
import '../utilities/slider_sub_screen.dart';
import '../utilities/shader.dart';

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
      backgroundColor: const Color.fromRGBO(8, 10, 12, 1),
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
                  shader: shader,
                  image: 'images/slider-1.png',
                  title: 'Property',
                  subtitle: 'Diversity',
                ),
                SliderSubScreen(
                  shader: shader,
                  image: 'images/slider-2.png',
                  title: 'Safe',
                  subtitle: 'Security',
                ),
                SliderSubScreen(
                  shader: shader,
                  image: 'images/slider-3.png',
                  title: 'Convenient',
                  subtitle: 'Transaction',
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buildPageIndicator(0),
              buildPageIndicator(1),
              buildPageIndicator(2),
            ],
          ),
        ],
      ),
    );
  }

  Widget buildPageIndicator(int pageIndex) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      width: pageIndex == _currentPage ? 12 : 8,
      height: pageIndex == _currentPage ? 12 : 8,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: pageIndex == _currentPage ? Colors.blue : Colors.grey,
      ),
    );
  }
}
