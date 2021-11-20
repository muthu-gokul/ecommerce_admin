import 'package:flutter/material.dart';

import 'popover_direction.dart';
import 'popover_item.dart';


Future<T?> showPopover<T extends Object>({
   required BuildContext context,
   WidgetBuilder? bodyBuilder,
  PopoverDirection direction = PopoverDirection.bottom,
  Color backgroundColor = const Color(0x8FFFFFFFF),
  Color barrierColor = const Color(0x80000000),
  Duration transitionDuration = const Duration(milliseconds: 200),
  double radius = 8,
  List<BoxShadow> shadow = const [
    BoxShadow(color: Color(0x1F000000), blurRadius: 5)
  ],
  double arrowWidth = 24,
  double arrowHeight = 12,
  double arrowDxOffset = 0,
  double arrowDyOffset = 0,
  double contentDyOffset = 0,
  double margin=0,
  bool barrierDismissible = true,
  double? width,
  double? height,
  VoidCallback? onPop,
  BoxConstraints? constraints,
  RouteSettings? routeSettings,
  String? barrierLabel,
  bool isCustom=false,
  double leftMargin=20,
  Key? key,
}) {
  constraints = (width != null || height != null)
      ? constraints?.tighten(width: width, height: height) ??
          BoxConstraints.tightFor(width: width, height: height)
      : constraints;

  return Navigator.of(context, rootNavigator: true).push<T>(
    RawDialogRoute<T>(
      pageBuilder: (_, __, ___) {
        return Builder(builder: (_) => const SizedBox.shrink());
      },
      barrierDismissible: barrierDismissible,
      barrierLabel: barrierLabel ??=
          MaterialLocalizations.of(context).modalBarrierDismissLabel,
      barrierColor: barrierColor,
      transitionDuration: transitionDuration,
      settings: routeSettings,
      transitionBuilder: (builderContext, animation, _, child) {
        return WillPopScope(
          onWillPop: () {
            if (onPop != null) {
              onPop();
              return Future.value(true);
            } else {
              return Future.value(true);
            }
          },
          child: FadeTransition(
            opacity: CurvedAnimation(parent: animation, curve: Curves.easeOut),
            child: PopoverItem(
              child: bodyBuilder!(builderContext),
              context: context,
              backgroundColor: backgroundColor,
              direction: direction,
              radius: radius,
              boxShadow: shadow,
              animation: animation,
              arrowWidth: arrowWidth,
              arrowHeight: arrowHeight,
              constraints: constraints,
              arrowDxOffset: arrowDxOffset,
              arrowDyOffset: arrowDyOffset,
              contentDyOffset: contentDyOffset,
              margin: margin,
              key: key,
              isCustom: isCustom,
              leftMargin: leftMargin,
            ),
          ),
        );
      },
    ),
  );
}
