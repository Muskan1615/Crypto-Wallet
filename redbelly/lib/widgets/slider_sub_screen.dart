import 'package:flutter/material.dart';
import '../theme/gradient.dart';

class SliderSubScreen extends StatelessWidget {
  final Shader? Function(Rect, Gradient)? shader;
  final String image;
  final double width;
  final double height;
  final String title;
  final String subtitle;

  const SliderSubScreen({
    super.key,
    this.shader,
    required this.image,
    required this.width,
    required this.height,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            height: 150,
          ),
          Expanded(
            flex: 3,
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: width,
                height: height,
                child: Image.asset(
                  image,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(bottom:72),
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                if (title != 'Convenient')
                  Text(
                    title,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontSize: 40,
                        ),
                  ),
                if (title == 'Convenient')
                  ShaderMask(
                    shaderCallback: (bounds) => Gradients.customShader(
                      bounds,
                      Gradients.gradient2,
                    ),
                    child: Text(
                      title,
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                fontSize: 40,
                                fontWeight: FontWeight.w700,
                              ),
                    ),
                  ),
                const SizedBox(
                  height: 16,
                ),
                if (title != 'Convenient')
                  ShaderMask(
                    shaderCallback: (bounds) => Gradients.customShader(
                      bounds,
                      Gradients.gradient2,
                    ),
                    child: Text(
                      subtitle,
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                fontSize: 40,
                                fontWeight: FontWeight.w700,
                              ),
                    ),
                  ),
                if (title == 'Convenient')
                  Text(
                    subtitle,
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          fontSize: 40,
                        ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
