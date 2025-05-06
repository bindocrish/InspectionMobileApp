
import 'common_import_helper.dart';

Widget customTooltip(
    {required Widget child,
      required bool? visible,
      Color? color,
      Key? key,
      String message = "This field is not editable"}) {
  return TooltipVisibility(
    visible: visible ?? false,
    child: Tooltip(
        key: key,
        triggerMode: TooltipTriggerMode.tap,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(color: Colors.transparent),
        richMessage: WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: CustomPaint(
                painter: CustomStyleArrow(color: color),
                child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: color ?? const Color(0xff45535A)),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 10.0),
                    constraints: const BoxConstraints(maxWidth: 300),
                    child: Text(
                      message,
                      style:
                      AppTextStyles.cardText.copyWith(color: Colors.white),
                    )))),

        // showDuration: Duration(seconds: 1),
        // preferBelow: true,
        // verticalOffset: -10,
        child: child),
  );
}

class CustomStyleArrow extends CustomPainter {
  final Color? color;
  const CustomStyleArrow({this.color});
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color ?? const Color(0xff45535A)
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;

    const double triangleH = 10;
    const double triangleW = 25.0;
    final double width = size.width;
    final double height = size.height;

//top arow
    final Path trianglePath = Path()
      ..moveTo(width / 2 - triangleW / 2, 0) // Adjusted to start from top
      ..lineTo(width / 2, -triangleH) // Adjusted to go upward
      ..lineTo(width / 2 + triangleW / 2, 0) // Adjusted to end at top
      ..close();
//bottom arow
    // final Path trianglePath = Path()
    //   ..moveTo(width / 2 - triangleW / 2, height)
    //   ..lineTo(width / 2, triangleH + height)
    //   ..lineTo(width / 2 + triangleW / 2, height)
    //   ..close();

    canvas.drawPath(trianglePath, paint);
    final BorderRadius borderRadius = BorderRadius.circular(15);
    final Rect rect = Rect.fromLTRB(0, triangleH, width, height);
    final RRect outer = borderRadius.toRRect(rect);
    canvas.drawRRect(outer, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
