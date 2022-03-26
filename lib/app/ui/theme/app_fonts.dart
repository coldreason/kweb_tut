import 'package:flutter/material.dart';

import 'package:web_fonts/fonts/web_fonts_descriptor.dart';
import 'package:web_fonts/fonts/web_fonts_variant.dart';
import 'package:web_fonts/web_fonts.dart';

class NotoSansKR {
  static const String _fontFamily = 'NotoSansKR';
  static bool _registered = false;

  // register font files
  static register() {
    if (_registered) {
      return;
    }

    WebFonts.register(_fontFamily, {
      const WebFontsVariant(
        fontWeight: FontWeight.w300,
        fontStyle: FontStyle.normal,
      ): WebFontsFile(
        'http://fonts.gstatic.com/s/notosanskr/v13/Pby7FmXiEBPT4ITbgNA5CgmOelzI7rgQsWYrzw.otf',
      ),
      const WebFontsVariant(
        fontWeight: FontWeight.w400,
        fontStyle: FontStyle.normal,
      ): WebFontsFile(
        'http://fonts.gstatic.com/s/notosanskr/v13/PbykFmXiEBPT4ITbgNA5Cgm20HTs4JMMuA.otf',
      ),
      const WebFontsVariant(
        fontWeight: FontWeight.w500,
        fontStyle: FontStyle.normal,
      ): WebFontsFile(
        'http://fonts.gstatic.com/s/notosanskr/v13/Pby7FmXiEBPT4ITbgNA5CgmOIl3I7rgQsWYrzw.otf',
      ),
      const WebFontsVariant(
        fontWeight: FontWeight.w700,
        fontStyle: FontStyle.normal,
      ): WebFontsFile(
        'http://fonts.gstatic.com/s/notosanskr/v13/Pby7FmXiEBPT4ITbgNA5CgmOalvI7rgQsWYrzw.otf',
      ),
      const WebFontsVariant(
          fontWeight: FontWeight.w900,
          fontStyle:
              FontStyle.normal): WebFontsFile(
          'http://fonts.gstatic.com/s/notosanskr/v13/Pby7FmXiEBPT4ITbgNA5CgmOUlnI7rgQsWYrzw.otf')
    });

    _registered = true;
  }

  static TextStyle getTextStyle([TextStyle? textStyle]) {
    register();

    return WebFonts.getTextStyle(_fontFamily, textStyle: textStyle);
  }

  static TextTheme getTextTheme([TextTheme? textTheme]) {
    register();

    return WebFonts.getTextTheme(_fontFamily, textTheme);
  }
}
