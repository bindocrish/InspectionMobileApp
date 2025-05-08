// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter_svg/svg.dart';
//
// import 'app_decoration.dart';
// import 'asset_path_constants.dart';
// import 'common_import_helper.dart';
// import 'custom_tooltip.dart';
// import 'drodown_decoration_constant.dart';
// import 'enum_constants.dart';
//
// /// This is custom dropdown with search option,
// ///  this will find the model or data type of the parameter automatically
// Widget dropDown<T extends Object>({
//   /// This String is used as the label for the dropdown
//   required String labelText,
//
//   /// for bottom field padding (Divider)
//   double? topPadding,
//   double? bottomPadding,
//   double? iconPadding,
//   bool isDense = true,
//   bool? isNew,
//   String? toolTipMsg,
//
//   /// list items for the dropdown
//   required List<T> items,
//
//   /// used to store the selected value
//   required T? selectedValue,
//
//   ///Text to display on list and on field from model
//   required String Function(T? v) itemAsString,
//
//   /// To handle the event when user taps on dropdown item
//   void Function(T? v)? onchanged,
//
//   /// Custom bottom sheet when user clicked on dropdown
//   void Function()? customPopUp,
//
//   /// Used to handle the dropdown value clearing
//   void Function()? onCleared,
//
//   /// Ontap function for the add button
//   void Function()? onPressedAddButton,
//
//   /// onTap function for the reset button
//   void Function()? onPressedResetButton,
//
//   /// Custom widget instad of the Add button
//   Widget? customAddButton,
//
//   // void Function(T? v)? onCleared,
//   /// Custom validator to validate the dropdown
//   String? Function(dynamic v)? validator,
//
//   /// Custom title for the dialog and bottom sheet
//   String? sheetTitle,
//
//   /// Used to check, its required or not
//   bool isValidate = true,
//
//   /// Used to show or hide the field
//   bool isVisible = true,
//
//   /// Used to show hide the search box in dropdown
//   bool isSearchBox = false,
//
//   /// Used to make the field is editable or not
//   bool isReadOnly = false,
//
//   /// Used to show in bottomsheet or dialog
//   bool isBottomMenu = false,
//
//   /// Used to show selected value bottomsheet or dialog
//   bool showSelectedItem = true,
//
//   /// Used to show clear button in dropdown field
//   bool showClearBtn = false,
//
//   /// Used to show or hide the add button
//   bool showAddButton = true,
//
//   /// Custom textfield decoration
//   DropdownDecoration decorationType = DropdownDecoration.normal,
//
//   /// Custom padding for the text
//   EdgeInsetsGeometry? contentPading,
//
//   /// Custom suffix icon shown in text field
//   Widget? suffixIcon,
//
//   /// Custom Padding for the dropdown field
//   // EdgeInsets? padding = const EdgeInsets.only(top: 10, bottom: 4),
//   EdgeInsets? padding = EdgeInsets.zero,
// }) {
//   double bottom =  20;
//   bool showAddBtn =
//       showAddButton && (customAddButton != null || onPressedAddButton != null);
//   bool showResetButton = onPressedResetButton != null;
//   return Visibility(
//     visible: isVisible,
//     child: customTooltip(
//         message: toolTipMsg ?? "This field is not editable",
//         visible: isReadOnly,
//         child: Padding(
//             padding: EdgeInsets.only(bottom: bottom, top: topPadding ?? 0),
//             child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               Expanded(
//                 child: Theme(
//                     data: ThemeData(
//                         colorScheme: const ColorScheme.light(
//                             surface: Colors.white, primary: Colors.white),
//                         textTheme: const TextTheme(
//                           titleMedium: TextStyle(
//                             fontSize: 13.5,
//                             fontWeight: FontWeight.w500,
//                             color: Color(0xff414141),
//                           ),
//                         )),
//                     child: DropdownSearch<T?>(
//                       key: GlobalKey<DropdownSearchState<String>>(),
//                       popupProps: _customPoupProps<T>(
//                           isBottomMenu,
//                           isSearchBox,
//                           itemAsString,
//                           sheetTitle ?? labelText,
//                           showSelectedItem),
//
//                       // dropdownButtonBuilder: (_) => Padding(
//                       //   padding: const EdgeInsets.only(right: 8.0),
//                       //   child: Icon(Icons.arrow_drop_down, color: Colors.grey),
//                       // ),
// decoratorProps: DropDownDecoratorProps(
//     baseStyle: const TextStyle(
//         overflow: TextOverflow.ellipsis,
//         fontSize: 13.5,
//         fontWeight: FontWeight.w500,
//         color: Color(0xff414141)),
//
//                           // dropdownSearchDecoration: customDropdownDecoration(
//                           //     type: decorationType,
//                           //     labelText: labelText,
//                           //     isDense: isDense,
//                           //     isValidate: isValidate,
//                           //     contentPading: contentPading,
//                           //     suffixIcon: suffixIcon)
// ),
//                       autoValidateMode: AutovalidateMode.onUserInteraction,
//                       enabled: !isReadOnly,
//                       selectedItem: selectedValue,
//                       // This is used for custom search
//                       filterFn: (item, filter) {
//                         return filter.toString().isEmpty || item == null
//                             ? true
//                             : itemAsString(item)
//                             .toString()
//                             .toLowerCase()
//                             .contains(filter.toString().toLowerCase());
//                       },
//
//                       // clearButtonProps: ClearButtonProps(
//                       //     isVisible: (showClearBtn || isNew != null) &&
//                       //         selectedValue != null,
//                       //     onPressed: isNew == null ? onCleared : () {},
//                       //     //Model based
//                       //     //   onPressed: () {
//                       //     //   if (onCleared != null) {
//                       //     //     onCleared(selectedValue);
//                       //     //   }
//                       //     // },
//                       //     splashColor:
//                       //     isNew == null ? null : Colors.transparent,
//                       //     highlightColor:
//                       //     isNew == null ? null : Colors.transparent,
//                       //     iconSize: 0,
//                       //     padding: EdgeInsets.zero,
//                       //     constraints:
//                       //     BoxConstraints(maxWidth: isNew == null ? 10 : 85),
//                       //     icon: isNew == null
//                       //         ? const Icon(Icons.close)
//                       //         : Transform.translate(
//                       //         offset: const Offset(10, 0),
//                       //         child: _newExistingWidget(isNew))),
//                       itemAsString: itemAsString,
//                       items: items,
//                       // This function is used to highlight the selected item
//                       compareFn: (item1, item2) {
//                         return item1 == null || item2 == null
//                             ? false
//                             : itemAsString(item1).toString() ==
//                             itemAsString(item2).toString();
//                       },
//                       validator: validator == null
//                           ? (text) {
//                         if (isValidate) {
//                           if (text == null) {
//                             return "Please Select $labelText";
//                           }
//                         }
//                         return null;
//                       }
//                           : (text) {
//                         return validator(text);
//                       },
//                       onChanged: onchanged,
//                       onBeforePopupOpening: customPopUp != null
//                           ? (selectedItem) async {
//                         //for close the keyboard
//                         FocusManager.instance.primaryFocus?.unfocus();
//                         customPopUp();
//                         return false;
//                       }
//                           : (v) async {
//                         //for close the keyboard
//                         FocusManager.instance.primaryFocus?.unfocus();
//                         return true;
//                       },
//                     )),
//               ),
//               SizedBox(width: showAddBtn || showResetButton ? 8 : 0),
//               if (showResetButton)
//                 GestureDetector(
//                     onTap: onPressedResetButton,
//                     child: Container(
//                         decoration: BoxDecoration(
//                             border: Border.all(color: Colors.blue),
//                             color: const Color(0xffE6F1FC).withOpacity(0.4),
//                             borderRadius: BorderRadius.circular(5)),
//                         child: Padding(
//                             padding: const EdgeInsets.all(6.5),
//                             child: SvgPicture.asset(AssetsPath.reset,
//                                 height: 20,
//                                 width: 20,
//                                 colorFilter: const ColorFilter.mode(
//                                     Colors.blue, BlendMode.srcIn))))),
//               if (showAddBtn && !showResetButton)
//                 customAddButton ??
//                     Container(
//                       height: 48,
//                       width: 48,
//                       decoration: AppTextDecoration.addButtonDecoration,
//                       child: Material(
//                         borderRadius: BorderRadius.circular(5.0),
//                         color: Colors.transparent,
//                         child: InkWell(
//                           borderRadius: BorderRadius.circular(5.0),
//                           onTap: onPressedAddButton,
//                           child: const Icon(Icons.add, color: Colors.black54),
//                         ),
//                       ),
//                     )
//             ]))),
//   );
// }
//
// PopupProps<T?> _customPoupProps<T extends Object>(
//     bool isbottomMenu,
//     bool isShowSearchBox,
//     Function? itemAsString,
//     String lableText,
//     bool showSelectedItem) {
//   if (!isbottomMenu) {
//     return PopupProps<T?>.menu(
//       showSelectedItems: showSelectedItem,
//       // This is used to change the text style of the dropdown element
//       itemBuilder: showSelectedItem
//           ? null
//           : (context, item, isSelected) {
//         return isSelected // Selected Item decoration
//             ? Container(
//           padding: const EdgeInsets.all(15),
//           color: isSelected ? Colors.grey.shade100 : null,
//           child: Text(
//             itemAsString!(item).toString(),
//             style: const TextStyle(color: AppColors.buttonColor),
//           ),
//         )
//             : Padding(
//           padding: const EdgeInsets.all(15),
//           child: Text(
//             itemAsString!(item).toString(),
//             style: const TextStyle(
//               fontSize: 14.5,
//               fontWeight: FontWeight.w500,
//               color: Color(0xff414141),
//             ),
//           ),
//         );
//       },
//
//       showSearchBox: isShowSearchBox,
//       // This is used to automatically adjust the size of the dialog height based on its item count
//       fit: FlexFit.loose,
//       searchFieldProps: TextFieldProps(
//         decoration: InputDecoration(
//             isDense: true,
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(width: 0.5, color: Colors.grey.shade200),
//               borderRadius: BorderRadius.circular(10.0),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(10.0),
//               borderSide: BorderSide(width: 0.5, color: Colors.grey.shade200),
//             ),
//             prefixIcon: SvgPicture.asset(AssetsPath.search,
//                 colorFilter:
//                 const ColorFilter.mode(Colors.black26, BlendMode.srcIn)),
//             prefixIconConstraints: const BoxConstraints(
//                 minHeight: 10.0,
//                 minWidth: 20.0,
//                 maxHeight: 25.0,
//                 maxWidth: 35.0),
//             filled: true,
//             fillColor: Colors.grey.shade100,
//             hintText: 'Search Here',
//             hintStyle:
//             AppTextStyles.headline3.copyWith(fontSize: 14.0),
//             contentPadding: const EdgeInsets.all(12.0)),
//       ),
//     );
//   } else {
//     return PopupProps<T?>.modalBottomSheet(
//         listViewProps: const ListViewProps(
//             keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag),
//         searchFieldProps: TextFieldProps(
//           padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
//           decoration: InputDecoration(
//               isDense: true,
//               enabledBorder: OutlineInputBorder(
//                 borderSide: BorderSide(width: 0.5, color: Colors.grey.shade200),
//                 borderRadius: BorderRadius.circular(10.0),
//               ),
//               focusedBorder: OutlineInputBorder(
//                 borderRadius: BorderRadius.circular(10.0),
//                 borderSide: BorderSide(width: 0.5, color: Colors.grey.shade200),
//               ),
//               prefixIcon: SvgPicture.asset(AssetsPath.reset,
//                   colorFilter:
//                   const ColorFilter.mode(Colors.black26, BlendMode.srcIn)),
//               prefixIconConstraints: const BoxConstraints(
//                   minHeight: 10.0,
//                   minWidth: 20.0,
//                   maxHeight: 25.0,
//                   maxWidth: 35.0),
//               filled: true,
//               fillColor: Colors.grey.shade100,
//               hintText: 'Search Here',
//               hintStyle:
//               AppTextStyles.headline3.copyWith(fontSize: 14.0),
//               contentPadding: const EdgeInsets.all(12.0)),
//         ),
//         showSearchBox: true,
//         title: Padding(
//           padding: const EdgeInsets.symmetric(vertical: 15.0),
//           child: Text(
//             lableText,
//             textAlign: TextAlign.center,
//             style: AppTextStyles.cardText,
//           ),
//         ),
//         showSelectedItems: showSelectedItem,
//         // This is used to change the text style of the dropdown element
//         itemBuilder: !showSelectedItem
//             ? null
//             : (context, item, isSelected) {
//           return isSelected // Selected Item decoration
//               ? Container(
//             padding: const EdgeInsets.all(15),
//             color: isSelected ? Colors.grey.shade100 : null,
//             child: Text(itemAsString!(item).toString(),
//                 style: AppTextStyles.cardText),
//           )
//               : Padding(
//             padding: const EdgeInsets.all(15),
//             child: Text(itemAsString!(item).toString(),
//                 style: AppTextStyles.cardText
//                     .copyWith(fontWeight: FontWeight.w400)),
//           );
//         },
//         modalBottomSheetProps: const ModalBottomSheetProps(
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.only(
//                     topRight: Radius.circular(30),
//                     topLeft: Radius.circular(30)))));
//   }
// }
//
// InputBorder _getInputBorder(Color borderColor) {
//   return OutlineInputBorder(
//       borderSide: BorderSide(color: borderColor),
//       borderRadius: const BorderRadius.all(Radius.circular(10)));
// }
//
// InputDecoration customDropdownDecoration(
//     {required DropdownDecoration type,
//       required String labelText,
//       required bool isValidate,
//       bool isDense = true,
//       Widget? suffixIcon,
//       EdgeInsetsGeometry? contentPading}) {
//   if (type == DropdownDecoration.taxPrecent) {
//     return AppDropdownDecoration.taxPercent(
//         labelText, isValidate, contentPading);
//   } else if (type == DropdownDecoration.filter) {
//     return AppDropdownDecoration.filter(labelText, isValidate);
//   } else if (type == DropdownDecoration.tranasctionFillter) {
//     return AppDropdownDecoration.tranasctionFillter();
//   } else if (type == DropdownDecoration.borderNone) {
//     return AppDropdownDecoration.borderNone(labelText, isValidate,
//         isDense: isDense);
//   } else if (type == DropdownDecoration.filled) {
//     return AppDropdownDecoration.filled(labelText, isValidate, contentPading);
//   } else if (type == DropdownDecoration.quotesDropdown) {
//     return AppDropdownDecoration.quotesDropdown(
//         labelText, isValidate, contentPading);
//   } else if (type == DropdownDecoration.outline) {
//     return AppDropdownDecoration.normal(labelText, isValidate, contentPading)
//         .copyWith(
//         border: InputBorder.none,
//         focusedErrorBorder: _getInputBorder(Colors.red),
//         errorBorder: _getInputBorder(Colors.red),
//         enabledBorder: _getInputBorder(Colors.black12),
//         focusedBorder: _getInputBorder(AppColors.buttonColor));
//   } else {
//     return AppDropdownDecoration.normal(labelText, isValidate, contentPading);
//   }
// }
//
// Widget _newExistingWidget(bool isNew) {
//   return isNew
//       ? Container(
//     margin: const EdgeInsets.only(right: 10, left: 5),
//     padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(3.0),
//         color: const Color(0xff79d3ec),
//         border: Border.all(color: const Color(0xff79d3ec), width: 0.3)),
//     child: Text("New",
//         style: AppTextStyles.headline3
//             .copyWith(color: Colors.white)),
//   )
//       : Container(
//     margin: const EdgeInsets.only(right: 10, left: 5),
//     padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 3),
//     decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(3.0),
//         border: Border.all(color: const Color(0xffe67e22), width: 0.5)),
//     child: const Text(
//       "Existing",
//       style: TextStyle(fontSize: 12, color: Color(0xffe67e22)),
//     ),
//   );
// }
