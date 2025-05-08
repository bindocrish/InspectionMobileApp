import 'package:flutter/services.dart';
import 'package:inspection_app_mobile/common_widgets/regex_helper.dart';
import 'app_decoration.dart';
import 'common_import_helper.dart';
import 'custom_tooltip.dart';
import 'dart:math' as math;
import 'custom_widget.dart';
import 'enum_constants.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(this.controller, this.labelText,
      {super.key,
        this.topPadding,
        this.bottomPadding,
        this.onTap,
        this.onTapOutside,
        this.validator,
        this.onchanged,
        this.isValidate = true,
        this.isVisible = true,
        this.isRead = false,
        this.maxline,
        this.maxLength,
        this.inputDecoration,
        this.controllerType = ControllerTypes.normal,
        this.makeCenter = false,
        this.focusNode,
        this.hintText,
        this.helperText,
        this.textStyle,
        this.obSecure = false,
        this.lableOnTop = false,
        this.capitalize = false,
        this.disable = false,
        this.isClearText = false,
        this.suggestionList = const <String>[],
        this.onEditingComplete,
        // this.onCountryChanged,
        // this.selectedCountry,
        this.textCapitalization,
        this.prefixIcon,
        this.suffix,
        this.suffixIcon});
  final TextEditingController controller;
  final String? labelText;
  final double? bottomPadding, topPadding;
  final Function? validator;
  final Function? onchanged;
  final Function()? onTap;
  final Function(dynamic)? onTapOutside;
  // final Function(Country)? onCountryChanged;
  // final Country? selectedCountry;
  final bool? isValidate, isRead, isVisible;
  final InputDecoration? inputDecoration;
  final int? maxline;
  final int? maxLength;
  final TextStyle? textStyle;
  final ControllerTypes controllerType;
  final bool makeCenter;
  final FocusNode? focusNode;
  final String? hintText;
  final String? helperText;
  final bool obSecure;
  final bool? lableOnTop;
  final bool disable;
  final bool capitalize;
  final bool isClearText;
  final List<String> suggestionList;
  final void Function()? onEditingComplete;
  final Widget? prefixIcon;
  final Widget? suffix;
  final Widget? suffixIcon;
  final TextCapitalization? textCapitalization;

  final customHelper = CustomStringHelper();
  final customWidget = CustomWidget();
  @override
  Widget build(BuildContext context) {
    TextStyle? style = textStyle ?? AppTextStyles.cardText1;
   // double bottom = bottomPadding ?? TransactionWidgets().vPadding * 2;
    return Visibility(
      visible: isVisible!,
      child: customTooltip(
        visible: isRead,
        child: Padding(
          padding: EdgeInsets.only(bottom: 10, top: topPadding ?? 0),
          child:  TextFormField(
            onTapOutside: onTapOutside,

            onTap: onTap,
            focusNode: focusNode,
            style: style.copyWith(height: 1.2),
            // style: disable || isRead!
            // ? null
            // To get the theme color using context
            //  TextStyle(
            //         color: Theme.of(context)
            //             .textTheme
            //             .bodyLarge!
            //             .color
            //             ?.withOpacity(0.38))
            //     .copyWith(height: 1.1)
            //: style.copyWith(height: 1.2),
            textCapitalization: textCapitalization ??
                (capitalize
                    ? TextCapitalization.characters
                    : TextCapitalization.none),
            controller: controller,
            minLines: (lableOnTop ?? false) ? null : 1,
            onEditingComplete: onEditingComplete,
            maxLines: maxline ?? 1,
            readOnly: disable || isRead!,
            // enabled false => isRead = true and disable = false ( or input decoration == null)
            enabled:
            !disable && !(isRead ?? false) || inputDecoration != null,
            obscureText: obSecure,
            textAlign: makeCenter ? TextAlign.center : TextAlign.start,
            validator: validator != null
                ? (value) => validator!(value)
                : (text) {
              if (isValidate!) {
                if (text!.trim().isEmpty) {
                  return "$labelText is Empty";
                } else if (controllerType ==
                    ControllerTypes.mobileNO &&
                    text.length < 10) {
                  // if (selectedCountry != null) {
                  //   Map? country = AppConstants
                  //       .countryBasedMobileNOLenList
                  //       .firstWhereOrNull((e) =>
                  //   e['code'] == selectedCountry?.code);
                  //   if (text.length != ((country?['max']) ?? 10)) {
                  //     return "Mobile number length must be ${country?['max'] ?? 10}";
                  //   }
                  // } else {
                  //   return "Please Enter a Valid Mobile No.";
                  // }
                } else if (controllerType ==
                    ControllerTypes.aadhaar &&
                    text.length != 12) {
                  return "Please Enter a Valid Aadhaar No.";
                } else if (controllerType ==
                    ControllerTypes.numberOnly &&
                    !CustomStringHelper().isCheckDouble(text)) {
                  return "Please Enter a Numeric Value.";
                } else if (controllerType ==
                    ControllerTypes.percentage &&
                    customHelper.convertToDouble(text) > 100) {
                  return "Please Enter less than 100";
                } else if (controllerType ==
                    ControllerTypes.email &&
                    !RegexHelper.isValidEmail(text)) {
                  return "The Email is invalid!";
                } else if (controllerType == ControllerTypes.pan &&
                    !RegexHelper.isValidPan(text)) {
                  return "Pan is invalid!";
                } else if (controllerType == ControllerTypes.ifsc &&
                    !RegexHelper.isValidIfsc(text)) {
                  return "IFSC is invalid!";
                } else if (controllerType ==
                    ControllerTypes.gstOnly &&
                    !RegexHelper.isValidGst(text)) {
                  return "The GSTIN is invalid!";
                } else {
                  return null;
                }
              }
              return null;
            },
            onChanged: (value) {
              onchanged == null ? null : onchanged!(value);
            },
            keyboardType: controllerType != ControllerTypes.normal
                ? textInputType(controllerType)
                : null,
            inputFormatters: controllerType != ControllerTypes.normal
                ? textFormattorType(controllerType, numLength: maxLength)
                : null,
            decoration: inputDecoration == null
                ? AppTextDecoration.textFieldDecoration(
                labelText ?? "", isValidate, hintText,
                suffixIcon: suffixIcon,
                suffix: suffix ??
                    Material(
                        color: Colors.transparent,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              suggestionList.isEmpty
                                  ? const SizedBox()
                                  : StatefulBuilder(builder:
                                  (context, stateSetter) {
                                return suggestionList.isNotEmpty
                                    ? InkWell(
                                    customBorder:
                                    const CircleBorder(),
                                  //  onTap: suggestionOnTap,
                                    child: const Padding(
                                      padding:
                                      EdgeInsets.all(5),
                                      child: Icon(
                                          Icons.filter_list,
                                          color:
                                          Colors.grey,
                                          size: 20),
                                    ))
                                    : const SizedBox();
                              }),
                              !isClearText
                                  ? const SizedBox()
                                  : StatefulBuilder(builder:
                                  (context, stateSetter) {
                                return controller
                                    .text.isNotEmpty
                                    ? InkWell(
                                    customBorder:
                                    const CircleBorder(),
                                    onTap: () {
                                      onchanged == null
                                          ? null
                                          : onchanged!("");
                                      controller.clear();
                                      stateSetter(() {});
                                    },
                                    child: const Padding(
                                      padding:
                                      EdgeInsets.all(5),
                                      child: Icon(
                                          Icons.close,
                                          size: 18,
                                          color:
                                          Colors.grey),
                                    ))
                                    : const SizedBox();
                              }),
                              const SizedBox(width: 10)
                            ])),
                prefixIcon: prefixIcon)
                : inputDecoration!,
          ),
        ),
      ),
    );
  }

// suggestion popup will show during card scan
//   void suggestionOnTap() {
//     FocusManager.instance.primaryFocus!.unfocus();
//     showDialog(
//         context: navigatorKey.currentContext!,
//         builder: (BuildContext context) {
//           return AlertDialog(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(15.0)),
//             contentPadding: const EdgeInsets.all(10),
//             content: StatefulBuilder(builder: (context, stateSetter) {
//               return Column(mainAxisSize: MainAxisSize.min, children: [
//                 Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//                   Text("Suggestions",
//                       style: AppTextStyles.cardText.copyWith(
//                           fontSize: 16.0, color: Colors.blue))
//                 ]),
//                 const SizedBox(height: 10.0),
//                 Flexible(
//                     child: SingleChildScrollView(
//                       child: Column(
//                         children: suggestionList
//                             .mapIndexed((index, element) => Padding(
//                             padding: const EdgeInsets.symmetric(vertical: 5),
//                             child: InkWell(
//                                 onTap: () {
//                                   onchanged == null ? null : onchanged!("");
//                                   controller.text = suggestionList[index];
//                                   stateSetter(() {});
//                                   Navigator.pop(context);
//                                 },
//                                 child: Container(
//                                     alignment: Alignment.centerLeft,
//                                     padding: const EdgeInsets.all(10),
//                                     decoration: BoxDecoration(
//                                         color: Colors.grey.shade100,
//                                         borderRadius: BorderRadius.circular(8)),
//                                     child: Row(children: [
//                                       Expanded(
//                                           child: Text(suggestionList[index],
//                                               style: AppTextStyles.productText
//                                                   .copyWith(fontSize: 13.0))),
//                                       Visibility(
//                                         visible: controller.text.trim() ==
//                                             suggestionList[index],
//                                         child: const Icon(Icons.check,
//                                             color: AppColors.buttonColor,
//                                             size: 20.0),
//                                       )
//                                     ])))))
//                             .toList(),
//                       ),
//                     ))
//               ]);
//             }),
//           );
//         });
//   }

// Whatsapp text form field to validate the mobile number
//   Widget whatsAppTextformField() {
//     return IntlPhoneField(
//       decoration: inputDecoration == null
//           ? AppTextDecoration.textFieldDecoration(
//           labelText ?? "", isValidate, hintText,
//           suffix: Material(
//             color: Colors.transparent,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.end,
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 suggestionList.isEmpty
//                     ? const SizedBox()
//                     : StatefulBuilder(builder: (context, stateSetter) {
//                   return suggestionList.isNotEmpty
//                       ? InkWell(
//                       customBorder: const CircleBorder(),
//                       onTap: suggestionOnTap,
//                       child: const Padding(
//                         padding: EdgeInsets.all(5),
//                         child: Icon(Icons.filter_list,
//                             color: Colors.grey, size: 20),
//                       ))
//                       : const SizedBox();
//                 }),
//                 !isClearText
//                     ? const SizedBox()
//                     : StatefulBuilder(builder: (context, stateSetter) {
//                   return controller.text.isNotEmpty
//                       ? InkWell(
//                       customBorder: const CircleBorder(),
//                       onTap: () {
//                         onchanged == null ? null : onchanged!("");
//                         controller.clear();
//                         stateSetter(() {});
//                       },
//                       child: const Padding(
//                         padding: EdgeInsets.all(5),
//                         child: Icon(Icons.close,
//                             size: 18, color: Colors.grey),
//                       ))
//                       : const SizedBox();
//                 }),
//                 const SizedBox(width: 10)
//               ],
//             ),
//           ),
//           prefixIcon: prefixIcon)
//           : inputDecoration!,
//       initialCountryCode: selectedCountry?.code ?? "IN",
//       controller: controller,
//       disableLengthCheck: true,
//       flagsButtonMargin: const EdgeInsets.all(8),
//       flagsButtonPadding: const EdgeInsets.only(left: 5),
//       dropdownIconPosition: IconPosition.trailing,
//       dropdownIcon: const Icon(Icons.arrow_drop_down, color: Colors.grey),
//       dropdownTextStyle: AppTextStyles.cardText1,
//       inputFormatters: controllerType != ControllerTypes.normal
//           ? textFormattorType(controllerType, numLength: maxLength)
//           : null,
//       validator: (p0) async {
//         var contactCountry =
//         countries.firstWhereOrNull((e) => e.code == p0?.countryISOCode);
//         if (contactCountry != null &&
//             ((p0!.number.length >= contactCountry.minLength) &&
//                 p0.number.length <= contactCountry.maxLength)) {
//           return null;
//         } else {
//           return "Invalid mobile number";
//         }
//       },
//       dropdownDecoration: BoxDecoration(
//           color: Colors.grey.shade200,
//           borderRadius: BorderRadius.circular(5.0)),
//       pickerDialogStyle: PickerDialogStyle(backgroundColor: Colors.white),
//       onCountryChanged: (value) {
//         onCountryChanged!(value);
//       },
//       onChanged: (phone) {
//         if (onchanged != null) {
//           onchanged!(phone.number);
//         }
//       },
//     );
//   }
}

class CustomSearchTextFormField extends StatelessWidget {
  const CustomSearchTextFormField(
      this.controller, {
        super.key,
        this.onchanged,
        this.onsaved,
        this.isWhiteAppBar = false,
        this.isLoading = false,
        this.onClose,
        this.focusNode,
      });
  final TextEditingController controller;
  final Function? onchanged;
  final Function? onsaved;
  final FocusNode? focusNode;
  final bool isWhiteAppBar, isLoading;
  final Function()? onClose;

  @override
  Widget build(BuildContext context) {
    if (isWhiteAppBar) {
      return Padding(
        padding: const EdgeInsets.only(right: 10),
        child: TextFormField(
          focusNode: focusNode,
          controller: controller,
          onChanged: (value) {
            onchanged == null ? null : onchanged!(value);
          },
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              hintText: 'Search',
              isDense: true,
              contentPadding: const EdgeInsets.fromLTRB(15, 8, 10, 8),
              hintStyle: AppTextStyles.cardText.copyWith(
                  color: Colors.grey.shade400, fontWeight: FontWeight.w400),
              fillColor: Colors.white30,
              filled: true,
              enabledBorder: OutlineInputBorder(
                  borderSide:  BorderSide(color: Colors.grey.shade200),
                  borderRadius: BorderRadius.circular(30.0)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide:  BorderSide(color: Colors.grey.shade200)),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              suffixIconConstraints: const BoxConstraints(maxHeight: 35),
              suffixIcon: Padding(
                padding: const EdgeInsets.only(right: 5),
                child: Visibility(
                  visible: !isLoading,
                  replacement: const Padding(
                    padding: EdgeInsets.all(5.0),
                    child: SizedBox(
                        width: 16,
                        height: 16,
                        child: CircularProgressIndicator(
                          color: Colors.blue,
                          strokeWidth: 2,
                        )),
                  ),
                  child: InkWell(
                      customBorder: const CircleBorder(),
                      onTap: onClose,
                      child: const Padding(
                        padding: EdgeInsets.all(5.0),
                        child: Icon(Icons.close, size: 18),
                      )),
                ),
              )),
        ),
      );
    } else {
      return TextField(
        focusNode: focusNode,
        cursorColor: const Color(0xFFDDDDDD),
        controller: controller,
        style: const TextStyle(
            color: Colors.white, fontSize: 18, decorationColor: Colors.white),
        onChanged: (value) {
          onchanged == null ? null : onchanged!(value);
        },
        decoration: const InputDecoration(
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white60),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white60),
          ),
          prefixIcon: Icon(Icons.search, color: Colors.white),
          hintText: "Search Here",
          hintStyle: TextStyle(color: Colors.white54, fontSize: 18),
        ),
      );
    }
  }
}


Widget dateTextField(TextEditingController controller, String labelText,
    Function onTap1, Function onTap2,
    {double? bottomPadding,
      double? topPadding,
      InputDecoration? inputDecoration,
      bool? isValidate = false,
      bool isVisible = true,
      Icon? icon,
      String? svgPath}) {
  double bottom = 10;
  return Visibility(
    visible: isVisible,
    child: Padding(
      padding: EdgeInsets.only(bottom: bottom, top: topPadding ?? 0),
      child: Row(children: [
        Expanded(
            child: InkWell(
                onTap: () {
                  //for close the keyboard
                  FocusManager.instance.primaryFocus?.unfocus();
                  onTap1();
                },
                child: AbsorbPointer(
                    child: TextFormField(
                        readOnly: true,
                        controller: controller,
                        style: AppTextStyles.cardText1,
                        validator: (value) {
                          if (isValidate!) {
                            if (value!.isEmpty) {
                              return "$labelText is empty";
                            }
                          }
                          return null;
                        },
                        onTap: () {
                          //for close the keyboard
                          FocusManager.instance.primaryFocus?.unfocus();
                          onTap2();
                        },
                        decoration: inputDecoration ??
                            InputDecoration(
                              errorStyle: const TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                              hoverColor: Colors.green,
                              enabledBorder: OutlineInputBorder(
                                borderSide:  BorderSide(
                                  color:Colors.orange.shade200,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: const BorderSide(
                                  color: Color(0xff006BD6),
                                ),
                              ),
                              errorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: const BorderSide(
                                  color: Color(0xffDEDEDE),
                                ),
                              ),
                              focusedErrorBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                                borderSide: const BorderSide(
                                  color: Color(0xffDEDEDE),
                                ),
                              ),
                              // labelText: labelText,
                              labelStyle: const TextStyle(
                                color: Color(0xffA6A6A6),
                                fontSize: 14.5,
                                fontWeight: FontWeight.w400,
                              ),
                              label: RichText(
                                  text: TextSpan(
                                      text: labelText,
                                      style: const TextStyle(
                                        color: Color(0xffA6A6A6),
                                        fontSize: 14.5,
                                        fontWeight: FontWeight.w400,
                                      ),
                                      children: [
                                        if (isValidate!)
                                          const TextSpan(
                                              text: ' *',
                                              style: TextStyle(
                                                  color: Colors.red,
                                                  fontWeight: FontWeight.w400,
                                                  fontSize: 14.5))
                                      ])),
                              hintText: "",
                              enabled: true,
                              focusColor: Colors.lightBlue,
                              contentPadding:
                              const EdgeInsets.fromLTRB(12, 0, 0, 0),
                              suffixIcon: Transform.scale(
                                scale: .35,
                                child: Icon(Icons.calendar_month),
                              ),
                              fillColor: const Color(0xFFEEEEFF),
                            )))))
      ]),
    ),
  );
}

List<TextInputFormatter> textFormattorType(ControllerTypes type,
    {int? numLength}) {
  if (type == ControllerTypes.tamil) {
    return [TamilInputFormatter()];
  } else if (type == ControllerTypes.numberOnly) {
    return [
      FilteringTextInputFormatter.allow(RegExp(r'^(\d+)?' r'\.?\d{0,5}')),
      LengthLimitingTextInputFormatter(numLength ?? 15),
    ];
  } else if (type == ControllerTypes.realNumber) {
    return [
      LengthLimitingTextInputFormatter(15),
      FilteringTextInputFormatter.allow(RegExp(r'^\-*(\d+)?' r'\.?\d{0,5}')),
    ];
  } else if (type == ControllerTypes.mobileNO) {
    return [
      LengthLimitingTextInputFormatter(12),
      FilteringTextInputFormatter.allow(RegExp("[0-9]"))
    ];
  } else if (type == ControllerTypes.aadhaar) {
    return [
      LengthLimitingTextInputFormatter(12),
      FilteringTextInputFormatter.allow(RegExp("[0-9]"))
    ];
  } else if (type == ControllerTypes.percentage) {
    return [
      LengthLimitingTextInputFormatter(5),
      FilteringTextInputFormatter.allow(RegExp("[0-9]"))
    ];
  } else if (type == ControllerTypes.pinCode) {
    return [
      LengthLimitingTextInputFormatter(8),
      FilteringTextInputFormatter.allow(RegExp("[0-9]"))
    ];
  } else if (type == ControllerTypes.accountNumber) {
    return [
      LengthLimitingTextInputFormatter(18),
      FilteringTextInputFormatter.allow(RegExp("[0-9]"))
    ];
  } else if (type == ControllerTypes.ifsc) {
    return [
      LengthLimitingTextInputFormatter(11),
      UpperCaseTextFormatter(),
    ];
  } else if (type == ControllerTypes.gstOnly) {
    return [
      LengthLimitingTextInputFormatter(15),
    ];
  } else if (type == ControllerTypes.age) {
    return [
      LengthLimitingTextInputFormatter(3),
      FilteringTextInputFormatter.allow(RegExp("[0-9]"))
    ];
  } else if (type == ControllerTypes.address) {
    return [LengthLimitingTextInputFormatter(120)];
  } else {
    return [];
  }
}

TextInputType? textInputType(ControllerTypes type) {
  if (type == ControllerTypes.numberOnly) {
    return const TextInputType.numberWithOptions(decimal: true);
  } else if (type == ControllerTypes.realNumber) {
    return const TextInputType.numberWithOptions(decimal: true);
  } else if (type == ControllerTypes.mobileNO) {
    return const TextInputType.numberWithOptions(decimal: false);
  } else if (type == ControllerTypes.aadhaar) {
    return const TextInputType.numberWithOptions(decimal: false);
  } else if (type == ControllerTypes.accountNumber) {
    return const TextInputType.numberWithOptions(decimal: false);
  } else if (type == ControllerTypes.pinCode) {
    return const TextInputType.numberWithOptions(decimal: false);
  } else if (type == ControllerTypes.percentage) {
    return const TextInputType.numberWithOptions(decimal: true);
  } else if (type == ControllerTypes.age) {
    return const TextInputType.numberWithOptions(decimal: false);
  }
  return null;
}

// class CustomTagField {
//   Widget getTagWidgetEmail({
//     required BuildContext context,
//     required GlobalKey<TagsState> key,
//     required String label,
//     required List items,
//     Color? enabledBorderColor,
//     Color? focusedBorderColor,
//     TextStyle? textStyle,
//     double? leftPadding,
//     bool showToolTip = true,
//     required String Function(dynamic v) display,
//     required Function(String v) onSubmitted,
//     required Function(int i) onRemoved,
//     bool showAvatar = true,
//     bool isReadOnly = false,
//     FocusNode? focusNode,
//   }) {
//     return IgnorePointer(
//       ignoring: isReadOnly,
//       child: Tags(
//         key: key,
//         alignment: WrapAlignment.start,
//         columns: 6,
//         runSpacing: .1,
//         spacing: 2,
//         textField: TagsTextField(
//           hintText: label,
//           hintTextColor: Colors.grey,
//           focusNode: focusNode,
//           autofocus: false,
//           padding: EdgeInsets.zero,
//           inputDecoration: InputDecoration(
//             constraints: const BoxConstraints(maxHeight: 40),
//             hoverColor: Colors.green,
//             enabledBorder: UnderlineInputBorder(
//               borderSide: BorderSide(
//                   color: enabledBorderColor ?? const Color(0xffECECEC)),
//             ),
//             focusedBorder: UnderlineInputBorder(
//               borderSide: BorderSide(
//                   color: focusedBorderColor ?? const Color(0xff006BD6)),
//             ),
//             border: InputBorder.none,
//             labelStyle: textStyle ??
//                 const TextStyle(
//                     color: Color(0xffA6A6A6),
//                     fontSize: 16.0,
//                     fontWeight: FontWeight.w400),
//             hintText: "",
//             errorStyle: const TextStyle(
//                 fontSize: 14, color: Colors.red, fontWeight: FontWeight.w400),
//             contentPadding: EdgeInsets.only(left: leftPadding ?? 5.0),
//           ),
//           textStyle: AppTextStyles.productText
//               .copyWith(fontSize: 13.0, color: Colors.grey),
//           onSubmitted: onSubmitted,
//         ),
//         itemCount: items.length,
//         itemBuilder: (int index) {
//           return customWidget.composeChipWidget(
//             text: items[index],
//             index: index,
//             onClosePressed: () {
//               onRemoved(index);
//             },
//           );
//           // tagChip != null
//           //     ? tagChip(index)
//           //     : ItemTags(
//           //         elevation: 0.0,
//           //         pressEnabled: false,
//           //         index: index,
//           //         title: display(items[index]),
//           //         textStyle: const TextStyle(fontSize: 14.5),
//           //         image: showAvatar
//           //             ? ItemTagsImage(
//           //                 child: CircleAvatar(
//           //                 radius: 8,
//           //                 backgroundColor: const Color(0xFFDDE7FF),
//           //                 child: Text(
//           //                   customHelper.nameLabel(display(items[index])),
//           //                   style: const TextStyle(
//           //                       fontSize: 12,
//           //                       fontWeight: FontWeight.w500,
//           //                       color: AppColors.buttonColor),
//           //                 ),
//           //               ))
//           //             : null,
//           //         highlightColor: AppColors.buttonColor,
//           //         activeColor: AppColors.buttonColor,
//           //         combine: ItemTagsCombine.withTextAfter,
//           //         removeButton: ItemTagsRemoveButton(
//           //           margin: const EdgeInsets.only(left: 10.0),
//           //           size: 10,
//           //           backgroundColor: Colors.white,
//           //           color: Colors.black54,
//           //           onRemoved: () {
//           //             onRemoved(index);
//           //             return true;
//           //           },
//           //         ),
//           //       );
//         },
//       ),
//     );
//   }
// }

//  class CustomAutoComplete {
//   Widget autoComplete<T extends Object>({
//     required TextEditingController controller,
//     required List<T> suggestions,
//     required Function(T v) onSelected,
//     required bool Function(T v, String text) filter,
//     required String Function(T v) textToDisplay,
//     Widget Function(String t)? itemView,
//     Function(String t)? onTextChanged,
//     Function()? onPressedAddButton,
//     Widget? suffixIcon,
//     String label = "",
//     bool isValidate = false,
//     bool hideOnEmpty = false,
//     bool isReadOnly = false,
//     bool isClearText = false,
//     bool isShowExistingFlag = false,
//     List<String> suggestionList = const <String>[],
//     Future<List<T>?> Function(String?)? suggestionsCallback,
//     String? heading,
//     InputDecoration? inputDecoration,
//   }) {
//     void suggestionOnTap() {
//       FocusManager.instance.primaryFocus!.unfocus();
//       showDialog(
//           context: navigatorKey.currentContext!,
//           builder: (BuildContext context) {
//             return AlertDialog(
//               shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(15.0)),
//               contentPadding: const EdgeInsets.all(10),
//               content: StatefulBuilder(builder: (context, stateSetter) {
//                 return SizedBox(
//                     width: MediaQuery.of(context).size.width * 0.8,
//                     child: Column(mainAxisSize: MainAxisSize.min, children: [
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Text("Suggestions",
//                               style: AppTextStyles.cardText.copyWith(
//                                   fontSize: 16.0, color: AppColors.buttonColor))
//                         ],
//                       ),
//                       const SizedBox(height: 10.0),
//                       Flexible(
//                           child: SingleChildScrollView(
//                               child: Column(
//                                 children: suggestionList
//                                     .mapIndexed((index, element) => Padding(
//                                     padding:
//                                     const EdgeInsets.symmetric(vertical: 5),
//                                     child: InkWell(
//                                         onTap: () {
//                                           controller.text = suggestionList[index];
//                                           onTextChanged != null
//                                               ? onTextChanged(suggestionList[index])
//                                               : null;
//                                           stateSetter(() {});
//                                           Navigator.pop(context);
//                                         },
//                                         child: Container(
//                                             alignment: Alignment.centerLeft,
//                                             padding: const EdgeInsets.all(10.0),
//                                             decoration: BoxDecoration(
//                                                 color: Colors.grey.shade100,
//                                                 borderRadius:
//                                                 BorderRadius.circular(8)),
//                                             child: Row(children: [
//                                               Expanded(
//                                                   child: Text(
//                                                     suggestionList[index],
//                                                     style: AppTextStyles.productText
//                                                         .copyWith(fontSize: 13.0),
//                                                   )),
//                                               Visibility(
//                                                   visible: controller.text.trim() ==
//                                                       suggestionList[index],
//                                                   child: const Icon(Icons.check,
//                                                       size: 20.0,
//                                                       color: AppColors.buttonColor))
//                                             ])))))
//                                     .toList(),
//                               )))
//                     ]));
//               }),
//             );
//           });
//     }
//
//     return customTooltip(
//       visible: isReadOnly,
//       message: "This field is not editable",
//       child: TypeAheadField(
//         controller: controller,
//         onSelected: onSelected,
//         hideOnEmpty: hideOnEmpty,
//         debounceDuration: const Duration(milliseconds: 300),
//         builder: (context, controller, focusNode) {
//           return Row(
//             children: [
//               Expanded(
//                 child: TextFormField(
//                     controller: controller,
//                     focusNode: focusNode,
//                     enabled: !isReadOnly,
//                     validator: (value) {
//                       if ((value ?? "").trim().isEmpty && isValidate) {
//                         return "$label is Empty";
//                       } else {
//                         return null;
//                       }
//                     },
//                     decoration: inputDecoration ??
//                         AppTextDecoration.textFieldDecoration(
//                             label, isValidate, null)
//                             .copyWith(
//                             suffixIcon: suffixIcon ??
//                                 Material(
//                                   color: Colors.transparent,
//                                   child: Row(
//                                     mainAxisSize: MainAxisSize.min,
//                                     mainAxisAlignment:
//                                     MainAxisAlignment.end,
//                                     children: [
//                                       suggestionList.isNotEmpty &&
//                                           !isReadOnly
//                                           ? InkWell(
//                                           customBorder:
//                                           const CircleBorder(),
//                                           onTap: suggestionOnTap,
//                                           child: const Padding(
//                                             padding: EdgeInsets.all(5),
//                                             child: Icon(
//                                                 Icons.filter_list,
//                                                 size: 20,
//                                                 color: Colors.grey),
//                                           ))
//                                           : const SizedBox(),
//                                       !isClearText || isReadOnly
//                                           ? const SizedBox()
//                                           : StatefulBuilder(builder:
//                                           (context, stateSetter) {
//                                         return controller
//                                             .text.isNotEmpty
//                                             ? InkWell(
//                                             customBorder:
//                                             const CircleBorder(),
//                                             onTap: () {
//                                               controller.clear();
//                                               stateSetter(() {});
//                                             },
//                                             child: const Padding(
//                                               padding:
//                                               EdgeInsets.all(
//                                                   5),
//                                               child: Icon(
//                                                   Icons.close,
//                                                   size: 18,
//                                                   color: Colors
//                                                       .grey),
//                                             ))
//                                             : const SizedBox();
//                                       }),
//                                       controller.text.isNotEmpty &&
//                                           isShowExistingFlag &&
//                                           suggestions
//                                               .where((T d) {
//                                             if (hideOnEmpty &&
//                                                 controller
//                                                     .text.isEmpty) {
//                                               return false;
//                                             } else {
//                                               return controller.text
//                                                   .trim()
//                                                   .toLowerCase() ==
//                                                   textToDisplay(d)
//                                                       .toLowerCase();
//                                             }
//                                           })
//                                               .toList()
//                                               .isEmpty
//                                           ? Container(
//                                         margin: const EdgeInsets.only(
//                                             right: 10, left: 5),
//                                         padding: const EdgeInsets
//                                             .symmetric(
//                                             horizontal: 5,
//                                             vertical: 1),
//                                         decoration: BoxDecoration(
//                                             borderRadius:
//                                             BorderRadius.circular(
//                                                 3.0),
//                                             color: const Color(
//                                                 0xff79d3ec),
//                                             border: Border.all(
//                                                 color: const Color(
//                                                     0xff79d3ec),
//                                                 width: 0.3)),
//                                         child: Text("New",
//                                             style: AppTextStyles
//                                                 .projectTaskLableStyle
//                                                 .copyWith(
//                                                 color: Colors
//                                                     .white)),
//                                       )
//                                           : Visibility(
//                                         visible: controller
//                                             .text.isNotEmpty &&
//                                             isShowExistingFlag,
//                                         child: Container(
//                                           margin:
//                                           const EdgeInsets.only(
//                                               right: 10, left: 5),
//                                           padding: const EdgeInsets
//                                               .symmetric(
//                                               horizontal: 10,
//                                               vertical: 3),
//                                           decoration: BoxDecoration(
//                                               borderRadius:
//                                               BorderRadius
//                                                   .circular(3.0),
//                                               border: Border.all(
//                                                   color: const Color(
//                                                       0xffe67e22),
//                                                   width: 0.5)),
//                                           child: const Text(
//                                             "Existing",
//                                             style: TextStyle(
//                                                 fontSize: 12,
//                                                 color: Color(
//                                                     0xffe67e22)),
//                                           ),
//                                         ),
//                                       ),
//                                       const SizedBox(width: 10)
//                                     ],
//                                   ),
//                                 )),
//                     onChanged: onTextChanged),
//               ),
//               SizedBox(width: onPressedAddButton != null ? 8 : 0),
//               if (onPressedAddButton != null)
//                 Container(
//                   height: 48,
//                   width: 48,
//                   decoration: AppTextDecoration.addButtonDecoration,
//                   child: Material(
//                     borderRadius: BorderRadius.circular(5.0),
//                     color: Colors.transparent,
//                     child: InkWell(
//                       borderRadius: BorderRadius.circular(5.0),
//                       onTap: isReadOnly ? null : onPressedAddButton,
//                       child: const Icon(Icons.add, color: Colors.black54),
//                     ),
//                   ),
//                 )
//             ],
//           );
//         },
//
//         suggestionsCallback: suggestionsCallback ??
//                 (pattern) async {
//               await Future.delayed(const Duration(milliseconds: 500));
//               return suggestions.where((T d) {
//                 if (hideOnEmpty && pattern.isEmpty) {
//                   return false;
//                 } else {
//                   return filter(d, pattern.trim().toLowerCase());
//                 }
//               }).toList();
//             },
//         loadingBuilder: (context) {
//           return CustomWidget().customCircularLoading();
//         },
//
//         itemBuilder: (context, T suggestion) {
//           if (itemView != null) {
//             return itemView(textToDisplay(suggestion));
//           } else {
//             return ListTile(
//               tileColor: Colors.white,
//               title: Text(textToDisplay(suggestion),
//                   style: AppTextStyles.cardText1),
//             );
//           }
//         },
//         // emptyBuilder: (context) => const Text("No Item Found!"),
//         listBuilder: (context, children) {
//           List<Widget> itemList = children;
//           bool isDisableLazyLoading = children.length % AppConstants.limit != 0;
//           bool showLoading = false;
//           return StatefulBuilder(builder: (context, setState) {
//             return LazyLoadScrollView(
//               onEndOfPage: () async {
//                 if (suggestionsCallback != null && !isDisableLazyLoading) {
//                   showLoading = true;
//                   isDisableLazyLoading = true;
//                   setState(() {});
//                   List<Widget> moreData =
//                   ((await suggestionsCallback(null)) ?? [])
//                       .map((e) => ListTile(
//                     tileColor: Colors.white,
//                     title: Text(textToDisplay(e),
//                         style: AppTextStyles.cardText1),
//                   ))
//                       .toList();
//                   itemList.addAll(moreData);
//                   showLoading = false;
//                   isDisableLazyLoading =
//                       children.length % AppConstants.limit != 0;
//                   setState(() {});
//                 }
//               },
//               child: SingleChildScrollView(
//                 child: Column(
//                   children: [
//                     Container(
//                         decoration: const BoxDecoration(
//                             color: Color(0xffF2F2F2),
//                             border: Border(
//                                 bottom: BorderSide(
//                                   color: Color(0xFFE9E9E9),
//                                 ))),
//                         child: Padding(
//                             padding:
//                             const EdgeInsets.only(top: 15.0, bottom: 15.0),
//                             child: Row(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(heading ?? "",
//                                       style: AppTextStyles.cardText)
//                                 ]))),
//                     ...itemList,
//                     if (showLoading) const CupertinoActivityIndicator()
//                   ],
//                 ),
//               ),
//             );
//           });
//         },
//         // suggestions dilog box decoration
//         // decorationBuilder: (context, child) => DecoratedBox(
//         //   decoration: BoxDecoration(
//         //     color:Colors.red,
//         //     border: Border.all(
//         //       color: CupertinoDynamicColor.resolve(
//         //         CupertinoColors.systemGrey4,
//         //         context,
//         //       ),
//         //       width: 1,
//         //     ),
//         //     borderRadius:  BorderRadius.circular(10),
//         //   ),
//         //   child: child,
//         // ),
//       ),
//     );
//   }
// }

// custom address text field
class CustomAddressTextFormField extends StatelessWidget {
  const CustomAddressTextFormField({
    required this.controller,
    this.labelText,
    super.key,
    this.validator,
    this.onchanged,
    this.isValidate = true,
    this.isRead = false,
    this.maxline,
    this.makeCenter = false,
    this.hintText,
    this.textStyle,
    this.lableOnTop = false,
    this.onSelectAddress,
    this.shippingAddress = const [],
    this.onTap,
    this.expandField = false,
  });
  final TextEditingController controller;
  final String? labelText;
  final Function? validator;
  final Function? onchanged;
  final bool? isValidate, isRead;
  final int? maxline;
  final TextStyle? textStyle;
  final bool makeCenter;
  final String? hintText;
  final bool? lableOnTop;
  final Function? onSelectAddress;
  final List shippingAddress;
  final Function()? onTap;
  final bool expandField;
  // final scrollController = ScrollController(); // may need in future

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: CustomWidget().customScrollbar(
          // controller: scrollController,
            child: Stack(children: [
              TextFormField(
                // scrollController: scrollController,
                  style: textStyle ?? AppTextStyles.cardText1,
                  controller: controller,
                  minLines: expandField
                      ? maxline
                      : (lableOnTop ?? false)
                      ? null
                      : 1,
                  maxLines: maxline ?? 1,
                  readOnly: isRead!,
                  textAlign: makeCenter ? TextAlign.center : TextAlign.start,
                  validator: (text) {
                    if (isValidate!) {
                      if (text!.trim().isEmpty) {
                        return "$labelText is empty";
                      } else {
                        return null;
                      }
                    }
                    return null;
                  },
                  onChanged: (value) {
                    onchanged == null ? null : onchanged!(value);
                  },
                  decoration: AppTextDecoration.textFieldDecoration(
                      labelText ?? '', isValidate, hintText)),
              Positioned(
                  right: 0,
                  child: Visibility(
                      visible: shippingAddress.length > 1,
                      child: Material(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(20.0),
                          child: InkWell(
                              borderRadius: BorderRadius.circular(20.0),
                              onTap: onTap,
                              child:
                              const Row(mainAxisSize: MainAxisSize.min, children: [
                                Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child:
                                    Icon(Icons.edit, color: Colors.blue))
                              ])))))
            ])));
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class TamilInputFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    final filteredText =
    newValue.text.replaceAll(RegExp(r'[^\u0B80-\u0BFF]'), '');
    int calculateTotalCount = newValue.text.length - filteredText.length;
    int baseOffset = math.min(filteredText.length,
        newValue.selection.baseOffset - calculateTotalCount);
    int extentOffset = math.min(filteredText.length,
        newValue.selection.extentOffset - calculateTotalCount);

    return TextEditingValue(
      text: filteredText,
      selection: newValue.selection.copyWith(
        baseOffset: baseOffset,
        extentOffset: extentOffset,
      ),
    );
  }
}
