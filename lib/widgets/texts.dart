import 'package:flutter/material.dart';

///All text Widgets used in the App
class Texts {
  static Text headline1(String text, Color color,
      {TextAlign alignment = TextAlign.left}) {
    return Text(
      text,
      textAlign: alignment,
      style: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w700,
          fontSize: 34,
          color: color),
    );
  }

  static Text headline2(String text, Color color,
      {TextAlign alignment = TextAlign.left}) {
    return Text(
      text,
      textAlign: alignment,
      style: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          fontSize: 24,
          color: color),
    );
  }

  static Text headline3(
    String text,
    Color color, {
    TextAlign alignment = TextAlign.left,
    TextDecoration decoration = TextDecoration.none,
  }) {
    return Text(
      text,
      maxLines: 5,
      textAlign: alignment,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          decoration: decoration,
          decorationThickness: 5,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          fontSize: 18,
          color: color),
    );
  }

  static Text headline4(
    String text,
    Color color, {
    TextAlign alignment = TextAlign.left,
    TextDecoration decoration = TextDecoration.none,
  }) {
    return Text(
      text,
      maxLines: 5,
      textAlign: alignment,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          decoration: decoration,
          decorationThickness: 5,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          fontSize: 15,
          color: color),
    );
  }

  static Text subheadline3(
    String text,
    Color color, {
    TextAlign alignment = TextAlign.left,
    TextDecoration decoration = TextDecoration.none,
  }) {
    return Text(
      text,
      maxLines: 5,
      textAlign: alignment,
      overflow: TextOverflow.ellipsis,
      style: TextStyle(
          decoration: decoration,
          decorationThickness: 5,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
          fontSize: 18,
          color: color),
    );
  }

  static Text subheads(String text, Color color,
      {TextAlign alignment = TextAlign.left}) {
    return Text(
      text,
      textAlign: alignment,
      style: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: color),
    );
  }

  static Text subheads2(String text, Color color,
      {TextAlign alignment = TextAlign.left}) {
    return Text(
      text,
      textAlign: alignment,
      style: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          fontSize: 16,
          color: color),
    );
  }

  static Text subBoldText(String text, Color color,
      {TextAlign alignment = TextAlign.left}) {
    return Text(
      text,
      textAlign: alignment,
      style: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w600,
          fontSize: 15,
          color: color),
    );
  }

  static Text text(
    String text,
    Color color, {
    TextAlign alignment = TextAlign.left,
    TextOverflow textOverflow = TextOverflow.visible,
    // int maxLines
  }) {
    return Text(
      text,
      softWrap: true,
      overflow: textOverflow,
      // maxLines: maxLines,
      textAlign: alignment,
      style: TextStyle(
          height: 1.1,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: color),
    );
  }

  static Text descriptiveItems(String text, Color color,
      {TextAlign alignment = TextAlign.left,
      TextDecoration decoration = TextDecoration.none}) {
    return Text(
      text,
      textAlign: alignment,
      style: TextStyle(
          decoration: decoration,
          decorationThickness: 5,
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: color),
    );
  }

  static Text descriptionText(String text, Color color,
      {TextAlign alignment = TextAlign.left}) {
    return Text(
      text,
      textAlign: alignment,
      style: TextStyle(
          fontFamily: 'Roboto',
          fontWeight: FontWeight.w400,
          fontSize: 14,
          color: color),
    );
  }
}
