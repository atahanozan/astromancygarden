import 'dart:ui';

import 'package:flutter/material.dart';

class FrostedGlassView extends StatelessWidget {
  const FrostedGlassView({
    Key? key,
    required this.thewidth,
    required this.theheight,
    required this.thechild,
  }) : super(key: key);

  final double thewidth;
  final double theheight;
  final Widget thechild;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(30),
      child: Container(
        width: thewidth,
        height: theheight,
        color: Colors.transparent,
        child: Stack(
          children: [
            BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 6.0, sigmaY: 6.0),
              child: Container(),
            ),
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: Colors.white.withOpacity(0.13)),
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        Colors.white.withOpacity(0.15),
                        Colors.white.withOpacity(0.05),
                      ])),
            ),
            Center(
              child: thechild,
            )
          ],
        ),
      ),
    );
  }
}
