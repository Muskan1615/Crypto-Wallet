import 'package:flutter/material.dart';

class SliderSubScreen extends StatelessWidget {
  final Shader Function(Rect) shader;
  final String image;
  final String title;
  final String subtitle;

  const SliderSubScreen({
    super.key,
    required this.shader,
    required this.image,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          image,
          alignment: AlignmentDirectional.topCenter,
        ),
        Text(
          title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        const SizedBox(
          height: 16,
        ),
        ShaderMask(
          shaderCallback: (bounds) => shader(bounds),
          child: Text(
            subtitle,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}
