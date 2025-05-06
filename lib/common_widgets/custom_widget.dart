
import 'common_import_helper.dart';

class CustomWidget {
  final customStringHelper = CustomStringHelper();
  Widget custRowTextWidget(String label, dynamic data,
      {int maxLine = 1,
        bool isDateFormat = false,
        bool isAmount = false,
        Color? textColor = Colors.black54}) {
    String value = isDateFormat
        ? customStringHelper.dateFormat(data, AppConstants.ddMMMyyyy,
        opVal: "-")
        : customStringHelper.stringNullCheck(data, opVal: "-");
    return Padding(
        padding: const EdgeInsets.only(bottom: 10.0),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(flex: 3, child: Text(label, style: AppTextStyles.subtitle1)),
          Expanded(
              flex: 5,
              child: RichText(
                maxLines: maxLine,
                text: TextSpan(
                  text: ': ',
                  style: AppTextStyles.headline3,
                  children: <TextSpan>[
                    TextSpan(
                        text: isAmount ? " \u{20B9} $value" : value,
                        style: TextStyle(color: textColor))
                  ],
                ),
              ))
        ]));
  }
  Widget customScrollbar(
      {required Widget child,
        double radius = 10.0,
        Color thumpColor = const Color(0xFFc7c8c7),
        double thickness = 5,
        ScrollController? controller}) {
    return Theme(
      data: ThemeData(
          scrollbarTheme: ScrollbarThemeData(
              thumbColor: WidgetStateProperty.all(thumpColor))),
      child: Padding(
        padding: const EdgeInsets.only(right: 0.5),
        child: Scrollbar(
            thickness: thickness,
            radius: Radius.circular(radius),
            controller: controller,
            child: child),
      ),
    );
  }
  Widget getNoFoundWidget(
      {double? topPadding,
        double? bottomPadding,
        double? height,
        double? width,
        String text = "No Data Found !"}) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
            top: topPadding ?? 100.0, bottom: bottomPadding ?? 0.0),
        child: Center(
          child: Column(
            children: [
              Image.asset("assets/images/nodata.png",height: 400,width: 400,),

              Text(text,
                  style: AppTextStyles.cardText
                      .copyWith(color: const Color(0xFF93A3CA))),
            ],
          ),
        ),
      ),
    );
  }
}