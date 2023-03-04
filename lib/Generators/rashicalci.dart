import 'dart:convert';
import 'dart:math';

enum ZODIAC_SIGN {
  ZODIAC_ARIES,
  ZODIAC_TAURUS,
  ZODIAC_GEMINI,
  ZODIAC_CANCER,
  ZODIAC_LEO,
  ZODIAC_VIRGO,
  ZODIAC_LIBRA,
  ZODIAC_SCORPIO,
  ZODIAC_SAGITARRIUS,
  ZODIAC_CAPRICORN,
  ZODIAC_AQUARIUS,
  ZODIAC_PISCES,
  ZODIAC_NONE
}

double d2r = 3.141592653589793 / 180;
double r2d = 180 / 3.141592653589793;
double ra = 0.0, dc = 0.0; // compulsory to initialize both the variables.
double pln = 0.0, plt = 0.0; // compulsory to initialize both the variables.
// String lord = "KeVeSuMoMaRaJuSaMe";
// int dasha[] = {7, 20, 6, 10, 7, 18, 16, 19, 17};
// String zn = "AriTauGemCanLeoVirLibScoSagCapAquPis";
// int range[] = {1, 12, 1, 31, 1800, 2100, 0, 23, 0, 59, 0, 12, 0, 59, 0, 0, 0, 179, 0, 59, 0, 0, 0, 89, 0, 59};
// String naks[] = {"Aswini", "Bharani", "Krittika", "Rohini", "Mrigsira", "Ardra", "Punarvasu", "Pushya", "Aslesha", "Magha", "P.Phalguni", "U.Phalguni", "Hasta", "Chitra", "Swati", "Vishakha", "Anuradha", "Jyeshtha", "Mula", "P.Shadya", "U.Shadya", "Shravana", "Dhanishtha", "Shatbisha", "P.Phadra", "U.Phadra", "Revati"};
ZODIAC_SIGN calculate(
    double day,
    double mon,
    double year,
    double hr,
    double mins,
    double tzHr,
    double tzMins,
    double longDegree,
    double longMins,
    double latDeg,
    double latMin,
    bool dst,
    bool eln,
    bool sla) {
  // if (checkEntries(null)) return ZODIAC_SIGN.ZODIAC_SIGN_UNKNOWN;

  //	Additional Lat long calculations (can be kept static)
  hr += mins.floor() / 60;
  //double tzHr = 5;//document.LunarCalc.ZHour.value;
  double tz = tzHr.floor() * 1.0;
  //double tzMins = 30;//document.LunarCalc.ZMin.value;
  tz += tzMins.floor() / 60;
  //float longDegree = 77;//document.LunarCalc.LonDeg.value
  double ln = longDegree.floor() * 1.0;
  //double longMins = 12;//document.LunarCalc.LonMin.value;
  ln += longMins.floor() / 60;
  //double latDeg = 28;//document.LunarCalc.LatDeg.value
  double la = latDeg.floor() * 1.0;
  //double latMin = 36;//document.LunarCalc.LatMin.value;
  la += latMin.floor() / 60;

  if (eln) ln = -ln;
  if (sla) la = -la;
  if (dst) {
    if (ln < 0.0)
      tz++;
    else
      tz--;
  }

  double jd = mdy2julian(mon, day, year);
  double f;
  if (ln < 0.0)
    f = hr - tz;
  else
    f = hr + tz;

  double t = (jd - 2451545 - 0.5) / 36525;
  double gst = ut2gst(t, f);
  t = ((jd - 2451545) + f / 24 - 0.5) / 36525;
  double ay = calcayan(t);
  double ob = 23.452294 - 0.0130125 * t;
  double l = (218.3164591 + 481267.88134236 * t);
  double d = (297.8502042 + 445267.1115168 * t);
  double m = (357.5291092 + 35999.0502909 * t);
  double mm = (134.9634114 + 477198.8676313 * t);
  f = (93.2720993 + 483202.0175273 * t);
  d *= d2r;
  m *= d2r;
  mm *= d2r;
  f *= d2r;

  double e = 1 - 0.002516 * t - 0.0000074 * t * t;
  double p, b, r;

  //with(Math) {
  p = 6.288774 * sin(mm) +
      1.274027 * sin(d * 2 - mm) +
      0.658314 * sin(d * 2) +
      0.213618 * sin(2 * mm) -
      0.185116 * e * sin(m) -
      0.114332 * sin(f * 2);
  p += 0.058793 * sin(d * 2 - mm * 2) +
      0.057066 * e * sin(d * 2 - m - mm) +
      0.053322 * sin(d * 2 + mm) +
      0.045758 * e * sin(d * 2 - m) -
      0.040923 * e * sin(m - mm) -
      0.034720 * sin(d) -
      0.030383 * e * sin(m + mm);
  p += 0.015327 * sin(d * 2 - f * 2) -
      0.012528 * sin(mm + f * 2) +
      0.010980 * sin(mm - f * 2) +
      0.010675 * sin(d * 4 - mm) +
      0.010034 * sin(3 * mm);
  p += 0.008548 * sin(d * 4 - mm * 2) -
      0.007888 * e * sin(d * 2 + m - mm) -
      0.006766 * e * sin(d * 2 + m) -
      0.005163 * sin(d - mm) +
      0.004987 * e * sin(d + m) +
      0.004036 * e * sin(d * 2 - m + mm) +
      0.003994 * sin(d * 2 + mm * 2);
  b = 5.128122 * sin(f) +
      0.280602 * sin(mm + f) +
      0.277693 * sin(mm - f) +
      0.173237 * sin(d * 2 - f) +
      0.055413 * sin(d * 2 - mm + f) +
      0.046271 * sin(d * 2 - mm - f);
  b += 0.032573 * sin(2 * d + f) +
      0.017198 * sin(2 * mm + f) +
      0.009266 * sin(2 * d + mm - f) +
      0.008823 * sin(2 * mm - f) +
      0.008247 * e * sin(2 * d - m - f) +
      0.004324 * sin(2 * d - f - 2 * mm);
  b += 0.004200 * sin(2 * d + f + mm) +
      0.003372 * e * sin(f - m - 2 * d) +
      0.002472 * e * sin(2 * d + f - m - mm) +
      0.002222 * e * sin(2 * d + f - m) +
      0.002072 * e * sin(2 * d - f - m - mm) +
      0.001877 * e * sin(f - m + mm);
  b += 0.001828 * sin(4 * d - f - mm) -
      0.001803 * e * sin(f + m) -
      0.001750 * sin(3 * f) +
      0.001570 * e * sin(mm - m - f) -
      0.001487 * sin(f + d) -
      0.001481 * e * sin(f + m + mm);
  r = 0.950724 +
      0.051818 * cos(mm) +
      0.009531 * cos(2 * d - mm) +
      0.007843 * cos(2 * d) +
      0.002824 * cos(2 * mm) +
      0.000857 * cos(2 * d + mm) +
      0.000533 * e * cos(2 * d - m);
  r += 0.000401 * e * cos(2 * d - m - mm) +
      0.000320 * e * cos(mm - m) -
      0.000271 * cos(d) -
      0.000264 * e * cos(m + mm) -
      0.000198 * cos(2 * f - mm) +
      0.000173 * cos(3 * mm);
  r += 0.000167 * cos(4 * d - mm) -
      0.000111 * e * cos(m) +
      0.000103 * cos(4 * d - 2 * mm) -
      0.000084 * cos(2 * mm - 2 * d) -
      0.000083 * e * cos(2 * d + m) +
      0.000079 * cos(2 * d + 2 * mm) +
      0.000072 * cos(4 * d);
  //}
  l += p;
  while (l < 0.0) l += 360.0;
  while (l > 360.0) l -= 360.0;
  ecl2equ(l, b, ob);
  ln = -ln;
  ln /= 15;
  ln += gst;
  while (ln < 0.0) ln += 24;
  while (ln > 24.0) ln -= 24;
  double h = (ln - ra) * 15;

  double u = atan(0.996647 * tan(d2r * la));
  double s = 0.996647 * sin(u);
  double c = cos(u);
  r = 1 / sin(d2r * r);
  double dlt = atan2(c * sin(d2r * h), r * cos(d2r * dc) - c * cos(d2r * h));
  dlt *= r2d;
  double hh = h + dlt;
  dlt /= 15;
  ra -= dlt;
  dc = atan(cos(d2r * hh) *
      ((r * sin(d2r * dc) - s) / (r * cos(d2r * dc) * cos(d2r * h) - c)));
  dc *= r2d;
  equ2ecl(ra, dc, ob);
  l += ay;
  if (l < 0.0) l += 360.0;
  //System.out.println("Rashi is = " + lon2dmsz(l));    //document.display.npmoon.value = lon2dmsz(l);
  double nk = (l * 60) / 800.0;
  //with(Math) {
  //System.out.println("Nakshatra - " + naks[(int) floor(nk)]);    //document.display.nnakshatra.value = naks[(int) floor(nk)];
  //  THIS ALMOST SOLVES ALL THAT YOU NEED. WE CAN OMIT THE REST

  ZODIAC_SIGN zodiac =
      lon2Zodiac(l); // Receives output int the form Enum_Name.Value_Name.
  return zodiac;
}

bool checkEntries(String f) {
  //	Check if the values are within the range and show appropriate error message and return correct value
  return false;
}

double mdy2julian(double m, double d, double y) {
  double im = 12 * (y + 4800) + m - 3;
  double j = (2 * (im - (im / 12).floor() * 12) + 7 + 365 * im) / 12;
  j = j.floor() + d + (im / 48).floor() - 32083;
  if (j > 2299171) j += (im / 4800).floor() - (im / 1200).floor() + 38;
  return j;
}

double ut2gst(double t, double ut) {
  double t0 = 6.697374558 + (2400.051336 * t) + (0.000025862 * t * t);
  ut *= 1.002737909;
  t0 += ut;
  while (t0 < 0.0) t0 += 24;
  while (t0 > 24.0) t0 -= 24;
  return t0;
}

double calcayan(double t) {
  //with(Math) {
  double ln = 125.0445550 - 1934.1361849 * t + 0.0020762 * t * t;
  double off = 280.466449 + 36000.7698231 * t + 0.00031060 * t * t;
  off =
      17.23 * sin(d2r * ln) + 1.27 * sin(d2r * off) - (5025.64 + 1.11 * t) * t;
  off = (off - 85886.27) / 3600.0;
  //}
  return off;
}

void ecl2equ(double ln, double la, double ob) {
  //with(Math) {
  double y = asin(sin(d2r * la) * cos(d2r * ob) +
      cos(d2r * la) * sin(d2r * ob) * sin(d2r * ln));
  dc = r2d * y;
  y = sin(d2r * ln) * cos(d2r * ob) - tan(d2r * la) * sin(d2r * ob);
  double x = cos(d2r * ln);
  x = atan2(y, x);
  x = r2d * x;
  if (x < 0.0) x += 360;
  ra = x / 15;
  //}
}

void equ2ecl(double ra, double dc, double ob) {
  ra *= 15;
  //with(Math) {
  double y = sin(d2r * ra) * cos(d2r * ob) + tan(d2r * dc) * sin(d2r * ob);
  double x = cos(d2r * ra);
  x = atan2(y, x);
  x *= r2d;
  if (x < 0) x += 360;
  pln = x;
  y = asin(sin(d2r * dc) * cos(d2r * ob) -
      cos(d2r * dc) * sin(d2r * ob) * sin(d2r * ra));
  double pla = r2d * y;
  //}
}

ZODIAC_SIGN lon2Zodiac(double x) {
  //with(Math) {
  double d, m, s;
  x = x.abs();
  d = x.floor() * 1.0;
  m = (x - d);
  s = m * 60;
  m = s.floor() * 1.0;
  s = s - m;
  double z = (d / 30).floor() * 1.0;
  d %= 30;
  int startIndex = (z * 3).toInt();
  ZODIAC_SIGN zodiac =
      ZODIAC_SIGN.values[z.toInt()]; //zn.substring(startIndex, startIndex + 3);
  //}
  return zodiac;
}
