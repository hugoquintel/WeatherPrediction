import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:np_weather/utils/app_colors.dart';

// FontWeight
const light = FontWeight.w300;
const regular = FontWeight.w400;
const medium = FontWeight.w500;
const bold = FontWeight.w700;

double percent = 0.5;
// FONTSIZE
//Heading
double h1Size = 100 * percent;
double h2Size = 55 * percent;
double h3Size = 36 * percent;
double h4Size = 32 * percent;
double h5Size = 28 * percent;
double h6Size = 24 * percent;

//Body
double b1Size = 32 * percent;
double b2Size = 28 * percent;
double b3Size = 24 * percent;
double b4Size = 22 * percent;
double b5Size = 16 * percent;
double b6Size = 14 * percent;

class AppTextstyle {
  //HEADING
  static final h1Regular = GoogleFonts.notoSans(
    fontSize: h1Size,
    fontWeight: regular,
    color: AppColors.black,
  );
  static final h1Bold = GoogleFonts.notoSans(
    fontSize: h1Size,
    fontWeight: bold,
    color: AppColors.black,
  );
  static final h2Regular = GoogleFonts.notoSans(
    fontSize: h2Size,
    fontWeight: regular,
    color: AppColors.black,
  );
  static final h2Bold = GoogleFonts.notoSans(
    fontSize: h2Size,
    fontWeight: bold,
    color: AppColors.black,
  );
  static final h3Regular = GoogleFonts.notoSans(
    fontSize: h3Size,
    fontWeight: regular,
    color: AppColors.black,
  );
  static final h3Bold = GoogleFonts.notoSans(
    fontSize: h3Size,
    fontWeight: bold,
    color: AppColors.black,
  );
  static final h4Regular = GoogleFonts.notoSans(
    fontSize: h4Size,
    fontWeight: regular,
    color: AppColors.black,
  );
  static final h4Rold = GoogleFonts.notoSans(
    fontSize: h4Size,
    fontWeight: bold,
    color: AppColors.black,
  );
  static final h5Regular = GoogleFonts.notoSans(
    fontSize: h5Size,
    fontWeight: regular,
    color: AppColors.black,
  );
  static final h6Regular = GoogleFonts.notoSans(
    fontSize: h6Size,
    fontWeight: regular,
    color: AppColors.black,
  );

  //BODY
  static final b1Regular = GoogleFonts.notoSans(
    fontSize: b1Size,
    fontWeight: regular,
    color: AppColors.black,
  );
  static final b1RegularW = GoogleFonts.notoSans(
    fontSize: b1Size,
    fontWeight: regular,
    color: AppColors.white,
  );
  static final b1Bold = GoogleFonts.notoSans(
    fontSize: b1Size,
    fontWeight: bold,
    color: AppColors.black,
  );
  static final b1BoldW = GoogleFonts.notoSans(
    fontSize: b1Size,
    fontWeight: bold,
    color: AppColors.white,
  );
  static final b2Regular = GoogleFonts.notoSans(
    fontSize: b2Size,
    fontWeight: regular,
    color: AppColors.black,
  );
  static final b2Medium = GoogleFonts.notoSans(
    fontSize: b2Size,
    fontWeight: medium,
    color: AppColors.black,
  );
  static final b2Bold = GoogleFonts.notoSans(
    fontSize: b2Size,
    fontWeight: bold,
    color: AppColors.black,
  );
  static final b3Regular = GoogleFonts.notoSans(
    fontSize: b3Size,
    fontWeight: regular,
    color: AppColors.black,
  );
  static final b3BoldUnderline = GoogleFonts.notoSans(
    fontSize: b3Size,
    fontWeight: bold,
    decoration: TextDecoration.underline,
    color: AppColors.black,
  );
  static final b4Regular = GoogleFonts.notoSans(
    fontSize: b4Size,
    fontWeight: regular,
    color: AppColors.black,
  );
  static final b5Regular = GoogleFonts.notoSans(
    fontSize: b5Size,
    fontWeight: regular,
    color: AppColors.black,
  );
  static final b6Regular = GoogleFonts.notoSans(
    fontSize: b6Size,
    fontWeight: regular,
    color: AppColors.black,
  );

  //HINT
  static final hintstyle = GoogleFonts.notoSans(
    fontSize: 14,
    fontWeight: regular,
    color: AppColors.neutral,
  );

  //Button
  static final ButtonB1 = GoogleFonts.notoSans(
    fontSize: b1Size,
    fontWeight: bold,
    color: AppColors.white,
  );

  static final QMK = GoogleFonts.notoSans(
    fontSize: b3Size,
    fontWeight: bold,
    color: AppColors.primary,
    decoration: TextDecoration.underline,
  );
}
