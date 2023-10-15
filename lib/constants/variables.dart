import 'package:flutter/material.dart';
import 'package:on_the_spot/constants/color_scheme.g.dart';

LinearGradient gradient = LinearGradient(
                colors: [
                  lightColorScheme.secondary,
                  lightColorScheme.primary,
                  lightColorScheme.tertiary
                ],
                stops: const [
                  0, 0.75, 1
                ],
                begin: const AlignmentDirectional(0.72, -1),
                end: const AlignmentDirectional(-0.72, 1),
              );