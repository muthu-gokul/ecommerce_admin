import 'package:ecommerce_admin/notifiers/themeNotifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
class Arrow extends StatefulWidget {
  bool isOpen;
  Color color;
  Arrow({required this.isOpen,required this.color});
  @override
  _ArrowState createState() => _ArrowState();
}

class _ArrowState extends State<Arrow> with TickerProviderStateMixin{

  late Animation arrowAnimation;
  late AnimationController arrowAnimationController;

  @override
  void initState() {
    arrowAnimationController = AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    arrowAnimation = Tween(begin: 0.0, end: 3.14).animate(arrowAnimationController);
    if(widget.isOpen){
      arrowAnimationController.forward();
    }
    else{
      arrowAnimationController.reverse();
    }
    super.initState();
  }

  @override
  void didUpdateWidget(covariant Arrow oldWidget) {
    if(oldWidget.isOpen!=widget.isOpen){
      if(widget.isOpen){
        arrowAnimationController.forward();
      }
      else{
        arrowAnimationController.reverse();
      }
      // arrowAnimationController.isCompleted
      //     ? arrowAnimationController.reverse()
      //     : arrowAnimationController.forward();
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: 25,
      width: 25,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        //color: AppTheme.bgColor
      ),
      child:  AnimatedBuilder(
        animation: arrowAnimationController,
        builder: (context, child) =>
            Transform.rotate(
              angle: arrowAnimation.value,
              child: Icon(
                Icons.keyboard_arrow_down_outlined,
                size: 25.0,
                color: widget.color,
              ),
            ),
      ),
    );
  }
}