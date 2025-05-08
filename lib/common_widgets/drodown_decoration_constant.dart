
import 'common_import_helper.dart';

class AppDropdownDecoration {
  static InputDecoration normal(String labelText, bool isValidate,
      EdgeInsetsGeometry? contentPading) =>
      InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffDEDEDE)),
              borderRadius: BorderRadius.circular(5.0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: Color(0xff006BD6))),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: Color(0xffDEDEDE))),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: Color(0xffDEDEDE))),
          disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffDEDEDE)),
              borderRadius: BorderRadius.circular(5.0)),
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                  child: Text(labelText,
                      style: const TextStyle(
                          color: Color(0xffA6A6A6),
                          fontSize: 14.5,
                          fontWeight: FontWeight.w400))),
              const SizedBox(width: 2),
              isValidate
                  ? const Text(" *", style: TextStyle(color: Colors.red))
                  : const SizedBox()
            ],
          ),
          labelStyle: const TextStyle(
              color: Color(0xffA6A6A6),
              fontSize: 14.5,
              fontWeight: FontWeight.w400),
          hintText: "",
          errorStyle: const TextStyle(color: Colors.red),
          enabled: true,
          fillColor: Colors.white,
          filled: true,
          focusColor: Colors.lightBlue,
          contentPadding: contentPading ?? const EdgeInsets.all(12));

  static InputDecoration filled(String labelText, bool isValidate,
      EdgeInsetsGeometry? contentPading) =>
      InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffDEDEDE)),
              borderRadius: BorderRadius.circular(5.0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: Color(0xff006BD6))),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: Color(0xffDEDEDE))),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: Color(0xffDEDEDE))),
          disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffDEDEDE)),
              borderRadius: BorderRadius.circular(5.0)),
          hintStyle: const TextStyle(
              color: Color(0xffA6A6A6),
              fontSize: 14.5,
              fontWeight: FontWeight.w400),
          enabled: true,
          filled: true,
          fillColor: Colors.white,
          focusColor: Colors.lightBlue,
          contentPadding: contentPading ?? const EdgeInsets.all(12));

  static InputDecoration filter(String labelText, bool isValidate) =>
      InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xFFE9E9E9)),
              borderRadius: BorderRadius.circular(8.0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(color: Color(0xFFE9E9E9))),
          filled: true,
          fillColor: const Color(0xffF2F2F2),
          hintText: labelText,
          errorStyle: const TextStyle(color: Colors.red),
          hintStyle: const TextStyle(color: Colors.black45, fontSize: 15.0),
          enabled: true,
          focusColor: Colors.lightBlue,
          contentPadding: const EdgeInsets.fromLTRB(12, 18, 12, 0));

  static InputDecoration borderNone(String labelText, bool isValidate,
      {bool isDense = true}) =>
      InputDecoration(
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          errorBorder: InputBorder.none,
          focusedErrorBorder: InputBorder.none,
          isDense: isDense,
          errorStyle: const TextStyle(color: Colors.red),
          label: Row(
            children: [
              Text(labelText),
              Visibility(
                  visible: isValidate,
                  child: const Text(" *", style: TextStyle(color: Colors.red)))
            ],
          ),
          labelStyle: const TextStyle(
              color: Color(0xffA6A6A6),
              fontSize: 14.5,
              fontWeight: FontWeight.w400));

  static InputDecoration quotesDropdown(String labelText, bool isValidate,
      EdgeInsetsGeometry? contentPading) =>
      InputDecoration(
          border: InputBorder.none,
          hintStyle:
          AppTextStyles.subtitle1.copyWith(fontWeight: FontWeight.w400),
          errorStyle: const TextStyle(color: Colors.red),
          hintText: labelText,
          enabled: true,
          isDense: true,
          fillColor: Colors.red,
          focusColor: Colors.lightBlue,
          contentPadding: contentPading ?? const EdgeInsets.only(left: 12));

  static InputDecoration taxPercent(String labelText, bool isValidate,
      EdgeInsetsGeometry? contentPading) =>
      InputDecoration(
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xff6E7585)),
              borderRadius: BorderRadius.circular(5.0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: Color(0xff6E7585))),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: Color(0xff6E7585))),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: const BorderSide(color: Color(0xff6E7585))),
          disabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffDEDEDE)),
              borderRadius: BorderRadius.circular(5.0)),
          label: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: Text(labelText,
                    style: const TextStyle(
                        color: Color(0xffA6A6A6),
                        fontSize: 14.5,
                        fontWeight: FontWeight.w400)),
              ),
              const SizedBox(width: 2),
              isValidate
                  ? const Text(" *", style: TextStyle(color: Colors.red))
                  : const SizedBox()
            ],
          ),
          labelStyle: const TextStyle(
              color: Color(0xffA6A6A6),
              fontSize: 14.5,
              fontWeight: FontWeight.w400),
          errorStyle: const TextStyle(color: Colors.red),
          hintText: "",
          enabled: true,
          isDense: true,
          fillColor: Colors.red,
          focusColor: Colors.lightBlue,
          contentPadding: contentPading ?? const EdgeInsets.only(left: 12));

  // To remove all padding
  static InputDecoration tranasctionFillter() => InputDecoration(
    // border: OutlineInputBorder(borderSide: BorderSide.none),
      enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue)),
      filled: true,
      fillColor: const Color(0xffE6F1FC),
      contentPadding: const EdgeInsets.only(left: 10, top: 10));
}
