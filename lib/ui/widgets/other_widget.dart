import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

String getSee(String s) {
  int nilaiS = int.parse(s);
  String str = nilaiS.toString();
  int length = str.length;

  String sign = "";

  if ((nilaiS % 1000) == nilaiS) {
    return nilaiS.toString();
  }

  for (int i = 3; i < length; i = i + 3) {
    num power = pow(10, i);
    if (length > i && (length - i) <= 3) {
      double f = nilaiS / power;
      if (power == pow(10, 3)) {
        sign = "K";
      } else if (power == pow(10, 6)) {
        sign = "M";
      } else if (power == pow(10, 9)) {
        sign = "B";
      }
      return f.round().toString() + sign;
    }
  }
  return nilaiS.toString();
}

loadingSpinkit() {
  return Center(
    child: SpinKitSpinningLines(
      size: 50,
      color: Colors.white,
    ),
  );
}

Future<void> getToLaunch(String url) async {
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  } else {
    throw 'Could not launch $url';
  }
}

void shareTo(String text) {
  Share.share(text);
}

TextStyle textStyle11({Color? color}) {
  return GoogleFonts.adamina(
      fontSize: 11, color: color ?? Colors.white, fontWeight: FontWeight.w300);
}

TextStyle textStyle12({Color? color}) {
  return GoogleFonts.adamina(
      fontSize: 12, color: color ?? Colors.white, fontWeight: FontWeight.w300);
}

TextStyle textStyle14({Color? color}) {
  return GoogleFonts.adamina(
      fontSize: 14, color: color ?? Colors.white, fontWeight: FontWeight.w300);
}

TextStyle textStyle16({Color? color}) {
  return GoogleFonts.adamina(
      fontSize: 16, color: color ?? Colors.white, fontWeight: FontWeight.w600);
}

TextStyle textStyle18({Color? color}) {
  return GoogleFonts.adamina(
      fontSize: 18, color: color ?? Colors.white, fontWeight: FontWeight.bold);
}
