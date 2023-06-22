import 'package:flutter/material.dart';
import 'package:redbelly/utilities/custom_shader.dart';

class SliderSubScreen extends StatelessWidget {
  final Shader? Function(Rect)? shader;
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const SizedBox(
          height: 150,
        ),
        Expanded(
          flex: 2,
          child: Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: width,
              height: height,
              child: Image.asset(
                image,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 16,
                ),
                ShaderMask(
                  shaderCallback: customShader,
                  child: Text(
                    subtitle,
                    style: Theme.of(context)
                        .textTheme
                        .titleMedium!
                        .copyWith(fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
