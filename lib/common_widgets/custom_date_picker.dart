import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'common_import_helper.dart';

class CustomDatePicker {
  void getSingleDatePicker(
      BuildContext context,
      DateTime? date,
      Function onPicked, {
        bool validateFiscalYear = true,
        bool hidePastDate = false,
        bool hideFuture = false,
      }) async {
    DateTime? firstDate;
    DateTime? lastDate;
    // Date range only for current fisical year
    // if (AppConstants.dateRangeList.isNotEmpty && validateFiscalYear) {
    //   firstDate = AppConstants.dateRangeList[5].startDate!;
    //   lastDate = AppConstants.dateRangeList[5].endDate!;
    // }
    if (hideFuture) lastDate = DateTime.now();
    if (hidePastDate) firstDate = DateTime.now();
    await showCalendarDatePicker2Dialog(
      context: context,
      config: CalendarDatePicker2WithActionButtonsConfig(
        calendarType: CalendarDatePicker2Type.single,
        firstDate: firstDate,
        lastDate: lastDate,
      ),
      dialogBackgroundColor: Colors.white,
      dialogSize: const Size(325, 400),
      value: [date ?? DateTime.now()],
      borderRadius: BorderRadius.circular(15),
    ).then((value) {
      if (value != null) {
        onPicked(value.first);
      }
    });
  }

  void getDateRangePicker(BuildContext context, Function onPicked,
      {bool validateFiscalYear = true,
        int? datefilterRadioValue,
        DateTime? selectedFirstDate,
        DateTime? selectedLastDate}) async {
    DateTime? firstDate, lastDate, selectedFromDate, selectedToDate;
    bool isSelectedCustomDateRange = datefilterRadioValue != null &&
        datefilterRadioValue == AppConstants.dateRangeList.length - 1;

    if (isSelectedCustomDateRange) {
      selectedFromDate = selectedFirstDate;
      selectedToDate = selectedLastDate;
    }
    await showCalendarDatePicker2Dialog(
      context: context,
      config: CalendarDatePicker2WithActionButtonsConfig(
          firstDate: firstDate,
          lastDate: lastDate,
          calendarType: CalendarDatePicker2Type.range),
      dialogSize: const Size(325, 400),
      value: [selectedFromDate, selectedToDate],
      borderRadius: BorderRadius.circular(15),
    ).then((value) {
      if (value != null) {
        if (value.length == 2) {
          onPicked(value.first, value.last);
        } else {
          onPicked(value.first, value.first);
        }
      }
    });
  }
}
