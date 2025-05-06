import 'common_import_helper.dart';

class AppTextDecoration {
//others
  //Quotes
  static const BoxDecoration sectionDecoration = BoxDecoration(
    color: Colors.white,
    border: Border(
        top: BorderSide(width: 0.5, color: Color(0xffDADADB)),
        bottom: BorderSide(width: 0.5, color: Color(0xffDADADB))),
  );

  static BoxDecoration addButtonDecoration = BoxDecoration(
      border: Border.all(color: const Color(0xffDEDEDE)),
      borderRadius: BorderRadius.circular(5));

  //textformfield
  static InputDecoration textFieldDecoration(
      String label, bool? isValidate, String? hintText,
      {String? helperText,
        Widget? prefixIcon,
        Widget? suffix,
        Widget? suffixIcon}) =>
      InputDecoration(
          alignLabelWithHint: true,
          helperText: helperText,
          hintText: hintText,
          prefixIcon: prefixIcon,
          suffix: suffix,
          suffixIcon: suffixIcon,
          errorStyle: const TextStyle(
              color: Colors.red, fontSize: 12, fontWeight: FontWeight.w400),
          hintStyle: const TextStyle(
              color: Color(0xffA6A6A6),
              fontSize: 14.5,
              fontWeight: FontWeight.w400),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Color(0xffDEDEDE)),
              borderRadius: BorderRadius.circular(5.0)),
          disabledBorder: OutlineInputBorder(
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
          label: Row(mainAxisSize: MainAxisSize.min, children: [
            Flexible(
              child: RichText(
                  text: TextSpan(
                      text: label,
                      style: const TextStyle(
                          color: Color(0xffA6A6A6),
                          fontSize: 14.5,
                          fontWeight: FontWeight.w400),
                      children: [
                        TextSpan(
                            text: (isValidate ?? true) ? "  *" : "",
                            style: const TextStyle(color: Colors.red))
                      ])),
            ),
          ]),
          fillColor: Colors.white,
          filled: true,
          labelStyle: const TextStyle(
              color: Color(0xffA6A6A6),
              fontSize: 14.5,
              fontWeight: FontWeight.w400),
          contentPadding: const EdgeInsets.all(12.0));
  static InputDecoration textFieldBtmBorderDecoration(String lableText) =>
      InputDecoration(
        isDense: true,
        enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffDEDEDE), width: 0.5)),
        focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Color(0xffDEDEDE))),
        labelText: lableText,
        labelStyle: const TextStyle(
            height: 0.4,
            color: Colors.black38,
            letterSpacing: 0.0,
            fontSize: 14),
      );

  InputDecoration borderNone(
      {String lable = "",
        final EdgeInsetsGeometry? contentPading,
        bool? isDense = false,
        bool isValidate = false}) {
    return InputDecoration(
        isDense: isDense,
        border: InputBorder.none,
        enabledBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        // labelText: lable,
        label: Row(
          children: [
            Text(lable),
            Visibility(
                visible: isValidate,
                child: const Text("*", style: TextStyle(color: Colors.red)))
          ],
        ),
        errorStyle: const TextStyle(color: Colors.red),
        labelStyle: const TextStyle(
            color: Color(0xffA6A6A6),
            fontSize: 14.5,
            fontWeight: FontWeight.w400));
  }

  static InputDecoration discountPercentage = InputDecoration(
      prefixIconConstraints: const BoxConstraints(minWidth: 5, minHeight: 5),
      isDense: true,
      contentPadding: const EdgeInsets.only(
          top: 10.0, bottom: 10.0, left: 10.0, right: 4.0),
      border: InputBorder.none,
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffEA9E2E)),
          borderRadius: BorderRadius.circular(5.0)),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffEA9E2E)),
          borderRadius: BorderRadius.circular(5.0)),
      errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffEA9E2E))),
      focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffEA9E2E))),
      disabledBorder: InputBorder.none,
      suffixIconConstraints: const BoxConstraints(minWidth: 5, minHeight: 5),
      suffixIcon: const Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.only(right: 5.0),
              child: Text("%", style: TextStyle(color: Color(0xffEEA02C)))),
        ],
      ));

  static InputDecoration discountAmt = InputDecoration(
    prefixIcon: const Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 8.0),
          child: Text("\u{20B9}", style: AppTextStyles.cardText1),
        ),
        SizedBox(width: 10)
      ],
    ),
    prefixIconConstraints: const BoxConstraints(minWidth: 5, minHeight: 5),
    isDense: true,
    contentPadding:
    const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
    border: InputBorder.none,
    focusedBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xffDEDEDE)),
        borderRadius: BorderRadius.circular(5.0)),
    enabledBorder: OutlineInputBorder(
        borderSide: const BorderSide(color: Color(0xffDEDEDE)),
        borderRadius: BorderRadius.circular(5.0)),
    errorBorder: InputBorder.none,
    disabledBorder: InputBorder.none,
  );
  static InputDecoration dropdownDecoration(String lable) => InputDecoration(
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xFFE9E9E9)),
          borderRadius: BorderRadius.circular(8.0)),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8.0),
        borderSide: const BorderSide(color: Color(0xFFE9E9E9)),
      ),
      filled: true,
      fillColor: const Color(0xffF2F2F2),
      hintText: lable,
      hintStyle: const TextStyle(color: Colors.black45, fontSize: 15.0),
      enabled: true,
      focusColor: Colors.lightBlue,
      contentPadding: const EdgeInsets.fromLTRB(12, 18, 12, 0));

  static const InputDecoration roundOff = InputDecoration(
      contentPadding: EdgeInsets.only(bottom: 3.5, top: 3.5),
      isDense: true,
      enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xffECECEC))),
      focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Color(0xffDEDEDE))),
      prefixIconConstraints: BoxConstraints(minWidth: 15, minHeight: 5),
      prefixIcon: Padding(
          padding: EdgeInsets.only(top: 3.5, bottom: 3.5),
          child: Text("\u{20B9}",
              style: TextStyle(
                  fontSize: 13.5,
                  fontWeight: FontWeight.w500,
                  color: Color(0xff414141)))));

  static const InputDecoration grandTotal = InputDecoration(
    //contentPadding: EdgeInsets.only(bottom: 10, top: 10),
    isDense: true,
    enabledBorder:
    UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffECECEC))),
    focusedBorder:
    UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffDEDEDE))),
    prefixIconConstraints: BoxConstraints(minWidth: 15, minHeight: 5),
    prefixIcon: Padding(
        padding: EdgeInsets.only(top: 2.0, bottom: 0),
        child: Text("\u{20B9}",
            style: TextStyle(
                fontSize: 13.5,
                fontWeight: FontWeight.w500,
                color: Color(0xff414141)))),
  );

  static InputDecoration customerCode = const InputDecoration(
      border: InputBorder.none,
      enabledBorder: InputBorder.none,
      focusedBorder: InputBorder.none);
  static InputDecoration customerCodeEdit = InputDecoration(
      border: InputBorder.none,
      enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(color: Color(0xff006BD6))),
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5.0),
          borderSide: const BorderSide(color: Color(0xff006BD6))),
      contentPadding: const EdgeInsets.only(top: 12.0, left: 10.0));
  static const InputDecoration profitPercentage = InputDecoration(
    enabledBorder:
    UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffECECEC))),
    focusedBorder:
    UnderlineInputBorder(borderSide: BorderSide(color: Color(0xffDEDEDE))),
    prefixIconConstraints: BoxConstraints(minWidth: 15, minHeight: 5),
    prefixIcon: Padding(
        padding: EdgeInsets.only(top: 0.0),
        child: Text("\u{0025}",
            style: TextStyle(
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
                color: Colors.black))),
  );
  static InputDecoration withOutLableDecoration(
      {String? label = "0", TextStyle? textStyle, Widget? suffixIcon}) {
    return InputDecoration(
        suffixIcon: suffixIcon,
        contentPadding: const EdgeInsets.only(
            top: 10.0, bottom: 11.0, left: 10.0, right: 4.0),
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xff006BD6)),
            borderRadius: BorderRadius.circular(5.0)),
        enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xffDEDEDE)),
            borderRadius: BorderRadius.circular(5.0)),
        errorBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        hintText: label,
        hintStyle: textStyle ??
            const TextStyle(
                color: Color(0xffA6A6A6),
                fontSize: 16.0,
                fontWeight: FontWeight.w400));
  }

  static InputDecoration customTdsDecoration = InputDecoration(
      prefixIconConstraints: const BoxConstraints(minWidth: 5, minHeight: 5),
      isDense: true,
      contentPadding: const EdgeInsets.only(
          top: 10.0, bottom: 10.0, left: 10.0, right: 4.0),
      border: InputBorder.none,
      focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffDEDEDE)),
          borderRadius: BorderRadius.circular(5.0)),
      enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Color(0xffDEDEDE)),
          borderRadius: BorderRadius.circular(5.0)),
      errorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffDEDEDE))),
      focusedErrorBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color(0xffDEDEDE))),
      disabledBorder: InputBorder.none,
      suffixIconConstraints: const BoxConstraints(minWidth: 5, minHeight: 5),
      suffixIcon: const Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Text("%", style: AppTextStyles.cardText1))
        ],
      ));
//custom dropdownsearch decoration
  InputDecoration dropdownSearchDecoration(
      {bool isSearching = false, String? lable}) {
    return InputDecoration(
        suffixIcon: isSearching
            ? const Padding(
          padding: EdgeInsets.all(15.0),
          child: SizedBox(
              width: 16,
              height: 16,
              child: CircularProgressIndicator(
                  color: Colors.blue, strokeWidth: 2)),
        )
            : null,
        isDense: true,
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 0.5, color: Colors.grey.shade200),
            borderRadius: BorderRadius.circular(10.0)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.0),
            borderSide: BorderSide(width: 0.5, color: Colors.grey.shade200)),
        prefixIcon: Icon(Icons.search),
        prefixIconConstraints: const BoxConstraints(
            minHeight: 10.0, minWidth: 20.0, maxHeight: 25.0, maxWidth: 35.0),
        filled: true,
        fillColor: Colors.grey.shade100,
        hintText: 'Search ${lable ?? "Here"}',
        hintStyle: AppTextStyles.cardText.copyWith(fontSize: 14.0),
        contentPadding: const EdgeInsets.all(12.0));
  }
}
