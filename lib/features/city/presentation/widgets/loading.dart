import 'package:flutter/material.dart';
import 'package:flutter_blurhash/flutter_blurhash.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:trippo/core/config/global_functions.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen(
      {Key? key,
      this.fit = BoxFit.cover,
      this.shape = BoxShape.rectangle,
      this.hash = "AEO2?U-W}SQ[",
      this.borderRadius})
      : super(key: key);
  final BoxFit fit;
  final String hash;
  final BoxShape shape;
  final BorderRadiusGeometry? borderRadius;
  @override
  Widget build(BuildContext context) {
    final widthScreen = MediaQuery.of(context).size.width;
    return  Center(
        child: LoadingAnimationWidget.threeArchedCircle(
          color: Theme.of(context).primaryColor,
          size: widthScreen / 6,
        ),
      );
    
  }
}
