import 'common_import_helper.dart';
import 'custom_widget.dart';

class CustomBottomSheet {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  final customWidget = CustomWidget();

  void showBottomSheet(
      BuildContext context,
      Widget widget, {
        bool showInnerDragHandle = false,
        bool showOuterDragHandle = false,
        bool viewInsets = false,
        bool isDismissible = true,
        Color? bgColor,
        double? elevation,
        Function()? whenCompleteCallBack,
      }) {
    showModalBottomSheet(
        isDismissible: isDismissible,
        elevation: elevation,
        backgroundColor: bgColor,
        showDragHandle: showInnerDragHandle,
        isScrollControlled: true,
        context: context,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.0),
            topRight: Radius.circular(15.0),
          ),
        ),
        clipBehavior: showOuterDragHandle ? null : Clip.antiAliasWithSaveLayer,
        builder: (BuildContext context) => viewInsets
            ? Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: widget)
            : widget).whenComplete(() {
      Future.microtask(
            () {
          whenCompleteCallBack ?? () => null;
        },
      );
    });
  }

  Widget header(
      String title, {
        Function()? callback,
      }) {
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 0.7, color: Color(0xffDADADB)),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 12.0, bottom: 12.0, left: 10.0, right: 10.0),
              child: Text(
                title,
                style: AppTextStyles.cardText,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 0.0, bottom: 0.0, right: 5.0),
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(25.0),
              child: InkWell(
                borderRadius: BorderRadius.circular(25.0),
                onTap: callback ??
                        () {
                      navigatorKey.currentState!.pop();
                    },
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Icon(
                        Icons.close,
                        size: 15,
                        color: Colors.grey.shade200,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomButton({
    bool visible = true,
    bool viewInsets = true,
    bool isEdit = false,
    bool enable = true,
    String saveText = "Save",
    String cancelText = "Cancel",
    Function()? onPressed1,
    Function()? onPressed2,
  }) {
    //for ios bottom padding
    double bottomPadding =
        MediaQuery.of(navigatorKey.currentContext!).viewPadding.bottom * 0.5;
    return Visibility(
      visible: visible,
      child: Container(
        margin: viewInsets
            ? MediaQuery.of(navigatorKey.currentContext!).viewInsets
            : null,
        padding:
        EdgeInsets.symmetric(horizontal: 15, vertical: 5 + bottomPadding),
        decoration: BoxDecoration(
            border:
            Border(top: BorderSide(color: Colors.grey.shade200))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 150.0,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: BorderSide(
                        width: 1.0, color: Colors.grey.shade200),
                    backgroundColor: Colors.white10),
                onPressed: onPressed1,
                child: Text(
                  cancelText,
                  style: const TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.w500,
                    color: Colors.black87,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 150.0,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(
                      width: 1.0,
                      color: enable
                          ? const Color(0xff1a73e8)
                          : Colors.grey.shade300),
                  backgroundColor:
                  enable ? const Color(0xff1a73e8) : Colors.grey.shade200,
                ),
                onPressed: enable ? onPressed2 : null,
                child: Text(
                  isEdit ? "Update" : saveText,
                  style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.w500,
                      color: enable ? Colors.white : Colors.grey),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }




}
