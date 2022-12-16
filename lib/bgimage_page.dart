import 'package:flutter/material.dart';

class BgImagePage extends StatelessWidget {
  const BgImagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: dead_code
    return Image.asset('images/bg.jpg',
        fit: BoxFit.cover,
        color: Colors.white.withOpacity(0.7),
        colorBlendMode: BlendMode.darken);
  }
}
