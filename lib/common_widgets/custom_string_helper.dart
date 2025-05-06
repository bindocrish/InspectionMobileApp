

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


class CustomStringHelper {
  //int appDecimal = AppConstants.appDecimalPoint;
  String stringNullCheck(dynamic data, {String? opVal = "-"}) {
    if (data != null && data.toString().trim() != "" && data != "null") {
      return data.toString().trim();
    } else {
      return opVal!;
    }
  }

  bool isCheckInteger(dynamic s) {
    //check numeric value
    String val = stringNullCheck(s);
    if (int.tryParse(val) != null) {
      return true;
    }
    return false;
  }

  bool isCheckDouble(dynamic s) {
    //check numeric value
    String val = stringNullCheck(s);
    if (double.tryParse(val) != null) {
      return true;
    }
    return false;
  }

  double convertToDouble(dynamic s, {double opVal = 0.0}) {
    String val = stringNullCheck(s);
    if (double.tryParse(val) != null) {
      return double.tryParse(val)!;
    }
    return opVal;
  }

  int convertToInt(dynamic s, {int opVal = 0}) {
    String val = stringNullCheck(s);
    if (int.tryParse(val) != null) {
      return int.tryParse(val)!;
    }
    return opVal;
  }

  // String formattStringAsFixed(dynamic val,
  //     {String opVal = "0.00",
  //       int decimalDigit = 2,
  //       bool isCusDecimal = false}) {
  //   decimalDigit = isCusDecimal ? decimalDigit : appDecimal;
  //   String value = stringNullCheck(val, opVal: "0");
  //   if (double.tryParse(value) == null) {
  //     return opVal;
  //   } else {
  //     double num = double.parse(value);
  //     return num.toStringAsFixed(decimalDigit);
  //   }
  // }

  // String numberFormatter(dynamic number, {bool decimal = true, String? opVal}) {
  //   String val = stringNullCheck(number, opVal: "0");
  //   if (double.tryParse(val) == null) {
  //     return decimal ? "0.00" : "0";
  //   } else {
  //     String decimalValue = formattStringAsFixed(double.parse(val));
  //     var format1 = NumberFormat('#,##,###.${"#" * appDecimal}');
  //     String num = format1.format(double.parse(decimalValue));
  //     if (num.contains(".")) {
  //       if (num.split(".").last.length > 1) {
  //         return num;
  //       } else {
  //         return '${num}0';
  //       }
  //     }
  //     if (opVal != null && num == "0") {
  //       return opVal;
  //     }
  //     return decimal ? '$num.00' : num;
  //   }
  // }

  String camelToSentence(dynamic str, {String opVal = "-"}) {
    if (stringNullCheck(str) == "-") {
      return opVal;
    } else {
      var splitStr = str.toString().toLowerCase().split(' ');
      for (var i = 0; i < splitStr.length; i++) {
        if (splitStr[i].toString().isNotEmpty) {
          splitStr[i] = splitStr[i][0].toString().toUpperCase() +
              splitStr[i].substring(1);
        }
      }
      return splitStr.join(' ');
    }
  }

  String dateFormat(dynamic date, String format, {String opVal = "-"}) {
    if (date == null || date.toString().isEmpty) return opVal;

    try {
      //check is utc or local
      RegExp tzPattern = RegExp(r'([+-]\d{2}:\d{2})$');
      RegExpMatch? tzMatch = tzPattern.firstMatch(date.toString());
      String? timezoneOffset = tzMatch != null ? tzMatch.group(0) : '+00:00';
      bool isUtc = timezoneOffset == "+00:00";
      DateTime parsedDate = DateTime.parse(date.toString());

      DateTime dateTimeToDisplay = isUtc ? parsedDate : parsedDate.toLocal();
      return DateFormat(format).format(dateTimeToDisplay);
    } catch (e) {
      return opVal;
    }
  }

  (DateTime? start, DateTime? end) validateDate(
      {DateTime? pickedStart,
        DateTime? pickedEnd,
        required DateTime? startDate,
        required DateTime? endDate}) {
    if (pickedStart != null) {
      startDate = pickedStart;
      if (endDate != null && startDate.isAfter(endDate)) {
        endDate = startDate;
      }
    } else if (pickedEnd != null) {
      if (startDate != null && !pickedEnd.isAfter(startDate)) {
        // CustomToaster.errorToasterMessage(
        //     "End Date should be greater than Start date");
      } else {
        endDate = pickedEnd;
      }
    }
    return (startDate, endDate);
  }

  String dateTimeFormat(dynamic date,
      {String opVal = "-", String format = "dd-MM-yyyy – hh:mm a"}) {
    String dateVal = stringNullCheck(date, opVal: "");
    if (dateVal != "") {
      DateTime formatDate = DateTime.parse(date.toString());
      return DateFormat(format).format(formatDate);
    } else {
      return opVal;
    }
  }

  stringToDateTime(dynamic date, {DateTime? optionalDate}) {
    String dateVal = stringNullCheck(date, opVal: "");
    if (dateVal != "") {
      if (dateVal.length > 10) {
        DateFormat dateFormat = DateFormat("yyyy-MM-dd HH:mm:ssZ");
        DateTime formatDate = dateFormat.parse(dateVal);
        return formatDate;
      } else {
        DateTime formatDate = DateTime.parse(dateVal);
        return formatDate;
      }
    } else {
      return optionalDate;
    }
  }

  TimeOfDay? stringToTimeOfDay(String timeString) {
    String dateVal = stringNullCheck(timeString, opVal: "");

    if (dateVal.isNotEmpty) {
      String date = dateVal.split("+")[0];
      List<String> parts = date.split(":");
      int hour = int.parse(parts[0]);
      int minute = int.parse(parts[1]);

      return TimeOfDay(hour: hour, minute: minute);
    } else {
      return null;
    }
  }

  TimeOfDay convertToTimeOfDay(String timeString) {
    String dateVal = stringNullCheck(timeString, opVal: "");
    String date = dateVal.split(" ")[0];
    List<String> parts = date.split(":");
    int hour = int.parse(parts[0]);
    int minute = int.parse(parts[1]);
    if (dateVal.split(" ")[1].toLowerCase() == "pm") {
      hour += 12;
    }

    return TimeOfDay(hour: hour, minute: minute);
  }

  TimeOfDay? dateStringToTimeOfDay(String timeString) {
    String dateVal = stringNullCheck(timeString, opVal: "");

    if (dateVal.isNotEmpty) {
      String date = dateVal.split(" ")[1];
      List<String> parts = date.split(":");

      int hour = int.parse(parts[0]);
      int minute = int.parse(parts[1]);

      return TimeOfDay(hour: hour, minute: minute);
    } else {
      return null;
    }
  }

  String formatTimeOfDay(TimeOfDay? timeOfDay, {is24HourFormat = false}) {
    if (timeOfDay != null) {
      int hour = timeOfDay.hour;
      int minute = timeOfDay.minute;
      if (is24HourFormat) {
        return "$hour:${minute.toString().padLeft(2, '0')}";
      } else {
        String period = (hour < 12) ? 'AM' : 'PM';
        hour = hour % 12;
        if (hour == 0) {
          hour = 12;
        }
        return "$hour:${minute.toString().padLeft(2, '0')} $period";
      }
    } else {
      return "00:00";
    }
  }

  String stringToTime(String appTime) {
    TimeOfDay? formattedTimeOfDay = stringToTimeOfDay(appTime.split("+")[0]);
    return formatTimeOfDay(formattedTimeOfDay);
  }

  // String nameLabel(String? display,
  //     {bool isTwoLetter = false, opVal = "", String empty = ""}) {
  //   String fullDisplaName = stringNullCheck(display, opVal: opVal);
  //   // remove emoji from string
  //   if (RegexHelper.isCheckEmoji.hasMatch(fullDisplaName)) {
  //     display = fullDisplaName.replaceAll(RegexHelper.isCheckEmoji, "");
  //   }
  //   String firstName = stringNullCheck(display, opVal: opVal).split(" ").first;
  //   String lastName = stringNullCheck(display, opVal: opVal).split(" ").last;
  //
  //   if (firstName == lastName) {
  //     lastName = "";
  //   }
  //
  //   String name = "";
  //   if (firstName != "" && firstName != "null") {
  //     name = firstName.trim()[0].toUpperCase();
  //   }
  //   if (lastName != "" && lastName != "null") {
  //     name = name + lastName.trim()[0].toUpperCase();
  //   } else {
  //     if (firstName != "" && firstName != "null") {
  //       if (firstName.length > 1) {
  //         name = name + firstName.trim()[1].toUpperCase();
  //       }
  //     }
  //   }
  //   if (name == "") {
  //     return empty;
  //   }
  //
  //   return isTwoLetter ? name : name[0];
  // }

  formatAadharNumberText(TextEditingController controller) {
    String text = controller.text;
    int selectionIndex = controller.selection.start;

    String formattedText = _addHyphens(text, selectionIndex);
    if (formattedText != text) {
      controller.value = controller.value.copyWith(
        text: formattedText,
        selection: TextSelection.collapsed(
            offset:
            _calculateCursorOffset(text, formattedText, selectionIndex)),
      );
    }
    return controller;
  }

  String _addHyphens(String text, int selectionIndex) {
    text = text.replaceAll('-', '');
    StringBuffer buffer = StringBuffer();
    for (int i = 0; i < text.length; i++) {
      if (i > 0 && i % 4 == 0 && i <= 12) {
        buffer.write('-');
        if (i < selectionIndex) {
          selectionIndex++;
        }
      }
      buffer.write(text[i]);
    }
    return buffer.toString();
  }

  int _calculateCursorOffset(
      String originalText, String formattedText, int originalSelectionIndex) {
    int hyphensBefore = 0;
    for (int i = 0; i < originalSelectionIndex; i++) {
      if (originalText[i] == '-') {
        hyphensBefore++;
      }
    }

    int hyphensInFormatted = 0;
    for (int i = 0; i < formattedText.length; i++) {
      if (formattedText[i] == '-') {
        hyphensInFormatted++;
      }
      if (i - hyphensInFormatted == originalSelectionIndex - hyphensBefore) {
        return i + 1;
      }
    }
    return formattedText.length;
  }
}

// Strinnull check using extension
extension NullChecker on Object? {
  String stringNullCheckExt({String? opVal = "-"}) {
    if (this != null && toString().trim() != "" && this != "null") {
      return toString().trim();
    } else {
      return opVal!;
    }
  }
}
//
// // String to image conversion
// Image? image;
// Future<void> getCanvasImage(String str) async {
//   var builder = ParagraphBuilder(ParagraphStyle(
//     fontStyle: FontStyle.normal,
//   ));
//   builder.addText(str);
//   Paragraph paragraph = builder.build();
//   paragraph.layout(const ParagraphConstraints(width: 100));
//
//   final recorder = PictureRecorder();
//   var newCanvas = Canvas(recorder);
//
//   newCanvas.drawParagraph(paragraph, Offset.zero);
//
//   final picture = recorder.endRecording();
//   var res = await picture.toImage(20, 20);
//   ByteData? data = await res.toByteData(format: ImageByteFormat.png);
//
//   if (data != null) {
//     image = Image.memory(
//       Uint8List.view(data.buffer),
//       height: 20,
//       width: 20,
//       fit: BoxFit.fill,
//     );
//   }
// }
