import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';
import '../utilities/utils.dart';

Widget svgIconWidget(
    String name,
    ) {
  return SvgPicture.asset(Utils.getIconPath(name));
}

Widget svgImageWidget(
    String name, {
      String format = 'svg',
    }) {
  return SvgPicture.asset(Utils.getImagePath(name, format: format));
}

Widget svgImageFeedbackWidget(
    String name, {
      String format = 'svg',
    }) {
  return SvgPicture.asset(Utils.getImageFeedbackPath(name, format: format));
}

Widget svgImageFeatureWidget(
    String name, {
      String format = 'svg',
    }) {
  return SvgPicture.asset(Utils.getImageFeaturePath(name, format: format));
}