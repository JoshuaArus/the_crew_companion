import 'package:flutter/material.dart';
import 'package:the_crew_companion/constant.dart';

class ContainerGradient extends Container {
  ContainerGradient({
    child,
    Key? key,
    alignment,
    padding,
    color,
    decoration,
    foregroundDecoration,
    double? width,
    double? height,
    BoxConstraints? constraints,
    margin,
    transform,
    transformAlignment,
    clipBehavior = Clip.none,
  }) : super(
          key: key,
          alignment: alignment,
          padding: padding,
          color: color,
          decoration: decoration ??
              BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    secondaryColor,
                    primaryColor.withAlpha(150),
                  ],
                ),
              ),
          foregroundDecoration: foregroundDecoration,
          width: width,
          height: height,
          constraints: constraints,
          margin: margin,
          transform: transform,
          transformAlignment: transformAlignment,
          clipBehavior: clipBehavior,
          child: child,
        );
}
