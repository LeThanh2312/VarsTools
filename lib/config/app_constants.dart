import 'package:flutter/material.dart';
import 'package:varstools/config/app_color.dart';


const padding24 = 24.0;
const defaultPadding = 20.0;
const padding16 = 16.0;
const padding12 = 12.0;
const padding8 = 8.0;
const padding6 = 6.0;
const padding4 = 4.0;

var placeHolderWidget = Container(
  decoration: BoxDecoration(
    color: AppColors.silverColor,
    borderRadius: BorderRadius.circular(defaultPadding / 4),
  ),
);

const DEFAULT_PAGE = 1;
const LIMIT_PER_PAGE = 30;
