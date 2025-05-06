import 'package:flutter/cupertino.dart';

import '../model/common_models/date_filter_model.dart';

class AppColors{



  static const Color primary = Color(0xFFEA7F1D);
  static const Color navigationBarColor =   Color(0xFFE6B0A4);
}

class AppConstants{
  static List<DateFilterList> dateRangeList = [];
  static const String ddMMMyyyy = 'dd MMM yyyy';
  // ignore: constant_identifier_names
  static const String dd_MMM_yyyy = 'dd-MM-yyyy';
  static const String yyyyMmdd = 'yyyy-MM-dd';
  static const String ddMm = 'dd - MMM';
  static const String ddMmm = 'dd MMM';
  static const String mmm = 'MMM';
  static const String dd = 'dd';
  // ignore: constant_identifier_names
  static const String MMM_yyyy = 'MMM - yyyy';
  static const String week = 'EEE';
  // ignore: constant_identifier_names
  static const String MMMyyyy = 'MMM yyyy';
  static const String mmmComaYyyy = 'MMM, yyyy';
  static const String yyyy = 'yyyy';
  static const String ddmmyyyyhhmma = 'dd-MM-yyyy h:mm a';
  static const String ddmmyyyyhhmmaSlash = 'dd/MM/yyyy h:mm a';
  static const String prefixDate = 'dd/MM/yyyy';
  static const String mm = 'mm';
  static const String hh = 'h:mm a';
  static const String dateSlashFormat = "dd/MM/yyyy";
  static const String advancepayable = 'dd MMM yyyy';
  static const String fullDate = 'MMM dd, yyyy h:mm a';
  static const String dateWithAt = "dd MMM 'at' h:mm a";
  static const String chatDateFormat = "MMM dd , yyyy";
}